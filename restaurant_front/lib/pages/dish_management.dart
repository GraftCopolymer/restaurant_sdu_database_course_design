import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/providers/dish_list_provider.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';

@RoutePage()
class DishManagementPage extends ConsumerStatefulWidget {
  const DishManagementPage({super.key});

  @override
  ConsumerState<DishManagementPage> createState() => _DishManagementPageState();
}

class _DishManagementPageState extends ConsumerState<DishManagementPage> {
  AutoDisposeAsyncNotifierProvider<DishListModel, List<Dish>> get provider => dishListModelProvider;

  Widget _buildBody() {
    final asyncDishList = ref.watch(provider);
    return asyncDishList.when<Widget>(
      data: _buildDataView,
      error:(error, stackTrace) {
        return _buildErrorView(error, stackTrace);
      }, 
      loading: _buildLoadingView,
    );
  }

  Widget _buildDataView(List<Dish> data) {
    if (data.isEmpty) {
      return _buildNoDataView();
    }
    return ListView.builder(itemCount: data.length, itemBuilder: (context, index) {
      final dish = data[index];
      return ListTile(
        title: Text(dish.name),
        onTap: () {
          // TODO: 进入菜品编辑页面
          router.push(DishAddRoute(
            dish: dish,
            onSaveDish: (dish) {
              ref.read(provider.notifier).updateDish(dish);
              // 返回当前页面
              router.back();
            },
          ));
        },
      );
    });
  }

  Widget _buildErrorView(Object e, StackTrace? s) {
    Utils.report(e, s);
    return Center(child: Text("加载错误"),);
  }

  Widget _buildLoadingView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildNoDataView() {
    return Center(
      child: Text("暂无数据, 请点击右下角按钮添加新菜品"),
    );
  }


  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("菜品管理"),
          leading: BackButton(),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          router.push(DishAddRoute(
            onSaveDish: (dish) {
              ref.read(provider.notifier).addDish(dish);
              router.back();
            },
          ));
        }, child: Icon(Icons.add),),
        body: _buildBody(),
      ),
    );
  }
}