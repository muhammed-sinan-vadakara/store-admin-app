import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/authentication/data/datasource/authentication_datasource_impl.dart';
import 'package:store_admin_app/feactures/authentication/data/datasource/authetication_datasource.dart';
import 'package:store_admin_app/feactures/authentication/domain/repositories/auth_repository.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource datasource;
  AuthRepositoryImpl({required this.datasource});

  @override
  Future<void> createAccount(String email, String password) async {
    await datasource.createAccount(email, password);
  }

  @override
  Future<void> loginUser(String email, String password) async {
    await datasource.loginUser(email, password);
  }

  @override
  Future<void> logout() async {
    await datasource.logout();
  }

  @override
  Future<void> emailVerify() async {
    await datasource.emailVerfication();
  }

  @override
  Future<void> resetPasswordbyemail(String email) async {
    await datasource.resetPassword(email);
  }

  @override
  Future<void> googleverifications() async {
    await datasource.googleverification();
  }

  @override
  Future<(String, int?)> phoneNumberVerificationbyOtp(
      String phoneNumber) async {
    return await datasource.phoneNumberVerificationbyOtp(phoneNumber);
  }

  @override
  Future<void> verifyPhoneOtp(String verificationId, String otp) async {
    await datasource.verifyOtp(verificationId, otp);
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
      datasource: ref.watch(firebaseAuthDataSourceProvider));
}
