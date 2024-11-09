import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/personalization/controllers/user_controller.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

//https://www.youtube.com/watch?v=Z37ukFI4Ot0

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override

  final controller = Get.put(UserController());

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(controller.user.value.fullName), 
            accountEmail: Text(controller.user.value.email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child:  Image.asset(
                  AppImages.profilePicF, 
                  width: 90, 
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 33, 38, 90)
            ),
          ),
          //Profile Setting
          ListTile(
            leading: Icon(Icons.person_2_outlined),
            title: Text('Profile Settings'),
            onTap: () => null,
          ),
          //App Settings
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('App Settings'),
            onTap: () => null,
          ),
          //Data
          ListTile(
            leading: Icon(Icons.poll_sharp),
            title: Text('Profile Settings'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}

