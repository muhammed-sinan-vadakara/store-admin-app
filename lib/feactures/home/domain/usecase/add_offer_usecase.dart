import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/entity/offer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/offer_repository.dart';

final class AddOfferUseCase {
  final OfferRepository repository;
  AddOfferUseCase({required this.repository});
  Future<void> call({
    required String id,
    required String name,
    required String description,
    required double amount,
    required List<String> product,
  }) async {
    try {
      return await repository.addOffer(OfferEntity(
          name: name,
          description: description,
          products: product,
          amount: amount,
          id: id));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
