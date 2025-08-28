import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickBox extends StatefulWidget {
  const ImagePickBox({
    super.key,
    this.width,
    this.height,
    this.onSuccess,
    this.onCancelSelection,
    this.onOpenPicker,
    this.onFailed,
  });

  final double? width;
  final double? height;

  /// 图片选择成功时调用
  final void Function(File imageFile)? onSuccess;

  /// 取消选择图片时调用
  final void Function()? onCancelSelection;

  /// 打开图片选择器时调用
  final void Function()? onOpenPicker;

  /// 图片选择失败时调用(用户取消也可能在这里触发)
  final void Function()? onFailed;

  @override
  State<ImagePickBox> createState() => _ImagePickBoxState();
}

class _ImagePickBoxState extends State<ImagePickBox> {
  File? _imageFile;

  /// 构建还未选择图片时的视图
  Widget _buildNoImageView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(alignment: Alignment.center, child: Icon(Icons.add)),
    );
  }

  /// 构建已经选择了图片时的视图
  Widget _buildImageView() {
    assert(_imageFile != null);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          debugPrint("当前约束: $constraints");
          return Image.file(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            _imageFile!,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  /// 构建主体视图
  Widget _buildContent() {
    if (_imageFile == null) {
      return _buildNoImageView();
    } else {
      return _buildImageView();
    }
  }

  @override
  Widget build(BuildContext context) {
    late final double width;
    late final double height;
    if (widget.width != null && widget.height == null) {
      width = widget.width!;
      height = width;
    } else if (widget.width == null && widget.height != null) {
      height = widget.height!;
      width = height;
    } else if (widget.width != null && widget.height != null) {
      width = widget.width!;
      height = widget.height!;
    } else {
      // 框高都没设置, 默认都为 200
      width = 200;
      height = 200;
    }

    return SizedBox(
      width: width,
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                _buildContent(),
                if (_imageFile == null)
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () async {
                      final imageSource =
                          await showModalBottomSheet<ImageSource?>(
                            clipBehavior: Clip.antiAlias,
                            context: context,
                            builder: (context) {
                              // 手机底部小白条高度
                              final littleWhiteBarHeight = MediaQuery.of(
                                context,
                              ).padding.bottom;
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text("拍照"),
                                    ),
                                    onTap: () {
                                      Navigator.of(
                                        context,
                                      ).pop(ImageSource.camera);
                                    },
                                  ),
                                  ListTile(
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text("从相册选择"),
                                    ),
                                    onTap: () {
                                      Navigator.of(
                                        context,
                                      ).pop(ImageSource.gallery);
                                    },
                                  ),
                                  ListTile(
                                    title: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "取消",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  SizedBox(height: littleWhiteBarHeight),
                                ],
                              );
                            },
                          );
                      if (imageSource == null) {
                        return;
                      }
                      // 打开图片选择器
                      final picker = ImagePicker();
                      widget.onOpenPicker?.call();
                      final XFile? xImage = await picker.pickImage(
                        source: imageSource,
                      );
                      // TODO: 压缩图片
                      if (xImage != null) {
                        final imageFile = File(xImage.path);
                        setState(() {
                          _imageFile = imageFile;
                        });
                        widget.onSuccess?.call(imageFile);
                      } else {
                        widget.onFailed?.call();
                      }
                    },
                  ),
                ),
                if (_imageFile != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: ActionChip(
                    side: BorderSide(color: Colors.transparent),
                    padding: EdgeInsets.all(0),
                    shape: CircleBorder(),
                    onPressed: () {
                      widget.onCancelSelection?.call();
                      setState(() {
                        _imageFile = null;
                      });
                    },
                    label: Icon(Icons.close)
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
