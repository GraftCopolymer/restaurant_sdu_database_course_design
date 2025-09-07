package po

import (
	"github.com/shopspring/decimal"
	"gorm.io/gorm"
	restaurant_rpc "restaurant_backend/restaurant_backend/rpc"
)

type Cost struct {
	gorm.Model
	CostType restaurant_rpc.CostType
	Value decimal.Decimal // 金额

	Description string // 成本项描述
}