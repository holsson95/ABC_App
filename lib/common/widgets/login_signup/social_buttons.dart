import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/image_strings.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: Sizes.iconMd,
              height: Sizes.iconMd,
              image: AssetImage(AppImages.googleLogo),
            ),
          ),
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
      ],
    );
  }
}

