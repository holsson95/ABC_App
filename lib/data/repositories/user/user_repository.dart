import 'package:flutter/services.dart';
import 'package:flutter_application_1/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/authentication/models/user_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save User Details
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_){
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  // Fetch User Details Based on User ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    }on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }

  }

  // Fetch User Details Based on User ID
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
  
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    }on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
  // Fetch User Details Based on User ID
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    }on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
  //Delete Account
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw CustomFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    }on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

}