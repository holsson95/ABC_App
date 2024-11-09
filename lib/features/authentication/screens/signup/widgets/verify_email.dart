import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_application_1/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(AppImages.verifyEmail), width: HelperFunctions.screenWidth() * 0.6),
              SizedBox(height: Sizes.spaceBtwSections),

              /// Title & Subtitle
              Text(AppTexts.confirmEmailTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwItems),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwItems),
              Text(AppTexts.confirmEmailSubtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwSections),

              /// Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.checkEmailVerifcationSatus(), 
              child: const Text(AppTexts.continueText))),
              const SizedBox(height: Sizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: ()=> controller.sendEmailVerification(), child: const Text(AppTexts.resendEmail))),

            ],
          ),),
      )
    );
  }
}