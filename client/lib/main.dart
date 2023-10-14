import 'package:client/components/drawer_list_tile.dart';
import 'package:client/components/user_anchor_menu.dart';
import 'package:client/config/custom_theme.dart';
import 'package:client/models/dashboard_drawer_item.dart';
import 'package:client/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(App());

const drawerItems = [
  DashboardDrawerItem(
    title: 'Dashboard',
    icon: Icons.dashboard,
    component: DashboardScreen(),
  ),
  DashboardDrawerItem(
    title: 'Admin Management',
    icon: Icons.supervised_user_circle_outlined,
  ),
  DashboardDrawerItem(
    title: 'Car Stock',
    icon: Icons.directions_car_rounded,
  ),
  DashboardDrawerItem(
    title: 'Settings',
    icon: Icons.settings,
  ),
  DashboardDrawerItem(
    title: 'Logout',
    icon: Icons.logout,
  ),
];

class App extends StatelessWidget {
  App({super.key});
  final selectedPageIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: customColorSeed,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(drawerItems[selectedPageIndex.value].title)),
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
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
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
                            backgroundImage:
                                AssetImage('assets/images/dog.jpg'),
                            radius: 28,
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'Ruby Nicholas',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'rubyn@gmail.com',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                                const UserAnchorMenu(
                                  icon: Icon(Icons.arrow_drop_down),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    for (final (index, drawerItem) in drawerItems.indexed)
                      Obx(
                        () => DrawerListTile(
                            icon: drawerItem.icon,
                            title: drawerItem.title,
                            isSelected: selectedPageIndex.value == index,
                            onTap: () => selectedPageIndex.value = index),
                      )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    top: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Column(
                    // children: [
                    //   for (final (index, drawerItem) in drawerItems.indexed)
                    //     if (index >= drawerItems.length - 2)
                    //       Obx(
                    //         () => DrawerListTile(
                    //             icon: drawerItem.icon,
                    //             title: drawerItem.title,
                    //             isSelected: index == drawerItems.length < 2,
                    //             onTap: () => changePage(index)),
                    //       ),
                    // ],
                    ),
              )
            ],
          ),
        ),
        body: Obx(
          () =>
              drawerItems[selectedPageIndex.value].component ??
              const Text('No Component\'s Yet'),
        ),
      ),
    );
  }
}
