abstract class AuthRepository {
  Future<void> loginUser(String email, String password);
  Future<void> createAccount(String email, String password);
  Future<void> logout();
  Future<void> emailVerify();
  Future<void> resetPasswordbyemail(String email);
  Future<void> googleverifications();
  Future<(String, int?)> phoneNumberVerificationbyOtp(String phoneNumber);
  Future<void> verifyPhoneOtp(String verificationId, String otp);
}

// import 'package:firebase_auth/firebase_auth.dart';

// abstract class AuthRepository {
//   Future<UserCredential> login(String password, String email);
//   Future<UserCredential> signup(String password, String email);
//   Future<void> singOut();
// }
