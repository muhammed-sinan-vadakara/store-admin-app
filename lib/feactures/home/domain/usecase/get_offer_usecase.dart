import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/entity/offer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/offer_repository.dart';

final class GetOfferUseCase {
  final OfferRepository repository;

  GetOfferUseCase({required this.repository});

  Stream<List<OfferEntity>> call() async* {
    try {
      final offerStream = repository.getAll();
      await for (final offers in offerStream) {
        yield [
          for (final offer in offers)
            OfferEntity(
                id: offer.id,
                name: offer.name,
                description: offer.description,
                amount: offer.amount,
                products: offer.products)
        ];
      }
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
