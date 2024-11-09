import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_application_1/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Headings
                Text(AppTexts.forgetPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: Sizes.spaceBtwItems),
                Text(AppTexts.forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: Sizes.spaceBtwSections * 2),

                /// Text Field
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: TextFormField(
                    controller: controller.email,
                    validator: Validator.validateEmail,
                    decoration: InputDecoration(
                        labelText: AppTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                  ),
                ),
                const SizedBox(height: Sizes.spaceBtwSections),

                /// Submit Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.sendPasswordResetEmail(),
                        child: const Text(AppTexts.submit)))
              ],
            )
          )
        );
  }
}
