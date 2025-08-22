package po

import (
	"github.com/shopspring/decimal"
	"gorm.io/gorm"
	"restaurant_backend/restaurant_rpc"
)

type RoleType struct {
	gorm.Model
	Name string `gorm:"unique;not null"`
}

type Employee struct {
	gorm.Model
	Name string
	Phone string
	Password string
	Salary decimal.Decimal `gorm:"type:decimal(10,2)"`
	RoleType restaurant_rpc.EmployeeRole // 员工角色
	ManagerID *uint
	Group []Employee `gorm:"foreignKey:ManagerID"` // 角色Manager该字段才可能不为空
}

type Customer struct {
	gorm.Model
	Username string `gorm:"not null;unique"`
	Phone string
	Password string `gorm:"not null"`
	Coupon []Coupon `gorm:"many2many2:customer_coupon;foreignKey:CustomerID"` // 用户持有的优惠券
}


