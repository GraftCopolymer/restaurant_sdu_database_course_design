import 'package:flutter/material.dart';

/// 本组件build时会触发 [LoadMoreNotification] 事件
class LoadMoreWidget extends StatelessWidget {
  const LoadMoreWidget({super.key, required this.isFinished, this.endWidgetBuilder, this.loadingBuilder, this.child});

  final Widget? child;
  final WidgetBuilder? endWidgetBuilder;
  final WidgetBuilder? loadingBuilder;
  final bool? isFinished;

  Widget _defaultEndWidget() {
    return Container(
      alignment: Alignment.center,
      child: Text("没有更多数据", style: TextStyle(color: Colors.grey),),
    );
  }

  Widget _loadingWidget() {
    return UnconstrainedBox(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isFinished == null) {
      return loadingBuilder == null ? _loadingWidget() : loadingBuilder!(context);
    }
    if (isFinished!) {
      return endWidgetBuilder == null ? _defaultEndWidget() : endWidgetBuilder!(context);
    }
    context.dispatchNotification(LoadMoreNotification());
    return loadingBuilder == null ? _loadingWidget() : loadingBuilder!(context);
  }
}

class LoadMoreNotification extends Notification {}