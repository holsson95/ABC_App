import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/data/repositories/user/user_repository.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading  = false.obs; //#40 on youtube playlist
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user Record 
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try{
      if(userCredentials != null){
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');

        //Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join() : '',
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '', 
        );

        await userRepository.saveUserRecord(user);
      }

    } catch (e) {
      Loaders.warningSnackBar(title: 'Data not saved.', message: 'Somewthing went wrong');
    }
  }
}