import 'package:flutter/material.dart';
import '../component/animated_container_component.dart';
import '../component/main_info_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  late int _buyOffer = 0;
  late  int _rentOffer = 0;


  void run() {
    Future.delayed(const Duration(milliseconds: 1800), () {
      setState(() {
        _buyOffer = 1034;
        _rentOffer = 2212;
      });
    });
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8F6F2),
              Color.fromRGBO(250, 217, 178, 1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainInfoComponent(buyOffer: _buyOffer,rentOffer: _rentOffer,),
              const ApartmentComponent()
            ],
          ),
        ));
  }
}












