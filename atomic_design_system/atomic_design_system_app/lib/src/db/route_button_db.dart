import 'package:flutter/material.dart';

import '../data/route_button.dart';
import '../view/pages/animated_square_page.dart';
import '../view/pages/animations_page.dart';
import '../view/pages/circular_progress_page.dart';
import '../view/pages/emergency_page.dart';
import '../view/pages/graphs_page.dart';
import '../view/pages/headers_page.dart';
import '../view/pages/pinterest_page.dart';
import '../view/pages/slideshow_page.dart';
import '../view/pages/sliver_list_page.dart';

class RouteButtonDB {
  final List<RouteButton> _routeButtonDataList = [
    // RouteButton(Icons.home_outlined, 'Home', Container()),
    RouteButton(Icons.view_headline_rounded, 'Headers', const HeadersPage()),
    RouteButton(Icons.play_arrow_outlined, 'Translate Animation', const AnimatedSquarePage()),
    RouteButton(Icons.play_circle_outline, 'Simple Animations', const AnimationsPage()),
    RouteButton(Icons.movie_filter_outlined, 'Progress Animation', const CircularProgressPage()),
    RouteButton(Icons.movie_filter_outlined, 'Progress Animations', const GraphsPage()),
    RouteButton(Icons.swipe_outlined, 'SlideShow', const SlideShowPage()),
    RouteButton(Icons.medical_services_outlined, 'Header & VerticalList', const EmergencyPage()),
    RouteButton(Icons.photo_album_outlined, 'Pinterest', const PinterestPage()),
    RouteButton(Icons.swap_vertical_circle_outlined, 'Slivers', const SliverListPage()),
    // RouteButton(Icons.dashboard_outlined, 'Dashboard', Container()),
    // RouteButton(Icons.dashboard_customize_outlined, 'Themes', Container()),
  ];

  List<RouteButton> get routeButtonState {
    return _routeButtonDataList;
  }

  // void pushRouteButton(RouteButton data) {
  //   _routeButtonDataList.add(data);
  // }

  // void popRouteButton() {
  //   _routeButtonDataList.removeLast();
  // }
}
