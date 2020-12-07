import 'package:flutter/material.dart';
import 'package:navigator2/route_information_parser.dart';
import 'package:navigator2/router_delegate.dart';

void main() {
  runApp(DrawerApp());
}

enum DrawerEntries {
  home,
  settings,
}

class DrawerApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  DrawerRouterDelegate _routerDelegate = DrawerRouterDelegate();
  DrawerRouteInformationParser _routeInformationParser =
      DrawerRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Drawer App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

class DrawerEntryPage extends Page {
  final String entry;
  final ValueChanged<DrawerEntries> onDrawerTapped;

  DrawerEntryPage({
    this.entry,
    this.onDrawerTapped,
  }) : super(key: ValueKey(entry));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  onTap: () {
                    this.onDrawerTapped(DrawerEntries.home);
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    this.onDrawerTapped(DrawerEntries.settings);
                  },
                ),
              ],
            ),
          ),
          body: Text(entry),
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  final ValueChanged<DrawerEntries> onTapped;

  MainScreen({
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
