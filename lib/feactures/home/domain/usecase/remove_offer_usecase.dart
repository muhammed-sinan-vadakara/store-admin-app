import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/repository/offer_repository.dart';

final class RemoveOfferUsecase {
  final OfferRepository repository;
  RemoveOfferUsecase({required this.repository});
  Future<void> call(String offerId) async {
    try {
      final data = await repository.getById(offerId);
      return repository.delete(offerId);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
