import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.name,
    this.imageUrl,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.enable = true
  });

  final String name;
  final String? imageUrl;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool enable;

  final double _avatarHeight = 100;

  Widget _buildImageArea() {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        width: _avatarHeight,
        height: _avatarHeight,
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.block, color: Colors.white),
            Text("暂无图片", style: TextStyle(color: Colors.white)),
          ],
        ),
      );
    }
    return Container(
      width: _avatarHeight,
      height: _avatarHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      child: Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            alignment: Alignment.center,
            child: Icon(Icons.warning_amber_rounded),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: _avatarHeight,
            child: Stack(
              children: [
                if (onTap != null)
                Material(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.transparent,
                  child: InkWell(onTap: onTap),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (leading != null) leading!,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [_buildImageArea()],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Spacer(),
                              if (subtitle != null) subtitle!,
                            ],
                          ),
                        ),
                      ),
                      if (trailing != null)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [trailing!],
                      ),
                    ],
                  ),
                ),
                if (!enable)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(100),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
