import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kadr/data/repositories/authentication/authentication_repository.dart';
import 'package:kadr/data/repositories/user/user_repository.dart';
import 'package:kadr/features/authentification/screens/signup/verify_email.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../../utils/exceptions/firebase_exceptions.dart';
import '../../../../utils/exceptions/format_exceptions.dart';
import '../../../../utils/exceptions/platform_exceptions.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Signup
  void signup() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.loading);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if(!signupFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      /// PrivacyPolicy Check
      if (!privacyPolicy.value){
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.'
        );
        return;
      }

      print('----------------000000000000000000000000000000000000000000000---------------------------------');
      /// Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      print('----------------111111111111111111111111111111111----------------------------------');
      /// Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: ''
      );
      print('----------------2222222222222222222222222222222222222222222----------------------------------');

      final userRepository = Get.put(UserRepository());
      print('---------------333333333333333333333333333333333333333333333333---------------------------------');
      await userRepository.saveUserRecord(newUser);
      print('----------------4444444444444444444444444444444444444444444----------------------------------');
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

      /// Move to verify Email Screen
      Get.to(() => VerifyEmailScreen());

    } catch (e) {
      TFullScreenLoader.stopLoading();
      if (e is TFirebaseAuthException || e is TFirebaseException ||
          e is TPlatformException || e is TFormatException) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      } else if (e is Exception) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      } else {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: 'Something went wrong. Please try again');
      }
    }
  }
}