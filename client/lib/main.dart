import 'package:client/components/drawer_list_tile.dart';
import 'package:client/components/user_anchor_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

final ThemeData _defaultTheme = ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  primaryColor: const Color(0xff2196f3),
  primaryColorLight: const Color(0xffbbdefb),
  primaryColorDark: const Color(0xff1976d2),
  canvasColor: const Color(0xfffafafa),
  scaffoldBackgroundColor: const Color(0xfffafafa),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0x1f000000),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  unselectedWidgetColor: const Color(0x8a000000),
  disabledColor: const Color(0x61000000),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
          color: Color(0xff000000), width: 0, style: BorderStyle.none),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61ffffff),
    highlightColor: Color(0x29ffffff),
    splashColor: Color(0x1fffffff),
  ),
);
void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: _defaultTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: UserAnchorMenu(
                  icon: Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/dog.jpg'),
                    radius: 20,
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                                colors: [Colors.lightGreen, Colors.green],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                      )),
                ],
              )),
            )
          ],
        ),
        drawer: Drawer(
            child: Column(
          children: [
            Expanded(
              child: ListView(padding: EdgeInsets.zero, children: [
                DrawerHeader(
                  // Solution 1:
                  //
                  // decoration: const BoxDecoration(
                  //   image: DecorationImage(
                  //       image: AssetImage(
                  //           'assets/images/dashboard_drawer.jpg'),
                  //       colorFilter: ColorFilter.mode(
                  //           Colors.black54, BlendMode.multiply)),
                  // ),
                  // child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 1, vertical: 12),
                  //         child: Text(
                  //           'Car Inventory',
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .headlineMedium
                  //               ?.copyWith(
                  //                 color: Theme.of(context)
                  //                     .colorScheme
                  //                     .onBackground
                  //                     .withOpacity(.85),
                  //               ),
                  //         ),
                  //       )
                  //     ]),

                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/dog.jpg'),
                          radius: 28,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Ruby Nicholas',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'rubyn@gmail.com',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const UserAnchorMenu(
                                icon: Icon(Icons.arrow_drop_down),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
                const DrawerListTile(
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                  isSelected: true,
                ),
                const DrawerListTile(
                  icon: Icons.admin_panel_settings,
                  title: 'Admin Management',
                ),
                const DrawerListTile(
                  icon: Icons.directions_car,
                  title: 'Car Stock',
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              decoration: const BoxDecoration(
                border: BorderDirectional(
                  top: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              child: const DrawerListTile(
                icon: Icons.door_back_door,
                title: 'Logout',
              ),
            )
          ],
        )),
      ),
    );
  }
}
