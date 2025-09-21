
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kadr/features/authentification/screens/onboarding/onboarding.dart';
import 'package:kadr/features/authentification/screens/signup/verify_email.dart';
import 'package:kadr/navigation_menu.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/authentification/screens/login/login.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      /// local storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
    }
  }

  /*------------------------- Email & Password sign-in -----------------*/

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // Бросаем сам объект, а не строку
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // Бросаем сам объект, а не строку
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User
  /// [EmailAuthentication] - FORGET PASSWORD

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential> signInWithGoogle() async {
    try {
      // (опционально) инициализация с clientId/serverClientId, если требуется:
      // await _googleSignIn.initialize(clientId: 'YOUR_CLIENT_ID', serverClientId: 'YOUR_SERVER_CLIENT_ID');
      await _googleSignIn.initialize(
        clientId: '283060311688-l5tr.apps.googleusercontent.com',  // iOS
        serverClientId: '283060311688-xxxx.apps.googleusercontent.com', // Web → Android
      );
      // Твое имя переменной: userAccount
      // ------------------
      if (!_googleSignIn.supportsAuthenticate()) {
        // Для Web/специфичных платформ нужен отдельный flow (web.renderButton / signInWithPopup и т.д.)
        // Здесь даём понятное исключение — если нужен web, скажи и я добавлю web-ветку.
        throw Exception('Platform requires a web sign-in flow. This function is mobile-only.');
      }

      final GoogleSignInAccount? userAccount = await _googleSignIn.authenticate();
      if (userAccount == null) {
        throw Exception('User cancelled the sign-in process');
      }

      // ------------------
      // Твое имя переменной: googleAuth (получаем idToken)
      // ------------------
      final GoogleSignInAuthentication? googleAuth = await userAccount.authentication;
      final String? idToken = googleAuth?.idToken; // для Firebase обычно достаточно idToken

      // ------------------
      // Если нужен accessToken (например, для вызова Google APIs) — получаем через authorizationClient
      // ------------------
      const List<String> scopes = <String>[
        'https://www.googleapis.com/auth/userinfo.email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ];
      final GoogleSignInClientAuthorization? clientAuth =
      await userAccount.authorizationClient.authorizationForScopes(scopes);
      final String? accessToken = clientAuth?.accessToken;

      // ------------------
      // Твое имя переменной: credentials (Firebase credential)
      // ------------------
      final OAuthCredential credentials = GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: accessToken,
      );

      // ------------------
      // Используем твой _auth для входа в Firebase
      // ------------------
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      // твои кастомные исключения можно применить здесь
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw Exception('Something went wrong. Please try again: $e');
    }
  }
  // Future<UserCredential> signInWithGoogle() async {
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
  //
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
  //
  //     // Create a new credential
  //     final credentials = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth?.idToken
  //     );
  //
  //     // Once signed in, return the UserCredential
  //     return await _auth.signInWithCredential(credentials);
  //
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(e.code);
  //   } on FirebaseException catch(e){
  //     throw TFirebaseException(e.code);
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code);
  //   } catch (e) {
  //     throw Exception('Something went wrong. Please try again');
  //   }
  // }

  /// [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }
}
