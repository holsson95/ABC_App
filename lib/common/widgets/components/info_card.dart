import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key, required this.name, required this.email,
  });
  final String name;
  final String email;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(CupertinoIcons.person, color: Colors.white,),
      ),
      title: Text(
        name,
        style: TextStyle(color: AppColors.textWhite),
      ),
      subtitle: Text(
        email, 
        style: TextStyle(color: AppColors.textWhite),
      ),
    );
  }
}