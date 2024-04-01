import 'package:store_admin_app/feactures/home/data/model/offer_model.dart';

abstract class OfferFirestoreDatasource {
  Future<void> add(OfferModel model);
  Future<void> update(OfferModel updatedModel, String id);
  Future<void> delete(String offerId);
  Stream<List<OfferModel>> getAllOffer();
  Future<OfferModel> getById(String id);
}
