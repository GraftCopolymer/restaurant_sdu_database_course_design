package config

import (
	"github.com/goccy/go-yaml"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"log"
	"os"
	"restaurant_backend/po"
)

const ConfigPath = "./config.yaml"
var Config ConfigModel = LoadConfig()

func InitDatabase() *gorm.DB {
	dsn := "host=127.0.0.1 user=graftcopolymer password=0613 dbname=restaurant port=5432 sslmode=disable"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Failed to connect to database")
	}
	err = db.AutoMigrate(
		&po.RoleType{},
		&po.Employee{},
		&po.Customer{},
		//&po.Coupon{},
		//&po.CouponUsage{},
		&po.Order{},
		&po.Dish{},
		&po.Portion{},
		&po.OrderDishPortion{},
		&po.Material{},
		&po.Recipe{},
		//&po.RoomPosition{},
		//&po.TablePosition{},
		//&po.PrivateRoom{},
		&po.DiningTable{},
		&po.Seat{},
		&po.DishType{},
		&po.RecipeMaterial{},
		&po.Cost{},
	)
	if err != nil {
		log.Fatal("failed to migrate database:", err)
	}
	return db
}

func LoadConfig() ConfigModel {
	// 解析yaml配置文件
	data, err := os.ReadFile(ConfigPath)
	if err != nil {
		log.Fatal("Failed to load ", ConfigPath)
	}
	var config ConfigModel
	if err = yaml.Unmarshal(data, &config); err != nil {
		log.Fatal("Failed to parse ", ConfigPath)
	}
	return config
}