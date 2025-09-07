package po

import (
	"github.com/shopspring/decimal"
	"gorm.io/gorm"
	restaurant_rpc "restaurant_backend/restaurant_backend/rpc"
)

type Dish struct {
	gorm.Model
	Name string `gorm:"unique"`
	SellStatus restaurant_rpc.SellStatus
	Portions []Portion `gorm:"foreignKey:DishID"`

	DishTypeID uint
	DishType DishType `gorm:"foreignKey:DishTypeID"`
}

// DishType 菜品种类
type DishType struct {
	gorm.Model
	Name string `gorm:"unique;not null"`
}

// Portion 菜品的份量(小份、中份、大份)
type Portion struct {
	gorm.Model
	DishID uint
	Name string // 根据不同的菜品类型可以有不同的名称, 例如奶茶是小杯, 而非小份
	PortionType restaurant_rpc.PortionType
	Price decimal.Decimal `gorm:"type:decimal(10,2)"`
	Dish Dish `gorm:"foreignKey:DishID"`

	RecipeID uint
	Recipe Recipe `gorm:"foreignKey:RecipeID"`
}

type Material struct {
	gorm.Model
	Name string `gorm:"unique"`
	UintType restaurant_rpc.UnitType // 计量单位
	Amount decimal.Decimal `gorm:"type:decimal(10,2)"` // 总量, 其含义取决于计量单位
	Price decimal.Decimal `gorm:"type:decimal(10,2)"` // 单价
}

// Recipe DishMaterialConsume 菜品消耗的材料数量
type Recipe struct {
	gorm.Model
	Materials []RecipeMaterial `gorm:"foreignKey:RecipeID"`
}

type RecipeMaterial struct {
	gorm.Model
	RecipeID uint `gorm:"uniqueIndex:idx_recipe_material"`
	Recipe Recipe `gorm:"foreignKey:RecipeID"`

	MaterialID uint `gorm:"uniqueIndex:idx_recipe_material"`
	Material Material `gorm:"foreignKey:MaterialID"`

	Quantity decimal.Decimal `gorm:"type:decimal(10,2)"` // 含义取决于Material的计量单位
}
