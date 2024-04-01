import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/authentication/domain/repositories/auth_repository.dart';

final class EmailVerificationUsecase {
  final AuthRepository repository;
  EmailVerificationUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.emailVerify();
    } on Exception {
      throw BaseException('Cant verify');
    }
  }
}
