import 'package:flutter/material.dart';
import 'package:navigator2/main.dart';

class DrawerRouteInformationParser extends RouteInformationParser<DrawerEntries> {
  @override
  Future<DrawerEntries> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.location) {
      case '/':
        return DrawerEntries.home;
      case '/settings':
        return DrawerEntries.settings;
      default:
        throw 'unknown';
    }
  }

  @override
  RouteInformation restoreRouteInformation(DrawerEntries entry) {
    switch (entry) {
      case DrawerEntries.home:
        return RouteInformation(location: '/');
      case DrawerEntries.settings:
        return RouteInformation(location: '/settings');
      default:
        throw 'unknown';
    }
  }
}
