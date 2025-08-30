package rpc_impl

import (
	"context"
	"errors"
	"github.com/shopspring/decimal"
	"google.golang.org/protobuf/types/known/emptypb"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"restaurant_backend/database"
	myutils "restaurant_backend/my_utils"
	"restaurant_backend/po"
	"restaurant_backend/restaurant_backend/rpc"
	"restaurant_backend/restaurant_backend/types"
	"strings"
)

type DishServer struct {
    restaurant_rpc.UnimplementedDishServiceServer
}


func (s *DishServer) GetDishes(ctx context.Context, req *restaurant_rpc.GetDishesReq) (*restaurant_rpc.GetDishesResp, error) {
	page, pageSize := req.PageInfo.Page, req.PageInfo.PageSize
	if page <= 0 {
		page = 1
	}
	if pageSize <= 0 {
		pageSize = 10
	} else if pageSize > 100 {
		pageSize = 100
	}
	keyword := strings.TrimSpace(req.Keywords)

	var poDishes []po.Dish
	err := database.DB().Model(&po.Dish{}).
		Scopes(database.Paginate(int(page), int(pageSize))).
		Where("name ILIKE ?", "%"+keyword+"%").
		Preload("DishType").
		Preload("Portions").
		Preload("Portions.Recipe").
		Preload("Portions.Recipe.Materials").
		Preload("Portions.Recipe.Materials.Material").
		Find(&poDishes).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	var dishes []*restaurant_rpc.Dish
	for _, dish := range poDishes {
		// 加载DishPortion
		var dishPortions []*restaurant_rpc.DishPortion
		for _, portion := range dish.Portions {
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
		dishes = append(dishes, &restaurant_rpc.Dish{
			Id: uint32(dish.ID),
			Name: dish.Name,
			ImageUrl: "",
			DishType: &restaurant_rpc.DishType{
				DishTypeID: uint32(dish.DishTypeID),
				Name: dish.DishType.Name,
			},
			Portions: dishPortions,
		})
	}

	return &restaurant_rpc.GetDishesResp{
		Dishes: dishes,
	}, nil
}

func (s *DishServer) GetDishType(ctx context.Context, req *emptypb.Empty) (*restaurant_rpc.GetDishTypeResp, error) {
	var dishTypes []po.DishType
	err := database.DB().Model(&po.DishType{}).Find(&dishTypes).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	var resultData []*restaurant_rpc.DishType
	for _, v := range dishTypes {
		resultData = append(resultData, &restaurant_rpc.DishType{
			DishTypeID: uint32(v.ID),
			Name: v.Name,
		})
	}
	resp := &restaurant_rpc.GetDishTypeResp{
		DishTypes: resultData,
	}
	return resp, nil
}

func (s *DishServer) AddDishType(ctx context.Context, req *restaurant_rpc.AddDishTypeReq) (*restaurant_rpc.AddDishTypeResp, error) {
	typeName := strings.TrimSpace(req.TypeName)
	if typeName == "" {
		return nil, errors.New("种类名称不能为空")
	}
	// 查询当前是否已存在该名字
	var exist bool
	err := database.DB().Model(&po.DishType{}).Where("name = ?", typeName).Select("1").Scan(&exist).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	if exist {
		return nil, errors.New("该种类已存在")
	}
	// 添加进数据库
	dishType := po.DishType{
		Name: typeName,
	}
	err = database.DB().Create(&dishType).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	resp := restaurant_rpc.AddDishTypeResp{
		DishTypeID: uint32(dishType.ID),
		TypeName: dishType.Name,
	}
	return &resp, nil
}

func (s *DishServer) GetMaterials(ctx context.Context, req *restaurant_rpc.GetMaterialsReq) (*restaurant_rpc.GetMaterialsResp, error) {
	keywords := strings.TrimSpace(req.Keywords);
	page, pageSize := req.PageInfo.Page, req.PageInfo.PageSize
	if page <= 0 {
		page = 1
	}
	if pageSize <= 0{
		pageSize = 10
	} else if pageSize > 100 {
		pageSize = 100
	}
	var materialList []po.Material
	var count int64
	err := database.DB().Scopes(database.Paginate(int(page), int(pageSize))).Model(&po.Material{}).Where("name ILIKE ?", "%"+keywords+"%").Find(&materialList).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	err = database.DB().Model(&po.Material{}).Count(&count).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	var respMaterialList []*restaurant_rpc.Material
	for _, material := range materialList {
		respMaterialList = append(respMaterialList, &restaurant_rpc.Material{
			Id: uint32(material.ID),
			Name: material.Name,
			Price: material.Price.StringFixed(2),
			UnitType: material.UintType,
			Amount: material.Amount.StringFixed(2),
		})
	}
	return &restaurant_rpc.GetMaterialsResp{
		MaterialList: respMaterialList,
		PageInfo: &restaurant_rpc.PageInfo{
			Page:     page,
			PageSize: pageSize,
			Total: uint64(count),
		},
	}, nil
}

func (s *DishServer) CreateOrEditMaterial(ctx context.Context, req *restaurant_rpc.CreateOrEditMaterialReq) (*restaurant_rpc.CreateOrEditMaterialResp, error) {
	// 确定是更新还是编辑
	material := req.Material
	if id := material.GetId(); id != 0 { // 编辑模式
		var dbMaterial po.Material
		// 检查该名称是否已经被使用
		var checkNameExistList []po.Material
		err := database.DB().Model(&po.Material{}).Where("name = ?", material.Name).Find(&checkNameExistList).Error
		if err != nil {
			return nil, errors.New("服务器错误")
		}
		for _, v := range checkNameExistList {
			if v.ID != uint(id) {
				return nil, errors.New("该名称已被使用")
			}
		}
		err = database.DB().Model(&po.Material{}).Where("id = ?", id).First(&dbMaterial).Error
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("该配料不存在")
		}
		if err != nil {
			return nil, errors.New("服务器错误")
		}
		dbMaterial.Name = material.Name
		dbMaterial.Price, err = decimal.NewFromString(material.Price)
		if err != nil {
			return nil, errors.New("价格格式不合法")
		}
		am, err := decimal.NewFromString(material.Amount)
		if err != nil {
			return nil, errors.New("总量的数据格式不合法")
		}
		dbMaterial.Amount = am
		dbMaterial.UintType = material.UnitType
		err = database.DB().Save(&dbMaterial).Error
		if err != nil {
			return nil, errors.New("服务器错误")
		}
		return &restaurant_rpc.CreateOrEditMaterialResp{
			MaterialId: uint32(dbMaterial.ID),
		}, nil
	} else { // 创建模式
		price, err := decimal.NewFromString(material.Price)
		if err != nil {
			return nil, errors.New("服务器错误")
		}
		am, err := decimal.NewFromString(material.Amount)
		if err != nil {
			return nil, errors.New("总量数据不合法")
		}
		newMaterial := po.Material{
			Name: material.Name,
			Price: price,
			Amount: am,
			UintType: material.UnitType,
		}
		err = database.DB().Create(&newMaterial).Error
		if err != nil {
			return nil, errors.New("服务器错误")
		}
		return &restaurant_rpc.CreateOrEditMaterialResp{
			MaterialId: uint32(newMaterial.ID),
		}, nil
	}
}

