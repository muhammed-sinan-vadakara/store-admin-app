import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/repository/coustomer_repository.dart';

final class RemoveCoustomerUsecase {
  final CoustomerRepository repository;
  RemoveCoustomerUsecase({required this.repository});
  Future<void> call(String coustomerId) async {
    try {
      return repository.deleteCoustomer(coustomerId);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
