import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_application_1/features/authentication/screens/password_authentication/reset_password.dart';
import 'package:flutter_application_1/utils/constants/image_strings.dart';
import 'package:flutter_application_1/utils/helpers/network_manager.dart';
import 'package:flutter_application_1/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    FullScreenLoader.openLoadingDialog('Processing your request....', AppImages.docerAnimation);

    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {FullScreenLoader.stopLoading(); return;}

    if(forgetPasswordFormKey.currentState!.validate()) {
      FullScreenLoader.stopLoading();
      return;
    }

    await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
    
    FullScreenLoader.stopLoading();

    Loaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password');

    Get.to(() => ResetPassword(email: email.text.toString()));
    try {} catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Uh Oh!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    
    try {
      FullScreenLoader.openLoadingDialog('Processing your request....', AppImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {FullScreenLoader.stopLoading(); return;}

      await  AuthenticationRepository.instance.sendPasswordResetEmail(email);

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password');
    
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Uh Oh!', message: e.toString());
    }
  }
}