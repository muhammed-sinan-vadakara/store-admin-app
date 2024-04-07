import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/coustomer_repository.dart';

final class UpdateCoustomerUseCase {
  final CoustomerRepository repository;

  UpdateCoustomerUseCase({required this.repository});

  Future<void> call({
    required String id,
    required String name,
    required String description,
    required String amount,
  }) async {
    try {
      await repository.updateCoustomer(
          CoustomerEntity(
            Coustomerid: id,
            name: name,
            description: description,
            amount: amount,
          ),
          id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
