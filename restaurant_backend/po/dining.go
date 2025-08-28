package po

import (
	"gorm.io/gorm"
	"restaurant_backend/restaurant_backend/types"
)

type RoomPosition struct {
	gorm.Model
	Level int
	X int // 给APP端用于绘制桌子位置
	Y int
}

type TablePosition struct {
	gorm.Model
	X int
	Y int
}

type PrivateRoom struct {
	gorm.Model
	Name string `gorm:"unique"`
	// 包间位置
	PositionID uint
	Position RoomPosition `gorm:"foreignKey:PositionID"`
	// 包间类型
	Type types.RoomType
	// 桌子
	Tables []DiningTable `gorm:"foreignKey:RoomID"`
}

type DiningTable struct {
	gorm.Model
	Number uint `gorm:"unique"`
	TableShape types.TableShape
	RoomID uint // 属于哪个包间
	Seats []Seat `gorm:"foreignKey:TableID"`

	PositionID uint
	Position TablePosition `gorm:"foreignKey:PositionID"`
}

// Seat 座位
type Seat struct {
	gorm.Model
	X int // X坐标, 相对于桌子中心
	Y int // Y坐标, 相对于桌子中心
	RotateAngle float64 // 椅子的旋转角度, 弧度制, 正值为顺时针旋转, 0时座位正面朝向右边
	TableID uint // 属于哪个桌子
}
