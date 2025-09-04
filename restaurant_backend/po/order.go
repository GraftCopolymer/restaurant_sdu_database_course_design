package po

import (
	"github.com/shopspring/decimal"
	"gorm.io/gorm"
	"restaurant_backend/restaurant_backend/types"
)

//type Coupon struct {
//	gorm.Model
//	CustomerID uint
//	Code        string          `gorm:"uniqueIndex;size:20"` // 优惠码
//	Description *string          // 优惠描述
//	StartTime   time.Time       // 生效时间
//	EndTime     time.Time       // 过期时间
//	MaxUsage    int             // 最大使用次数
//	UsedCount   int             // 已使用次数
//	SpendRequirement decimal.Decimal `gorm:"type:decimal(10,2)"` // 优惠券门槛
//	Discount    decimal.Decimal `gorm:"type:decimal(10,2)"` // 优惠金额或折扣率
//	Type        types.CouponType   // 优惠类型: 固定金额/百分比折扣/满减
//	Scope       types.CouponScope  // 作用范围: 订单级/菜品级
//	TargetType  types.CouponTarget // 目标类型: 菜品/份量
//
//	// 关联关系
//	ApplicableDishes  []Dish    `gorm:"many2many:coupon_dishes"` // 适用菜品
//	ApplicablePortions []Portion `gorm:"many2many:coupon_portions"` // 适用份量
//}

// CouponUsage 优惠券使用记录
//type CouponUsage struct {
//	gorm.Model
//	CouponID uint
//	OrderID uint
//	CustomerID uint
//	Discount decimal.Decimal `gorm:"type:decimal(10,2)"` // 实际优惠金额
//
//	Coupon Coupon `gorm:"foreignKey:CouponID"`
//	Order Order `gorm:"foreignKey:OrderID"`
//	Customer Customer `gorm:"foreignKey:CustomerID"`
//}

type Order struct {
	gorm.Model
	Address *string
	OrderType types.OrderType

	TableID *uint
	SeatID *uint // 为nil时被视为整桌菜单
	CustomerID uint32 // 订单客户
	Table *DiningTable `gorm:"foreignKey:TableID"`
	Seat *Seat `gorm:"foreignKey:SeatID"`
	Customer Customer `gorm:"foreignKey:CustomerID"`

	//OriginalTotal decimal.Decimal `gorm:"type:decimal(10,2)"` // 原始金额
	//Discount decimal.Decimal `gorm:"type:decimal(10,2)"` // 总优惠金额
	Total decimal.Decimal `gorm:"type:decimal(10,2)"` // 实付金额
	//CouponUsage []CouponUsage `gorm:"foreignKey:OrderID"` // 优惠券使用记录

	/* 以下是宴席模式相关字段 */
	//ParentID uint
	//ParentOrder *Order `gorm:"foreignKey:ParentID"` // 父订单, 为nil时说明是主订单
	//ChildrenOrder []Order `gorm:"foreignKey:ParentID"` // 子订单
}

type OrderDishPortion struct {
	gorm.Model
	OrderID uint `gorm:"uniqueIndex:idx_order_dish_portion"`
	DishID uint `gorm:"uniqueIndex:idx_order_dish_portion"`
	PortionID uint `gorm:"uniqueIndex:idx_order_dish_portion"`

	Order Order `gorm:"foreignKey:OrderID"`
	Dish Dish `gorm:"foreignKey:DishID"`
	Portion Portion `gorm:"foreignKey:PortionID"`
	Count int // 份量
}
