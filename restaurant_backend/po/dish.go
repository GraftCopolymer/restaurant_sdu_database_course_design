package po

import (
	"github.com/shopspring/decimal"
	"gorm.io/gorm"
	"restaurant_backend/po/pb"
)

type Dish struct {
	gorm.Model
	Name string `gorm:"unique"`
	SellStatus pb.SellStatus
	Portions []Portion `gorm:"foreignKey:DishID"`
}

// Portion 菜品的份量(小份、中份、大份)
type Portion struct {
	gorm.Model
	DishID uint
	Name string // 根据不同的菜品类型可以有不同的名称, 例如奶茶是小杯, 而非小份
	PortionType pb.DishPortion
	Dish Dish `gorm:"foreignKey:DishID"`
	Recipes []Recipe
}

type Material struct {
	gorm.Model
	Name string `gorm:"unique"`
	UintType pb.UintType // 计量单位
	Amount float64 // 总量, 其含义取决于计量单位
	Price decimal.Decimal `gorm:"type:decimal(10,2)"` // 单价
	Recipes []Recipe
}

// DishMaterialConsume 菜品消耗的材料数量
type Recipe struct {
	gorm.Model
	PortionID uint
	MaterialID uint
	Quantity float64 // 含义取决于Material的计量单位

	Portion Portion `gorm:"foreignKey:PortionID"`
	Material Material `gorm:"foreignKey:MaterialID"`
}
