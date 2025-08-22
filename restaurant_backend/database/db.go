package database

import (
	"gorm.io/gorm"
	"restaurant_backend/config"
)

var db *gorm.DB = config.InitDatabase()

func DB() *gorm.DB {
	return db
}
