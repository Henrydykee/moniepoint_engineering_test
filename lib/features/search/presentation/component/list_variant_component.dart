import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_test/core/platform/icons_path.dart';
import 'package:moniepoint_test/core/platform/text_holder.dart';

class MapVariantComponent extends StatelessWidget {
  const MapVariantComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 130,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.6),
          borderRadius: BorderRadius.circular(25)
        ),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(
                Icons.sort_rounded,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 5,),
              TextHolder(title: "List of variants",color: Colors.white,size: 15,)
            ],
          ),
        ),
      )
    );
  }
}

class LocationAndLayerComponent extends StatefulWidget {
  const LocationAndLayerComponent({super.key});

  @override
  State<LocationAndLayerComponent> createState() => _LocationAndLayerComponentState();
}

class _LocationAndLayerComponentState extends State<LocationAndLayerComponent> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _isVisible = false;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void _toggleOverlay() {
    setState(() {
      _isVisible = !_isVisible;
    });
    if (_isVisible) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget buildIconContainer({
      required Widget icon,
       VoidCallback? onTap,
    }) {
      return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.6),
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.all(15.0),
          child: icon
        ),
      );
    }

    return Positioned(
      left: 25,
      bottom: 130,
      child: Column(
        children: [
          buildIconContainer(
            icon  : const Icon(Icons.layers_outlined,color: Colors.white,size: 20,),
            onTap: () {
              _toggleOverlay();
            },
          ),
          const SizedBox(height: 10),
          Transform.rotate(
            angle: 1.0,
            child: buildIconContainer(
              icon  : SvgPicture.asset(IconsPath.locationIcon, colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              )
                ,height: 20,width: 20,),
            ),
          ),

        ],
      ),
    );
  }
}






