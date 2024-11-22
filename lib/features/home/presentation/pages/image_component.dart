import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/platform/image_path.dart';
import '../component/sliding_component.dart';

class ImageComponentPlaceholder extends StatelessWidget {
  final double left;
  final double top;
  final double right;
  final double bottom;

  const ImageComponentPlaceholder({
    super.key,
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              ImagesPath.kitchenImage,
              fit: BoxFit.cover,
            ),
          ),
          const AnimatedSlidingContainer()
        ],
      ),
    );
  }
}