func (s *DishServer) CreateOrEditDish(ctx context.Context, req *restaurant_rpc.CreateOrEditDishReq) (*emptypb.Empty, error) {
	// 确定是新增还是编辑
	if id := req.Dish.GetId(); id <= 0 { // 新增
		// 查询是否有重复的名字
		name := strings.TrimSpace(req.Dish.Name)
		if name == "" {
			return nil, errors.New("名字不能为空")
		}
		var exists bool
		err := database.DB().Model(&po.Dish{}).Where("name = ?", name).Select("1").Scan(&exists).Error
		if err != nil {
			return nil, errors.New("服务器错误")
		}
		if exists {
			return nil, errors.New("菜名已存在")
		}
		tx := database.DB().Begin()
		if tx.Error != nil {
			tx.Rollback()
			return nil, errors.New("服务器错误")
		}
		defer func() {
			if r := recover(); r != nil {
				tx.Rollback()
			}
		}()
		pbDish := req.Dish
		// 插入 DishType
		// 先查询有无该DishType
		dishTypeId := pbDish.DishType.DishTypeID
		var dishType po.DishType
		err = tx.Model(&po.DishType{}).Where("id = ?", dishTypeId).First(&dishType).Error
		if errors.Is(err, gorm.ErrRecordNotFound) {
			err1 := tx.Create(&dishType).Error
			if err1 != nil {
				tx.Rollback()
				return nil, errors.New("服务器错误")
			}
		}
		if err != nil {
			tx.Rollback()
			return nil, errors.New("服务器错误")
		}
		var dish = &po.Dish{
			Name: pbDish.Name,
			SellStatus: types.SellStatus_SELL_STATUS_SELLING,
			DishTypeID: dishType.ID,
			DishType: dishType,
		}
		err = tx.Create(&dish).Error
		if err != nil {
			tx.Rollback()
			return nil, errors.New("服务器错误")
		}
		// 插入对应的 portion 记录
		var portion []*po.Portion
		for _, pbPortion := range pbDish.Portions {
			// 先尝试插入 Recipe
			recipe := pbPortion.Recipe
			poRecipe := &po.Recipe{
				Model: gorm.Model{
					ID: uint(recipe.GetId()),
				},
			}
			if recipeId := poRecipe.ID; recipeId <= 0 {
				// 该 Recipe不存在, 需要插入
				err2 := tx.Create(&poRecipe).Error
				if err2 != nil {
					tx.Rollback()
					return nil ,errors.New("服务器错误")
				}
			}
			materialList := recipe.GetMaterials()
			// 插入 RecipeMaterial 记录
			var poRecipeMaterial []po.RecipeMaterial
			for _, recipeMaterial := range materialList {
				am, err := decimal.NewFromString(recipeMaterial.Quantity)
				if err != nil {
					return nil, errors.New("用量数据不合法")
				}
				poRecipeMaterial = append(poRecipeMaterial, po.RecipeMaterial{
					MaterialID: uint(recipeMaterial.Material.Id),
					RecipeID:   poRecipe.ID,
					Quantity:   am,
				})
			}
			if len(poRecipeMaterial) > 0 {
				err3 := tx.Clauses(clause.OnConflict{
					Columns: []clause.Column{
						{Name: "recipe_id"},
						{Name: "material_id"},
					},
					DoUpdates: clause.AssignmentColumns([]string{"quantity"}),
				}).Create(&poRecipeMaterial).Error
				if err3 != nil {
					tx.Rollback()
					return nil, errors.New("服务器错误")
				}
			}
			price, err1 := decimal.NewFromString(pbPortion.Price);
			if err1 != nil {
				tx.Rollback()
				return nil, errors.New("服务器错误")
			}

			portion = append(portion, &po.Portion{
				DishID: dish.ID,
				Name: pbPortion.Name,
				PortionType: pbPortion.PortionType,
				Price: price,
				RecipeID: poRecipe.ID,
			})
		}
		err = tx.Create(&portion).Error
		if err != nil {
			tx.Rollback()
			return nil, errors.New("服务器错误")
		}
		// 提交事务
		if err4 := tx.Commit().Error; err4 != nil {
			return nil, errors.New("服务器错误")
		}
		return &emptypb.Empty{}, nil
	} else { // 编辑
		// 1) 校验名称唯一
		name := strings.TrimSpace(req.Dish.Name)
		if name == "" {
			return nil, errors.New("名字不能为空")
		}
		var dup []po.Dish
		if err := database.DB().Where("name = ?", name).Find(&dup).Error; err != nil {
			return nil, errors.New("服务器错误")
		}
		for _, d := range dup {
			if uint32(d.ID) != id {
				return nil, errors.New("菜名已存在")
			}
		}

		tx := database.DB().Begin()
		if tx.Error != nil {
			return nil, errors.New("服务器错误")
		}
		defer func() {
			if r := recover(); r != nil {
				tx.Rollback()
			}
		}()

		pbDish := req.Dish

		// 2) 取出原始 Dish
		var dish po.Dish
		if err := tx.First(&dish, id).Error; err != nil {
			tx.Rollback()
			return nil, errors.New("菜品不存在")
		}

		// 3) DishType 处理（不存在则创建/存在则使用）
		var dishType po.DishType
		dishTypeID := uint(pbDish.DishType.DishTypeID)
		if dishTypeID > 0 {
			err := tx.First(&dishType, dishTypeID).Error
			if errors.Is(err, gorm.ErrRecordNotFound) {
				// 若客户端只给了 ID，但库中无记录，这里可选择报错或创建；以下示例为创建
				dishType = po.DishType{
					Model: gorm.Model{ID: dishTypeID},
					Name:  pbDish.DishType.Name,
				}
				if err := tx.Create(&dishType).Error; err != nil {
					tx.Rollback()
					return nil, errors.New("服务器错误")
				}
			} else if err != nil {
				tx.Rollback()
				return nil, errors.New("服务器错误")
			}
		} else {
			// 未提供 ID，则按名称创建（或查找后创建）
			if pbDish.DishType.Name == "" {
				tx.Rollback()
				return nil, errors.New("菜品类别无效")
			}
			dishType = po.DishType{Name: pbDish.DishType.Name}
			if err := tx.Where("name = ?", dishType.Name).FirstOrCreate(&dishType).Error; err != nil {
				tx.Rollback()
				return nil, errors.New("服务器错误")
			}
		}

		// 4) 更新 Dish
		dish.Name = pbDish.Name
		dish.SellStatus = types.SellStatus_SELL_STATUS_SELLING
		dish.DishTypeID = dishType.ID
		if err := tx.Save(&dish).Error; err != nil {
			tx.Rollback()
			return nil, errors.New("服务器错误")
		}

		// 5) 读取当前所有 Portion（含 RecipeID），用于差异删除
		var oldPortions []po.Portion
		if err := tx.Where("dish_id = ?", dish.ID).Find(&oldPortions).Error; err != nil {
			tx.Rollback()
			return nil, errors.New("服务器错误")
		}
		oldPortionByID := make(map[uint]po.Portion, len(oldPortions))
		for _, p := range oldPortions {
			oldPortionByID[p.ID] = p
		}

		// 收集请求中的 Portion ID
		incomingPortionIDs := make(map[uint]struct{})
		for _, pbPortion := range pbDish.Portions {
			if pbPortion.Id > 0 {
				incomingPortionIDs[uint(pbPortion.Id)] = struct{}{}
			}
		}

		// 6) 删除请求中已不存在的 Portion（及其 Recipe/RecipeMaterial）
		var toDeletePortionIDs []uint
		var toDeleteRecipeIDs  []uint
		for idOld, p := range oldPortionByID {
			if _, ok := incomingPortionIDs[idOld]; !ok {
				toDeletePortionIDs = append(toDeletePortionIDs, idOld)
				if p.RecipeID > 0 {
					toDeleteRecipeIDs = append(toDeleteRecipeIDs, p.RecipeID)
				}
			}
		}
		if len(toDeleteRecipeIDs) > 0 {
			if err := tx.Where("recipe_id IN ?", toDeleteRecipeIDs).Delete(&po.RecipeMaterial{}).Error; err != nil {
				tx.Rollback()
				return nil, errors.New("服务器错误")
			}
			if err := tx.Where("id IN ?", toDeleteRecipeIDs).Delete(&po.Recipe{}).Error; err != nil {
				tx.Rollback()
				return nil, errors.New("服务器错误")
			}
		}
		if len(toDeletePortionIDs) > 0 {
			if err := tx.Where("dish_id = ? AND id IN ?", dish.ID, toDeletePortionIDs).Delete(&po.Portion{}).Error; err != nil {
				tx.Rollback()
				return nil, errors.New("服务器错误")
			}
		}

		// 7) 逐个 Upsert/更新请求中的 Portion 及其 Recipe / RecipeMaterial
		for _, pbPortion := range pbDish.Portions {
			// 7.1 Recipe：无 ID 则创建；有 ID 则确保存在（可按需更新其它字段）
			var recipeID uint
			if pbPortion.Recipe.GetId() > 0 {
				recipeID = uint(pbPortion.Recipe.GetId())
				// 确保存在
				var cnt int64
				if err := tx.Model(&po.Recipe{}).Where("id = ?", recipeID).Count(&cnt).Error; err != nil {
					tx.Rollback()
					return nil, errors.New("服务器错误")
				}
				if cnt == 0 {
					// 若客户端传了一个不存在的 ID，这里选择创建（也可改为报错）
					r := po.Recipe{Model: gorm.Model{ID: recipeID}}
					if err := tx.Create(&r).Error; err != nil {
						tx.Rollback()
						return nil, errors.New("服务器错误")
					}
				}
			} else {
				r := po.Recipe{}
				if err := tx.Create(&r).Error; err != nil {
					tx.Rollback()
					return nil, errors.New("服务器错误")
				}
				recipeID = r.ID
			}

			// 7.2 Upsert RecipeMaterial
			// 收集本次的 material_id 列表
			var upserts []po.RecipeMaterial
			materialIDs := make([]uint, 0, len(pbPortion.Recipe.Materials))
			for _, m := range pbPortion.Recipe.Materials {
				mid := uint(m.Material.Id)
				materialIDs = append(materialIDs, mid)
				am, err := decimal.NewFromString(m.Quantity)
				if err != nil {
					return nil, errors.New("用量数据不合法")
				}
				upserts = append(upserts, po.RecipeMaterial{
					RecipeID:   recipeID,
					MaterialID: mid,
					Quantity:   am,
				})
			}

			// 冲突更新 quantity
			if len(upserts) > 0 {
				if err := tx.Clauses(clause.OnConflict{
					Columns:   []clause.Column{{Name: "recipe_id"}, {Name: "material_id"}},
					DoUpdates: clause.AssignmentColumns([]string{"quantity"}),
				}).Create(&upserts).Error; err != nil {
					tx.Rollback()
					return nil, errors.New("服务器错误")
				}
			}

			// 删除本次未出现的 Material（差异删除）
			if len(materialIDs) == 0 {
				// 本次一个材料都没传，清空该 recipe 的所有材料
				if err := tx.Where("recipe_id = ?", recipeID).Delete(&po.RecipeMaterial{}).Error; err != nil {
					tx.Rollback()
					return nil, errors.New("服务器错误")
				}
			} else {
				if err := tx.Where("recipe_id = ? AND material_id NOT IN ?", recipeID, materialIDs).
					Delete(&po.RecipeMaterial{}).Error; err != nil {
					tx.Rollback()
					return nil, errors.New("服务器错误")
				}
			}

			// 7.3 Portion 更新/插入
			price, err := decimal.NewFromString(pbPortion.Price)
			if err != nil {
				tx.Rollback()
				return nil, errors.New("价格格式不合法")
			}

			if pbPortion.Id > 0 {
				// 更新已有 Portion
				upd := map[string]any{
					"name":         pbPortion.Name,
					"portion_type": pbPortion.PortionType,
					"price":        price,
					"recipe_id":    recipeID,
				}
				if err := tx.Model(&po.Portion{}).
					Where("id = ? AND dish_id = ?", pbPortion.Id, dish.ID).
					Updates(upd).Error; err != nil {
					tx.Rollback()
					return nil, errors.New("服务器错误")
				}
			} else {
				// 新增 Portion
				p := po.Portion{
					DishID:      dish.ID,
					Name:        pbPortion.Name,
					PortionType: pbPortion.PortionType,
					Price:       price,
					RecipeID:    recipeID,
				}
				if err := tx.Create(&p).Error; err != nil {
					tx.Rollback()
					return nil, errors.New("服务器错误")
				}
			}
		}

		if err := tx.Commit().Error; err != nil {
			return nil, errors.New("服务器错误")
		}
		return &emptypb.Empty{}, nil
	}
}

