import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(width: 24, height: 24, child: Obx(()=> Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value))),
        const SizedBox(width: Sizes.spaceBtwItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: "I agree to ", style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: "Privacy Policy", style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: dark ? AppColors.white : AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: dark ? AppColors.white : AppColors.primary,
            )),
            TextSpan(text: " and ", style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: "Terms of Use", style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: dark ? AppColors.white : AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: dark ? AppColors.white : AppColors.primary,
            )),
          ]))
      ],
    );
  }
}
