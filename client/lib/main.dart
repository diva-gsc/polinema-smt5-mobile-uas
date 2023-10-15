import 'package:client/components/dashboard_appbar.dart';
import 'package:client/components/dashboard_appbar_user.dart';
import 'package:client/components/dashboard_drawer_menu.dart';
import 'package:client/config/custom_theme.dart';
import 'package:client/controllers/auth_controller.dart';
import 'package:client/controllers/dashboard_screen_controller.dart';
import 'package:client/models/admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  final authController = Get.put(AuthController());

  authController.loggedUser = Admin(
    '1',
    'Ruby Nicholas',
    'a@gmail.com',
    'nicholasN',
    true,
    'assets/images/dog.jpg',
  );

  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final authController = Get.put(AuthController());

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
          appBar: DashboardAppBar(
            appBar: AppBar(),
            actions: const [DashboardAppBarUser()],
          ),
          drawer: const DashboardDrawerMenu(),
          body: MainContent()),
    );
  }
}

class MainContent extends StatelessWidget {
  MainContent({super.key});
  final dashboardScreenController = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int pageIndex = dashboardScreenController.selectedPageIndex;
      return drawerItems[pageIndex].component ??
          const Center(child: Text('No Component\'s Yet'));
    });
  }
}