func (s *DishServer) GetDishesWithCategory(ctx context.Context, req *restaurant_rpc.GetDishesWithCategoryReq) (*restaurant_rpc.GetDishesWithCategoryResp, error) {
	categoryId := req.Category.DishTypeID
	// 检查category是否存在
	var exist bool
	err := database.DB().Model(&po.DishType{}).Where("id = ?", categoryId).Select("1").Scan(&exist).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	if !exist {
		return nil, errors.New("该种类不存在")
	}

	// 查询总数
	var total int64
	err = database.DB().Model(&po.Dish{}).Where("dish_type_id = ?", categoryId).Count(&total).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}

	// 分页查询
	page, pageSize := myutils.SafePageInfo(req.PageInfo.Page, req.PageInfo.PageSize)
	var poDishes []po.Dish
	err = database.DB().Model(&po.Dish{}).
		Where("dish_type_id = ?", categoryId).
		Scopes(database.Paginate(page, pageSize)).
		Preload("Portions").
		Preload("DishType").
		Find(&poDishes).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}

	category := &restaurant_rpc.DishType{
		DishTypeID: categoryId,
		Name: req.Category.Name,
	}

	var pbDishes []*restaurant_rpc.Dish
	for _, poDish := range poDishes {
		pbDishes = append(pbDishes, database.PODish2PBDish(poDish))
	}

	pageInfo := &restaurant_rpc.PageInfo{
		Page:     uint32(page),
		PageSize: uint32(pageSize),
		Total: uint64(total),
	}

	resp := &restaurant_rpc.GetDishesWithCategoryResp{
		Dishes: pbDishes,
		Category: category,
		PageInfo: pageInfo,
	}
	return resp, nil
}
