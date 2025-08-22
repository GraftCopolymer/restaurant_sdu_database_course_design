import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_management/main.dart';

enum DialogResult {
  confirm, cancel, empty
}

/// 全局对话框
class GlobalDialog {
  static Future<DialogResult?> show({
    required String title,
    required String content,
    String confirmText = '确定',
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool? canClose,
  }) async {
    final context = navigatorKey.currentContext;
    if (context == null) return null;

    final result = await showDialog<DialogResult?>(
      context: context,
      barrierDismissible: canClose ?? true,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(DialogResult.cancel);
                onCancel?.call();
              },
              child: Text(cancelText),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(DialogResult.confirm);
              onConfirm?.call();
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
    return result ?? DialogResult.empty;
  }

  static DialogController? showCustom({
    bool? canClose,
    required Widget Function(BuildContext context, DialogController controller) builder,
  }) {
    final context = navigatorKey.currentContext;
    if (context == null) return null;

    final _canClose = canClose ?? true;

    final controller = DialogController(context, null);

    final resultFuture = showDialog<DialogResult?>(
      context: context,
      barrierDismissible: _canClose,
      builder: (_) {
        return PopScope(
          canPop: canClose ?? true,
          onPopInvokedWithResult: (didPop, result) {
            if (controller._dismissed) {
              return;
            }
            if (didPop) {
              controller._dismissed = true;
              return;
            }
            if (!_canClose) return;
            if (!controller._dismissed) {
              controller.dismiss();
            }
          },
          child: builder(context, controller)
        );
      }
    );
    controller._onReturn = () {
      return resultFuture;
    };
    return controller;
  }

  /// 显示加载框
  static DialogController? showLoading({bool canClose = false}) {
    final context = navigatorKey.currentContext;
    if (context == null) return null;
    
    return showCustom(canClose: canClose, builder: (_, _) {
      return UnconstrainedBox(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(140),
          ),
          child: Center(child: CircularProgressIndicator())
        ),
      );
    });
  }
}

/// 用于控制对话框
class DialogController {
  BuildContext _context;
  Future<DialogResult?> Function()? _onReturn;
  bool _dismissed = false;
  DialogResult? _returnValue;

  DialogController(this._context, this._onReturn);

  void dismiss() {
    _dismissInternal();
  }

  void _dismissInternal() {
    if (_dismissed) return;
    _dismissed = true;
    Navigator.of(_context).pop(_returnValue);
  }

  void setResult(DialogResult? result) {
    _returnValue = result;
  }

  Future<DialogResult?> getResult() async {
    if (_onReturn == null) return null;
    return _onReturn!();
  }
}