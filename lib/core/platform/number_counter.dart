

import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/platform/text_holder.dart';

class NumberCounter extends StatefulWidget {
  final int number;
 final Color textColor;

  const NumberCounter({super.key,this.number = 0,this.textColor = Colors.white});


  @override
  NumberCounterState createState() => NumberCounterState();
}

class NumberCounterState extends State<NumberCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = IntTween(begin: 0, end: widget.number).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextHolder(
        title: _animation.value.toString(),
        color: widget.textColor,
        size: 40,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}