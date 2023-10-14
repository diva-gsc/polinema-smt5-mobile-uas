import 'package:client/components/dashboard_drawer_menu.dart';
import 'package:client/components/user_anchor_menu.dart';
import 'package:client/config/custom_theme.dart';
import 'package:client/controllers/dashboard_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  final dashboardScreenController = Get.put(DashboardScreenController());

  App({super.key});
  final selectedPageIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(
              drawerItems[dashboardScreenController.selectedPageIndex].title,
            ),
          ),
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
        drawer: const DashboardDrawerMenu(),
        body: Obx(
          () =>
              drawerItems[dashboardScreenController.selectedPageIndex]
                  .component ??
              const Center(
                child: Text('No Component\'s Yet'),
              ),
        ),
      ),
    );
  }
}
