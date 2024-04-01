import 'package:store_admin_app/core/exceptions/authentication/auth_failed_exception.dart';
import 'package:store_admin_app/feactures/authentication/domain/repositories/auth_repository.dart';

final class LogoutUsecase {
  final AuthRepository repository;
  LogoutUsecase({required this.repository});

  Future<void> call() async {
    try {
      await repository.logout();
    } on Exception {
      throw AuthenticationFailedException(
          'Cannot logout. Please check your network');
    }
  }
}
