package database

import (
	"restaurant_backend/po"
	restaurant_rpc "restaurant_backend/restaurant_backend/rpc"
)

func PODish2PBDish(poDish po.Dish) *restaurant_rpc.Dish {
	// 加载DishPortion
	var dishPortions []*restaurant_rpc.DishPortion
	for _, portion := range poDish.Portions {
		// 加载配方的配料列表
		var recipeMaterials []*restaurant_rpc.RecipeMaterial
		for _, material := range portion.Recipe.Materials {
			recipeMaterials = append(recipeMaterials, &restaurant_rpc.RecipeMaterial{
				Id: uint32(material.ID),
				Material: &restaurant_rpc.Material{
					Id: uint32(material.Material.ID),
					Name: material.Material.Name,
					Price: material.Material.Price.StringFixed(2),
					UnitType: material.Material.UintType,
					Amount: material.Material.Amount.StringFixed(2),
				},
				Quantity: material.Quantity.StringFixed(2),
			})
		}
		dishPortions = append(dishPortions, &restaurant_rpc.DishPortion{
			Id: uint32(portion.ID),
			Name: portion.Name,
			Price: portion.Price.StringFixed(2),
			PortionType: portion.PortionType,
			Recipe: &restaurant_rpc.Recipe{
				Id: uint32(portion.Recipe.ID),
				Materials: recipeMaterials,
			},
		})
	}
	pbDish := &restaurant_rpc.Dish{
		Id: uint32(poDish.ID),
		Name: poDish.Name,
		ImageUrl: "",
		DishType: &restaurant_rpc.DishType{
			DishTypeID: uint32(poDish.DishTypeID),
			Name: poDish.DishType.Name,
		},
		Portions: dishPortions,
	}
	return pbDish
}
