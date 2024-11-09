import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(height: 150, image: AssetImage(AppImages.logo)),
        Text(AppTexts.loginText,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: Sizes.sm),
        Text(AppTexts.loginSubText,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
