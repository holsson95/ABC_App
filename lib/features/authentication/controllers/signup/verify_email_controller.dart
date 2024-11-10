import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_application_1/utils/constants/image_strings.dart';
import 'package:flutter_application_1/utils/constants/text_strings.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }
  //Send Email Verification
  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(title: 'Email Sent', message: 'Please Check your inbox and verify your email');
    } catch(e){
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Timer to redirect
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), 
    (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(()=> SuccessScreen(
          image: AppImages.staticSuccessIllustration, 
          title: AppTexts.yourAccountCreatedTitle, 
          subtitle: AppTexts.yourAccountCreatedSubTitle, 
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    }
    );
  }

  checkEmailVerifcationSatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified) {
      Get.off(()=> SuccessScreen(
          image: AppImages.staticSuccessIllustration, 
          title: AppTexts.yourAccountCreatedTitle, 
          subtitle: AppTexts.yourAccountCreatedSubTitle, 
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
      );
    }
  }

}
