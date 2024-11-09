import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_application_1/data/repositories/user/user_repository.dart';
import 'package:flutter_application_1/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:flutter_application_1/utils/constants/image_strings.dart';
import 'package:flutter_application_1/utils/helpers/network_manager.dart';
import 'package:flutter_application_1/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

import '../../../../utils/popups/loaders.dart';
import '../../models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();


  /// SIGNUP
  void signup() async {
    try {
      /// Start loading
      FullScreenLoader.openLoadingDialog("We are processing your information...", AppImages.docerAnimation);
      
      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      
      /// Form Validation
      if (!signupFormKey.currentState!.validate()) return;
      
      /// Privacy Policy
      if(!privacyPolicy.value) {
        Loaders.warningSnackBar(
          title: 'Accept Privacy Policy', 
          message: 'In order to create an account, you must have to read and accept our Privacy Policy & Terms of Use');
          return;
      }
      /// Register user & save in firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      /// Save authenticated user in firebase store
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstname.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      FullScreenLoader.stopLoading();

      /// Show success message
      Loaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created. Veryif your email to continue.');

      /// Move to verify email screen
      Get.to(()=> VerifyEmail(email: email.text.trim()));


    } catch(e) {
      /// Show generic error to user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

    } finally {
      /// Remove loader
      FullScreenLoader.stopLoading();

    }
  }
}