import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/coustomer_repository.dart';

final class GetOfferUseCase {
  final CoustomerRepository repository;

  GetOfferUseCase({required this.repository});

  Stream<List<CoustomerEntity>> call() async* {
    try {
      final coustomerStream = repository.getAllCoustomer();
      await for (final coustomers in coustomerStream) {
        yield [
          for (final coustomers in coustomers)
            CoustomerEntity(
              Coustomerid: coustomers.Coustomerid,
              name: coustomers.name,
              description: coustomers.description,
              amount: coustomers.amount,
            )
        ];
      }
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
