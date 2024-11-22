
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_test/core/platform/animations.dart';

import '../../../../core/platform/color.dart';
import '../../../../core/platform/number_counter.dart';
import '../../../../core/platform/text_holder.dart';

class MainInfoComponent extends StatelessWidget {

  const MainInfoComponent({super.key, this.buyOffer,this.rentOffer});

  final int? buyOffer;
  final int? rentOffer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_sharp,color: TestColor.sandStone,),
                      SizedBox(width: 5,),
                      TextHolder(title: "Saint Petersburg",color: TestColor.sandStone,size: 16,fontWeight: FontWeight.w500,)
                    ],
                  ),
                ),
              ).fadeInFromLeft(delay: 1500.ms),

              const CircleAvatar(
                radius: 25,
                backgroundImage:  AssetImage("assets/images/avatar.jpg"),
              ).fadeIn(delay: 1500.ms)

            ],
          ),
          const SizedBox(height: 20,),
          const TextHolder(title: "Hi, Marina",color: TestColor.sandStone,size: 25,fontWeight: FontWeight.w400,).fadeInFromLeft(delay: 1600.ms),
          const TextHolder(title: "Let's select your\nperfect place",color: Colors.black,size: 40,fontWeight: FontWeight.w400,).fadeInFromBottom(delay: 1600.ms),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 90,
                  backgroundColor: TestColor.orangePeel,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      TextHolder(title: "BUY",color: Colors.white,fontWeight: FontWeight.w500,),
                      SizedBox(height: 30,),
                      NumberCounter(number: 1034,),
                      TextHolder(title: "Offers",color: Colors.white,fontWeight: FontWeight.w500,)
                    ],
                  ),
                ).scale(delay: 1800.ms, animationDuration: 1000.ms),
                const SizedBox(width: 10,),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        TextHolder(title: "RENT",color: TestColor.sandStone,fontWeight: FontWeight.w500,),
                        SizedBox(height: 30,),
                        NumberCounter(number: 2212,textColor: TestColor.sandStone,),
                        TextHolder(title: "Offers",color: TestColor.sandStone,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                ).scale(delay: 1800.ms, animationDuration: 1000.ms)
              ],
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}