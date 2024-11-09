import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/login_signup/form_divider.dart';
import 'package:flutter_application_1/common/widgets/login_signup/social_buttons.dart';
import 'package:flutter_application_1/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Let's Create Your Account",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: Sizes.spaceBtwSections),
                // Form
                const SignUpForm(),
                const SizedBox(height: Sizes.spaceBtwSections),
                // Divider
                FormDivider(dividerText: "Or Sign Up With"),
                const SizedBox(height: Sizes.spaceBtwSections),
                const SocialButtons(),
              ],
            ),
          ),
        ));
  }
}

