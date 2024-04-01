import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/authentication/domain/repositories/auth_repository.dart';

final class GoogleVerificationUsecase {
  final AuthRepository repository;
  GoogleVerificationUsecase({required this.repository});

  Future<void> call() async {
    try {
      await repository.googleverifications();
    } on Exception {
      throw BaseException('cannot login with google');
    }
  }
}
