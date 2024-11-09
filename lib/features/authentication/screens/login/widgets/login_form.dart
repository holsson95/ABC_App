import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_application_1/features/authentication/screens/dashboard/dashboard_page.dart';
import 'package:flutter_application_1/features/authentication/screens/password_authentication/forgot_password.dart';
import 'package:flutter_application_1/features/authentication/screens/signup/signup.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: "Email"),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) =>
                    Validator.validatEmptyText('Password', value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),

            const SizedBox(height: Sizes.spaceBtwInputFields / 2),

            //Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                    ),
                    const Text("Remember Me"),
                  ],
                ),

                //Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text("Forgot Password"),
                ),
              ],
            ),
            const SizedBox(height: Sizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.off(() => DashboardPage(
                          userName: "Hannah",
                        )),
                    child: const Text("Sign In"))),
            const SizedBox(height: Sizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text("Create Account"))),
          ],
        ),
      ),
    );
  }
}
