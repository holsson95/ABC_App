import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/dashboard/dashboard_page.dart';
import 'package:flutter_application_1/features/authentication/screens/dashboard/dashboard.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = HelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? AppColors.black : Colors.white,
          indicatorColor: darkMode ? AppColors.white.withOpacity(0.1) : AppColors.black.withOpacity(0.1), 
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Dashboard'),
            NavigationDestination(icon: Icon(Iconsax.note), label: 'ABC Chart'),
            NavigationDestination(icon: Icon(Iconsax.graph), label: 'Graph'),
            NavigationDestination(icon: Icon(Iconsax.star), label: 'Intervention')
          ]
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [const DashboardPage2(), DashboardPage(userName: "Hannah"),Container(color: Colors.orange),Container(color: Colors.pink)];
}