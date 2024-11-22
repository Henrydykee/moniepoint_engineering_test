
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/core/platform/reuseable_textfiled.dart';

class SearchComponent extends StatefulWidget {

  const SearchComponent({super.key});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {

  final TextEditingController _locationSearchController = TextEditingController(text: "Saint Petersburg");


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 50),
      child: Row(
        children: [
          Expanded(
            child: ReusableTextField(
              controller: _locationSearchController,
              prefixIcon: SvgPicture.asset("assets/svg/location_search_icon.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          const SizedBox(width: 10,),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              "assets/svg/filter_map_icon.svg",
               colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              // fit: BoxFit.contain,
            ),
          )

        ],
      ),
    );
  }
}
