package my_utils

import (
	"context"
	"encoding/base64"
	"encoding/json"
	"errors"
	"github.com/golang-jwt/jwt/v5"
	"github.com/shopspring/decimal"
	"golang.org/x/crypto/bcrypt"
	metadata2 "google.golang.org/grpc/metadata"
	config2 "restaurant_backend/config"
	"restaurant_backend/constants"
	"restaurant_backend/po"
	"restaurant_backend/restaurant_backend/rpc"
	"strings"
	"time"
)

type Token struct {
	UserID uint `json:"user_id"`
	TokenType constants.TokenType `json:"token_type"`
	Role restaurant_rpc.LoginRole `json:"role"`
	EmployeeRole restaurant_rpc.EmployeeRole `json:"employee_type"`
	Exp int64 `json:"exp"`
	jwt.RegisteredClaims
}

// HashPassword 计算密码哈希值
func HashPassword(password string) (string, error) {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	return string(bytes), err
}

// CheckPassword 检查密码哈希是否匹配
func CheckPassword(password string, hash string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(password))
	return err == nil
}

func GenerateAccessJWT(userID uint, role restaurant_rpc.LoginRole, employeeRole *restaurant_rpc.EmployeeRole) (string, error) {
	claims := jwt.MapClaims{
		"user_id": userID,
		"token_type": constants.TokenTypeAccess,
		"role": role,
		"employee_type": employeeRole,
		"exp": time.Now().Add(24 * time.Hour * 7).Unix(),
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(config2.Config.Auth.JwtSecretKey))
}

func GenerateRefreshJWT(userID uint, role restaurant_rpc.LoginRole, employeeRole *restaurant_rpc.EmployeeRole) (string, error) {
	claims := jwt.MapClaims{
		"user_id": userID,
		"token_type": constants.TokenTypeRefresh,
		"role": role,
		"employee_type": employeeRole,
		"exp": time.Now().Add(24 * time.Hour * 14).Unix(),
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(config2.Config.Auth.JwtSecretKey))
}

func ParseJWT2Struct(tokenString string) (*Token, error) {
	tokenString = strings.TrimPrefix(tokenString, "Bearer ")
	parsed, err := jwt.ParseWithClaims(tokenString, &Token{}, func(token *jwt.Token) (interface{}, error) {
		// 校验签名算法是否为 HMAC-SHA256
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, errors.New("不支持的签名方法")
		}
		return []byte(config2.Config.Auth.JwtSecretKey), nil
	})
	if err != nil {
		return nil, err
	}

	claims, ok := parsed.Claims.(*Token)
	if !ok || !parsed.Valid {
		return nil, errors.New("无效的 token")
	}

	//userIDFloat, ok := claims["user_id"].(float64)
	//if !ok {
	//	return nil, errors.New("user_id 字段错误")
	//}
	//expFloat, ok := claims["exp"].(float64)
	//if !ok {
	//	return nil, errors.New("exp 字段错误")
	//}
	//tokenTypeStr, ok := claims["token_type"].(constants.TokenType)
	//if !ok {
	//	return nil, errors.New("token_type 字段错误")
	//}
	//roleFloat, ok := claims["role"].(float64) // 如果 LoginRole 是枚举（int 类型）
	//if !ok {
	//	return nil, errors.New("role 字段错误")
	//}

	return claims, nil
}

func ExtractUserInfoFromContext(ctx context.Context) (*Token, bool) {
	metadata, ok := metadata2.FromIncomingContext(ctx)
	if !ok {
		return nil, ok
	}
	if values := metadata.Get("authorization"); len(values) > 0 {
		// 解析Token信息
		if token, err := ParseJWT2Struct(values[0]); err != nil {
			return nil, false
		} else {
			return token, true
		}
	} else {
		return nil, false
	}
}

// IsJwtExpired 判断 JWT 是否已过期
func IsJwtExpired(token string) (bool, error) {
	parts := strings.Split(token, ".")
	if len(parts) != 3 {
		return false, errors.New("无效的 JWT 格式")
	}

	payload := parts[1]
	// 补齐 Base64 URL 的 padding
	if m := len(payload) % 4; m != 0 {
		payload += strings.Repeat("=", 4-m)
	}

	decoded, err := base64.RawURLEncoding.DecodeString(payload)
	if err != nil {
		return false, err
	}

	var payloadMap map[string]interface{}
	if err := json.Unmarshal(decoded, &payloadMap); err != nil {
		return false, err
	}

	expVal, ok := payloadMap["exp"]
	if !ok {
		return false, errors.New("payload 中缺少 exp 字段")
	}

	// exp 必须是数字
	expFloat, ok := expVal.(float64)
	if !ok {
		return false, errors.New("exp 字段类型错误")
	}
	exp := int64(expFloat)

	now := time.Now().UTC().Unix()
	return now >= exp, nil
}

// ExtractAndProcessPagination 提取分页数据中的页码和每页数量
func ExtractAndProcessPagination(pageInfo *restaurant_rpc.PageInfo) (int, int, error) {
	if pageInfo == nil {
		return 0, 0, errors.New("pageInfo is nil")
	}
	page, pageSize := int(pageInfo.Page), int(pageInfo.PageSize)
	if page <= 0 {
		page = 1
	}
	if pageSize <= 0 {
		pageSize = 10
	} else if pageSize > 100 {
		pageSize = 100
	}
	return page, pageSize, nil
}

// Filter 遍历切片并返回满足条件的元素
func Filter[T any](list []T, predicate func(T) bool) []T {
	var result []T
	for _, v := range list {
		if predicate(v) {
			result = append(result, v)
		}
	}
	return result
}

func SafePageInfo(page uint32, pageSize uint32) (int, int) {
	sPage, sPageSize := page, pageSize
	if sPage <= 0 {
		sPage = 1
	}
	if sPageSize <= 0 {
		sPageSize = 10
	} else if sPageSize > 100 {
		sPageSize = 100
	}
	return int(sPage), int(sPageSize)
}

func GetCostTypeDesc(costType restaurant_rpc.CostType) string {
	if costType == restaurant_rpc.CostType_COST_TYPE_MATERIAL {
		return "配料成本"
	} else if costType == restaurant_rpc.CostType_COST_TYPE_LABOR {
		return "人工费/薪资"
	} else if costType == restaurant_rpc.CostType_COST_TYPE_ELECTRICITY {
		return "电费成本"
	} else if costType == restaurant_rpc.CostType_COST_TYPE_WATER {
		return "水费成本"
	} else if costType == restaurant_rpc.CostType_COST_TYPE_GAS {
		return "天然气成本"
	} else if costType == restaurant_rpc.CostType_COST_TYPE_EQUIPMENT {
		return "设备成本"
	} else if costType == restaurant_rpc.CostType_COST_TYPE_CONSUMABLE {
		return "消耗品成本"
	} else if costType == restaurant_rpc.CostType_COST_TYPE_MARKETING {
		return "营销成本"
	} else if costType == restaurant_rpc.CostType_COST_TYPE_RENT {
		return "租金"
	} else if costType == restaurant_rpc.CostType_COST_TYPE_MANAGEMENT {
		return "行政管理费"
	} else {
		return "其他"
	}
}

func CalcRecipeCost(recipe po.Recipe) decimal.Decimal {
	// 计算配方成本
	total := decimal.NewFromInt(0)
	for _, material := range recipe.Materials {
		total = total.Add(material.Material.Price.Mul(material.Quantity))
	}
	return total
}
