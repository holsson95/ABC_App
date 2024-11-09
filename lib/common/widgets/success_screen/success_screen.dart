import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/spacing_styles.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/text_strings.dart';

import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed, });
  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: SpacingStyles.paddingWithAppBarHeight * 2,
      child: Column(
        children: [
          /// Image
          Image(
              image: AssetImage(image),
              width: HelperFunctions.screenWidth() * 0.6),
          SizedBox(height: Sizes.spaceBtwSections),

          /// Title & Subtitle
          Text(title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: Sizes.spaceBtwItems),
          Text(subtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: Sizes.spaceBtwSections),

          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(AppTexts.continueText))),
        ],
      ),
    )));
  }
}
