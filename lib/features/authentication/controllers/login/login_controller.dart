import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_application_1/features/authentication/personalization/controllers/user_controller.dart';
import 'package:flutter_application_1/utils/constants/image_strings.dart';
import 'package:flutter_application_1/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController{

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> googleSignIn() async {
    try{
      FullScreenLoader.openLoadingDialog('Logging you in...', AppImages.docerAnimation);

      //Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      //Remove Loader
      FullScreenLoader.stopLoading();

    } catch(e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh no!', message: e.toString());
    }
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      FullScreenLoader.openLoadingDialog('Logging you in...', AppImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if(!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }


      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      FullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Uh Oh!', message: e.toString());
    }
  }
}