import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/coustomer_repository.dart';

final class AddCoustomerUseCase {
  final CoustomerRepository repository;
  AddCoustomerUseCase({required this.repository});
  Future<void> call({
    required String id,
    required String name,
    required String description,
    required String amount,
  }) async {
    try {
      return await repository.addCoustomer(CoustomerEntity(
        name: name,
        description: description,
        Coustomerid: id,
        amount: amount,
      ));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
