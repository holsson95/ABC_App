import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(Sizes.defaultSpace),
                child: Column(
                  children: [
                    /// Image with 60% Screen Width
                    Image(
                        image: const AssetImage(AppImages.verifyEmail),
                        width: HelperFunctions.screenWidth() * 0.6),
                    const SizedBox(height: Sizes.spaceBtwSections),
                    /// Email
                    Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                    /// Title & Subtitle
                    Text(
                      AppTexts.changeYourPasswordTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Sizes.spaceBtwItems),
                    Text(
                      AppTexts.changeYourPasswordSubTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Sizes.spaceBtwSections),

                    /// Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Get.off(() => const LoginScreen()),
                          child: const Text(AppTexts.done))),
                    SizedBox(height: Sizes.spaceBtwItems),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                          child: const Text(AppTexts.resendEmail)))
                  ],
                )
            )
          )
      );
  }
}
