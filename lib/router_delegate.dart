import 'package:flutter/material.dart';
import 'package:navigator2/main.dart';

class DrawerRouterDelegate extends RouterDelegate<DrawerEntries>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<DrawerEntries> {
  final GlobalKey<NavigatorState> navigatorKey;

  DrawerEntries _selectedEntry;

  DrawerRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  DrawerEntries get currentConfiguration {
    return _selectedEntry;
  }

  _getDrawerBody(DrawerEntries entry) {
    switch (entry) {
      case DrawerEntries.home:
        return DrawerEntryPage(entry: 'This is home', onDrawerTapped: _handleEntryTapped);
        break;
      case DrawerEntries.settings:
        return DrawerEntryPage(entry: 'This is settings', onDrawerTapped: _handleEntryTapped);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('MainPage'),
          child: MainScreen(
            onTapped: _handleEntryTapped,
          ),
        ),
        if (_selectedEntry != null)
          _getDrawerBody(_selectedEntry)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedEntry = DrawerEntries.home;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(DrawerEntries entry) async {
    _selectedEntry = entry;
  }

  void _handleEntryTapped(DrawerEntries entry) {
    _selectedEntry = entry;
    notifyListeners();
  }
}