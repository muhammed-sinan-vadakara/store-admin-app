import 'dart:io';

import 'package:store_admin_app/feactures/home/domain/entity/offer_entity.dart';

abstract class OfferRepository {
  Future<void> addOffer(OfferEntity entity);
  Stream<List<OfferEntity>> getAll();
  Future<void> delete(String offerId);
  Future<void> updateOffer(OfferEntity updatedEntity, String id);
  Future<OfferEntity> getById(String id);
}
