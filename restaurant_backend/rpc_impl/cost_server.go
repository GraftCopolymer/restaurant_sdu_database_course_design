package rpc_impl

import (
	"context"
	"errors"
	"google.golang.org/protobuf/types/known/emptypb"
	"restaurant_backend/database"
	myutils "restaurant_backend/my_utils"
	"restaurant_backend/po"
	restaurant_rpc "restaurant_backend/restaurant_backend/rpc"
)

type CostServer struct {
	restaurant_rpc.UnimplementedCostServiceServer
}

func (s *CostServer) GetAllCost(ctx context.Context, req *emptypb.Empty) (*restaurant_rpc.GetAllCostResp, error) {
	token, ok := myutils.ExtractUserInfoFromContext(ctx);
	if !ok {
		return nil, errors.New("无法获取用户信息")
	}
	if token.Role != restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE {
		return nil, errors.New("权限不足")
	}
	var poCostList []po.Cost
	if err := database.DB().Model(&po.Cost{}).Find(&poCostList).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	var pbCostList []*restaurant_rpc.CostInfo
	for _, poCost := range poCostList {
		pbCostList = append(pbCostList, &restaurant_rpc.CostInfo{
			CostId: uint32(poCost.ID),
			Value: poCost.Value.StringFixed(2),
			Description: poCost.Description,
			CostType: poCost.CostType,
		})
	}
	return &restaurant_rpc.GetAllCostResp{
		CostInfoList: pbCostList,
	}, nil
}
