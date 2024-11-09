import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter_application_1/features/authentication/screens/signup/widgets/terms_conditions.dart';
import 'package:flutter_application_1/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller =  Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) => Validator.validatEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: Sizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => Validator.validatEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
    
          
    
          const SizedBox(height: Sizes.spaceBtwInputFields),
    
          //Email
          TextFormField(
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
    
          //Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => Validator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
    
          //Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value) => Validator.validatePassword(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
              ),
            ),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),
    
          const TermsAndConditions(),
          const SizedBox(height: Sizes.spaceBtwSections),
          SizedBox(
            width: double.infinity, 
            child: ElevatedButton(
              onPressed: ()=> controller.signup(), 
            child: const Text("Create Account")
            ),
          )
        ],
      ),
    );
  }
}

