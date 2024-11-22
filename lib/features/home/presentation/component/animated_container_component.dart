import 'package:flutter/material.dart';

import '../pages/image_component.dart';



class ApartmentComponent extends StatefulWidget {
  const ApartmentComponent({super.key});

  @override
  ApartmentComponentState createState() => ApartmentComponentState();
}

class ApartmentComponentState extends State<ApartmentComponent> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Column(
          children: [
            ImageComponentPlaceholder(left: 10, top: 10, right: 10, bottom: 10),
            Row(
              children: [
                Flexible(child: ImageComponentPlaceholder(left: 10)),
                SizedBox(width: 10),
                Flexible(child: ImageComponentPlaceholder(right: 10)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Flexible(child: ImageComponentPlaceholder(left: 10)),
                SizedBox(width: 10),
                Flexible(child: ImageComponentPlaceholder(right: 10)),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}