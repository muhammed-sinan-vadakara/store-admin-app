abstract class FirebaseAuthDataSource {
  Future<void> loginUser(String email, String password);
  Future<void> createAccount(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> logout();
  Future<void> emailChange();
  Future<void> emailVerfication();
  Future<void> phoneNumberChange(String phoneNumber);
  Future<void> googleverification();
  Future<void> fasebookVerification();
  Future<(String, int?)> phoneNumberVerificationbyOtp(String phoneNumber);
  Future<void> verifyOtp(String verificationId, String otp);
}

// import 'package:firebase_auth/firebase_auth.dart';

// abstract class AuthenthicationDataSoucre {
//   Future<UserCredential> loginUser(String password, String email);
//   Future<UserCredential> createAccount(String password, String email);
//   Future<void> logout();
// }
