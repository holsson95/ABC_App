import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/styles/spacing_styles.dart';
import 'package:flutter_application_1/common/widgets/login_signup/form_divider.dart';
import 'package:flutter_application_1/common/widgets/login_signup/social_buttons.dart';
import 'package:flutter_application_1/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter_application_1/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo, title, subtitle
              const LoginHeader(),
              /// Form
              const LoginForm(),
              // Divider
              const FormDivider(dividerText: 'Or Sign In With'),
              const SizedBox(height: Sizes.spaceBtwSections),
              //Footer
              const SocialButtons(),
            ],
          ),
        ),
      )
    );
  }
}

