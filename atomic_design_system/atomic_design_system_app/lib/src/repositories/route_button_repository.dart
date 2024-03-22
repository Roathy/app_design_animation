import '../data/route_button.dart';
import '../db/route_button_db.dart';

// repository
class RouteButtonRepository {
  final _routeButtonState = RouteButtonDB();

  List<RouteButton> getRouteButtons() {
    return _routeButtonState.routeButtonState;
  }

  // void pushRouteButton(RouteButton button) {
  //   _routeButtonState.pushRouteButton(button);
  // }

  // void popRouteButton() {
  //   _routeButtonState.popRouteButton();
  // }
}
