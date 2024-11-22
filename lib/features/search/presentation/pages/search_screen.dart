import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../component/list_variant_component.dart';
import '../component/map_marker_component.dart';
import '../component/overlay_dialog_component.dart';
import '../component/search_component.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  final CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(6.5853, 3.3820),
    zoom: 13,
  );
  late AnimationController _animationController;
  String? _mapStyle;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: 700.ms, reverseDuration: 500.ms);
    _animationController.addStatusListener((listener) {
      if (listener == AnimationStatus.dismissed) {
        _setExpandedFalse();
      } else {
        _setExpandedTrue();
      }
    });
    _setMapToDarkMode();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _setExpandedFalse() {
    setState(() {
      _isExpanded = false;
    });
  }

  void _setExpandedTrue() {
    setState(() {
      _isExpanded = true;
    });
  }

  Future<void> _setMapToDarkMode() async {
    _mapStyle = await rootBundle.loadString("assets/json/map_dark_style");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          style: _mapStyle,
          compassEnabled: false,
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          initialCameraPosition: _cameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),

        MapMarkerComponent(
          expanded: _isExpanded,
        ),
        const SearchComponent(),
        Positioned(
          left: 30,
          bottom: 130,
          child: OverlayDialog(animationController: _animationController,
          )
        ),
        const MapVariantComponent(),
      ],
    ));
  }
}
