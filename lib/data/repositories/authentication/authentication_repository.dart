import 'package:flutter/foundation.dart';
import 'package:my_house/features/authentication/screens/login/login.dart';
import 'package:my_house/features/authentication/screens/onboarding/onboarding.dart';
import 'package:my_house/features/authentication/screens/signup/verify_email.dart';
import 'package:my_house/navigation_menu.dart';
import 'package:my_house/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:my_house/utils/exceptions/firebase_exceptions.dart';
import 'package:my_house/utils/exceptions/format_exceptions.dart';
import 'package:my_house/utils/exceptions/platform_exceptions.dart';
import 'package:my_house/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get authenticated user data
  User get authUser => _auth.currentUser!;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // remove the native splash
    FlutterNativeSplash.remove();
    //redirect to the approriate screen
    screenRedirect();
  }

  /// Function to show relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      // If user is logged in
      if (user.emailVerified) {

        // Initialize User Specific Storage
        await TLocalStorage.init(user.uid);

        // If the User's mail is Verified, navigate to NavigationMenu 
        Get.offAll(() => const NavigationMenu());
      } else {
        // If the User's mail is not Verified, navigate to VerifyEmailScreen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //localstorage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // check if it is first time user launch the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen()) //redirect to Login screen if not the first time
          : Get.offAll(() => const OnBoardingScreen()); //redirect to OnBoarding screen if it is first time
    }
  }

  /*-------------------Email & Password sign-in---------------------*/

  /// [EmailAuthentication]- SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication]- Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification]- Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication]- Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ReAuthenticate] ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      //create credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      
      //ReAuthenticate
      await _auth.currentUser?.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

 

  /*------------------- Federated identity & Social sign-in---------------------*/

  /// [GoogleAuthentication]- GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      /// Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      /// Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      /// Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  /// [AppleAuthentication]- APPLE


  /*------------------- ./End Federated identity & Social sign-in---------------------*/

  /// [LogoutUser]- Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      // signout the apple account
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [DeleteUser]- Remove user Auth and firstore account
  Future<void> deleteAccount() async {
    // try {
    //   await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
    //   await _auth.currentUser?.delete();
    // } on FirebaseAuthException catch (e) {
    //   throw TFirebaseAuthException(e.code).message;
    // } on FirebaseException catch (e) {
    //   throw TFirebaseException(e.code).message;
    // } on FormatException catch (_) {
    //   throw const TFormatException();
    // } on PlatformException catch (e) {
    //   throw TPlatformException(e.code).message;
    // } catch (e) {
    //   throw 'Something went wrong. Please try again';
    // }
  }
}








 //*****************************************************************
//   /*-------------------Phone Number sign-in---------------------*/

  // /// [PhoneNumberAuthentication]- send OTP
  // Future<String> sendOTP(String phone, String method) async {
  //   // Uri url = Uri.parse('$THttpHelper._baseUrl/api/v1/login');

  //   // Map<String, String> headers = {'Content-Type': 'application/json'};
  //   // Map<String, String> body = {'phone': phone ,'method': method};
  //   try {
  //     // return await http.post(url, headers: headers, body: body);
  //     return '$phone : $method';
      
  //   } on Exception catch (e) {
  //     throw 'Something went wrong. Please try again : ${e.toString()}';
  //   }
  // }

  // /// [PhoneNumberAuthentication]- Verify OTP
  //   Future<String> verifyOTP(String otp) async {
  //  // Uri url = Uri.parse('$THttpHelper._baseUrl/api/v1/login');

  //   // Map<String, String> headers = {'Content-Type': 'application/json'};
  //   // Map<String, String> body = {'phone': phone ,'method': method};
  //   try {
  //     // return await http.post(url, headers: headers, body: body);
  //     return '$otp';
  //   } on Exception catch (e) {
  //     throw 'Something went wrong. Please try again : ${e.toString()}';
  //   }
  // }


