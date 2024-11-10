
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/features/authentication/screens/dashboard/dashboard_page.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_application_1/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:flutter_application_1/navigation_menu.dart';
import 'package:flutter_application_1/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if(user !=null){
      if(user.emailVerified){
        Get.offAll(() => DashboardPage());
        } else{
        Get.offAll(() => VerifyEmail(email: _auth.currentUser?.email));
      } 
    } else {
        deviceStorage.writeIfNull('IsFirstTime', true);
        deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(()=>const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
      }
    }
    
  /* ------------ Federated identity & social sign in ---------------- */
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw CustomAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }
  /* ------------ Email & Password Sign In ---------------- */
  
  /// [EmailAuthentication] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong.';
    }
  }
  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong.';
    }
  }

  /// [EmailAuthentication] - MAIL VERIFY
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw CustomAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - FORGOT PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw CustomAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Logout User
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen()); 
    } on FirebaseAuthException catch (e) {
      throw CustomAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}