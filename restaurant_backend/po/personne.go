package po

import (
	"github.com/shopspring/decimal"
	"gorm.io/gorm"
)

type RoleType struct {
	gorm.Model
	Name string `gorm:"unique;not null"`
}

type Employee struct {
	gorm.Model
	Name string
	Phone string
	Salary decimal.Decimal `gorm:"type:decimal(10,2)"`
	RoleTypeId uint
	RoleType RoleType `gorm:"foreignKey:RoleTypeId"`
	ManagerID *uint
	Group []Employee `gorm:"foreignKey:ManagerID"` // 角色Manager该字段才可能不为空
}

type Customer struct {
	gorm.Model
	Account string `gorm:"unique"`
	Nickname string
	Phone *string
	Coupon []Coupon `gorm:"many2many2:customer_coupon;foreignKey:CustomerID"` // 用户持有的优惠券
}


