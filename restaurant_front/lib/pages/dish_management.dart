import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/providers/dish_list_provider.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/load_more_widget.dart';

@RoutePage()
class DishManagementPage extends ConsumerStatefulWidget {
  const DishManagementPage({super.key});

  @override
  ConsumerState<DishManagementPage> createState() => _DishManagementPageState();
}

class _DishManagementPageState extends ConsumerState<DishManagementPage> {
  AutoDisposeAsyncNotifierProvider<DishListModel, List<Dish>> get provider => dishListModelProvider;

  bool _isEditMode = false;

  List<int> _selectedIndexList = [];

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
    return ListView.builder(itemCount: data.length + 1, itemBuilder: (context, index) {
      final isFinished = ref.watch(provider.notifier).isFinished();
      if (index == data.length) {
        return NotificationListener<LoadMoreNotification>(
          onNotification: (notification) {
            if (isFinished != null && !isFinished) {
              ref.read(provider.notifier).loadMore();
              return true;
            }
            return false;
          },
          child: LoadMoreWidget(isFinished: isFinished)
        );
      }
      final dish = data[index];
      return ListTile(
        leading: _isEditMode ? Checkbox(value: _selectedIndexList.contains(index), onChanged: (value) {
          final _v = value ?? false;
          if (_v && _selectedIndexList.contains(index)) {
            setState(() {
              _selectedIndexList.add(index);
            });
          } else {
            setState(() {
              _selectedIndexList.remove(index);
            });
          }
        }) : null,
        title: Text(dish.name),
        onTap: () {
          if (_isEditMode) {
            if (!_selectedIndexList.contains(index)) {
              setState(() {
                _selectedIndexList.add(index);
              });
            } 
            else {
              setState(() {
                _selectedIndexList.remove(index);
              });
            }
            debugPrint("当前选中的菜品: ");
            for (final i in _selectedIndexList) {
              if (_selectedIndexList.contains(index)) {
                debugPrint("${data[i].name}");
              }
            }
            return;
          }
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
          actions: [
            if (!_isEditMode)
            TextButton(onPressed: (){
              // 进入多选模式
              _selectedIndexList.clear();
              setState(() {
                _isEditMode = true;
              });
            }, child: Text("编辑"))
            else 
            TextButton(onPressed: (){
              // 退出多选模式
              _selectedIndexList.clear();
              setState(() {
                _isEditMode = false;
              });
            }, child: Text("取消"))
          ],
        ),
        floatingActionButton: _isEditMode ? FloatingActionButton(onPressed: (){
          if (_selectedIndexList.isEmpty) {
            Fluttertoast.showToast(msg: "请先选中需要删除的菜品");
            return;
          }
          ref.read(provider.notifier).deleteIndexesOf(_selectedIndexList);
          _selectedIndexList.clear();
          // 退出编辑模式
          setState(() {
            _isEditMode = false;
          });
        }, child: Icon(Icons.delete_forever_outlined),) : FloatingActionButton(onPressed: () {
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