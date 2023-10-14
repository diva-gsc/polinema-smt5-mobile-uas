import 'package:client/models/dashboard_drawer_item.dart';
import 'package:client/screens/dashboard_screen.dart';
import 'package:client/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final drawerItems = [
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
      title: 'Settings', icon: Icons.settings, component: SettingsScreen()),
  DashboardDrawerItem(
    title: 'Logout',
    icon: Icons.logout,
  ),
];

class DashboardScreenController extends GetxController {
  final _selectedPageIndex = 0.obs;
  final bottomDrawerItemStartingIndex =
      2; // item <= drawerItems.length - 2 (Push Settings and Logout drawer item to bottom), used in dashboard_drawer_menu

  int get selectedPageIndex => _selectedPageIndex.value;
  set selectedPageIndex(int pageIndex) => _selectedPageIndex.value = pageIndex;
}
