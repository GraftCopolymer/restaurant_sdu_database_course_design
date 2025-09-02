package po

import (
	"gorm.io/gorm"
	"restaurant_backend/restaurant_backend/types"
)

//type PrivateRoom struct {
//	gorm.Model
//	Name string `gorm:"unique"`
//	// 包间类型
//	Type types.RoomType
//	// 桌子
//	Tables []DiningTable `gorm:"foreignKey:RoomID"`
//}

type DiningTable struct {
	gorm.Model
	Number string `gorm:"unique"`
	TableShape types.TableShape
	Seats []Seat `gorm:"foreignKey:TableID"`
}

// Seat 座位
type Seat struct {
	gorm.Model
	X int // X坐标, 相对于桌子中心
	Y int // Y坐标, 相对于桌子中心
	RotateAngle float64 // 椅子的旋转角度, 弧度制, 正值为顺时针旋转, 0时座位正面朝向右边
	TableID uint `gorm:"not null;uniqueIndex:idx_table_seat"` // 属于哪个桌子
	SeatNumber string `gorm:"not null;uniqueIndex:idx_table_seat"`
}
