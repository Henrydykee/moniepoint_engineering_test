import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_test/core/platform/text_holder.dart';

import '../../../../core/platform/color.dart';

class MapMarkerComponent extends StatefulWidget {

  final bool expanded;

   const MapMarkerComponent({super.key, this.expanded=false});

  @override
  State<MapMarkerComponent> createState() => _MapMarkerComponentState();
}

class _MapMarkerComponentState extends State<MapMarkerComponent>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: 1000.ms);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  final _long = [
    '15,5 mn ₽',
    '12 mn ₽',
    '18,3 mn ₽',
    '9,8 mn ₽',
    '10,5 mn ₽',
    '8,95 mn ₽'
  ];

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool expanded = widget.expanded;
    return Stack(
      fit: StackFit.expand,
      children: [
        ...List.generate(
          5,
          (index) => Positioned(
            top: MediaQuery.of(context).size.height *
                ([0.5, 0.2, 0.3, 0.4, 0.5, 0.6][index]),
            left: MediaQuery.of(context).size.width *
                ([0.2, 0.4, 0.6, 0.3, 0.7, 0.5][index]),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.bottomLeft,
                  child: Transform.scale(
                    scale: _animation.value,
                    alignment: Alignment.bottomLeft,
                    child: AnimatedContainer(
                        duration: 500.ms,
                        width: !expanded ? 35 : 75,
                        padding: EdgeInsets.symmetric(
                            horizontal: !expanded ? 8 : 12, vertical: 12),
                        decoration: const BoxDecoration(
                            color: TestColor.orangePeel,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: !expanded
                            ? const Icon(
                                Icons.apartment_outlined,
                                color: Colors.white,
                                size: 20,
                              )
                            : TextHolder(
                                title: _long[index],
                                maxLines: 1,
                                color: Colors.white,
                              )),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
