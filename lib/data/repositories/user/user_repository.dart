import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Future<void> saveUserRecord(UserModel user) async {
  //   try {
  //     await _db.collection("Users").doc(user.id).set(user.toJson());
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
      print('User saved successfully: ${user.id}');
    } on FirebaseException catch (e) {
      print('FirebaseException: ${e.code}, ${e.message}');
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      print('FormatException while saving user');
      throw const TFormatException();
    } on PlatformException catch (e) {
      print('PlatformException: ${e.code}');
      throw TPlatformException(e.code);
    } catch (e, s) {
      print('Unknown error saving user: $e');
      print('Stack trace: $s');
      throw Exception('Something went wrong. Please try again');
    }
  }
}