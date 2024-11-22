import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/core/platform/icons_path.dart';

import '../../../../core/platform/color.dart';

class OverlayDialog extends StatefulWidget {
  final AnimationController animationController;

  const OverlayDialog({
    super.key,
    required this.animationController
  });

  @override
  State<OverlayDialog> createState() => _OverlayDialogState();
}

class _OverlayDialogState extends State<OverlayDialog> with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  OverlayEntry? _overlayEntry;
  int _selectedIconIndex = 0;
  bool _showBorder = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.easeOutBack,
      ),
    );
  }

  void _showOverlay(int index) {
    setState(() {
      _selectedIconIndex = index;
      _showBorder = true;
    });

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _scaleController.forward();
  }

  void _hideOverlay() {
    _scaleController.reverse().then((_) {
      setState(() => _showBorder = false);
      _overlayEntry?.remove();
      _overlayEntry = null;
      widget.animationController.reverse();
    });
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _hideOverlay,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          // The actual overlay content
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.220,
            left: 50,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: TestColor.lightCream,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(4, (index) =>
                        _buildDialogOption(context, index)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogOption(BuildContext context, int index) {
    final dialogOptions = ['Cosy areas', 'Price', 'Infrastructure', 'Without any layer'];
    final icons = [
      IconsPath.shieldIcon,
      IconsPath.walletIcon,
      IconsPath.trashIcon,
      IconsPath.layersIcon
    ];

    return InkWell(
      onTap: (){
        widget.animationController.forward();
        _hideOverlay();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SvgPicture.asset(
                icons[index],
                height: 20,
                colorFilter: const ColorFilter.mode(
                  TestColor.warmGery,
                  BlendMode.srcIn,  // Adjust blend mode as needed
                ),
            ),
            const SizedBox(width: 10),
            TextHolder(
                title: dialogOptions[index],
                color: TestColor.warmGery
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) =>
          _buildIconButton(index),
      ),
    );
  }

  Widget _buildIconButton(int index) {
    return InkWell(
      onTap: (){
        if(index == 0){
          _showOverlay(index);
        }
      },
      child: Container(
        height: 45,
        width: 45,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Transform.rotate(
            angle: index == 0 ? 0 : 1.0,
            child: SvgPicture.asset(
              index == 0 ? IconsPath.layersIcon : IconsPath.mapArrowIcon,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              height: 17,
              width: 20,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }
}

// class TestColor {

// }

class TextHolder extends StatelessWidget {
  final String title;
  final Color? color;

  const TextHolder({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: color,
      ),
    );
  }
}