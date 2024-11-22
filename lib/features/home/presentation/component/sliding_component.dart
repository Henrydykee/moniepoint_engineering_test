import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/platform/text_holder.dart';

import '../../../../core/platform/color.dart';

class AnimatedSlidingContainer extends StatefulWidget {
  const AnimatedSlidingContainer({super.key});

  @override
  AnimatedSlidingContainerState createState() =>
      AnimatedSlidingContainerState();
}

class AnimatedSlidingContainerState extends State<AnimatedSlidingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _containerWidth;
  late Animation<double> _iconPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;
          _containerWidth = Tween(begin: 0.0, end: maxWidth).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
          );

          _iconPosition = Tween(begin: -60.0, end: maxWidth - 60.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
          );

          return SizedBox(
            width: maxWidth,
            height: 75,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Container(
                      width: _containerWidth.value,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: _containerWidth.value >= maxWidth
                          ?  const TextHolder(
                        title:
                        'Lagos,Nigeria',
                        color: Colors.black,
                      )
                          : null,
                    ),
                  ),
                  // Animated sliding icon
                  Positioned(
                    left: _iconPosition.value,
                    top: 4,
                    right: 1,
                    child: Center(
                      child: Container(
                        width: 80,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 6),
                          ],
                        ),
                        child: const Icon(
                          Icons.chevron_right,
                          color: TestColor.charcoalBlack,
                          size: 20,
                        )

                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

