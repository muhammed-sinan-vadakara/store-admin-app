import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/home/data/datasource/offer_firestore_datasource.dart';
import 'package:store_admin_app/feactures/home/data/datasource/offer_firestore_datasource_impl.dart';
import 'package:store_admin_app/feactures/home/data/model/offer_model.dart';
import 'package:store_admin_app/feactures/home/domain/entity/offer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/offer_repository.dart';

part 'offer_repository_impl.g.dart';

class OfferRepositoryImpl implements OfferRepository {
  final OfferFirestoreDatasource datasource;
  OfferRepositoryImpl({required this.datasource});
  @override
  Future<void> addOffer(OfferEntity entity) async {
    final offeradd = OfferModel(
        id: '',
        name: entity.name,
        description: entity.description,
        products: entity.products,
        amount: entity.amount);
    await datasource.add(offeradd);
  }

  @override
  Stream<List<OfferEntity>> getAll() async* {
    final data = datasource.getAllOffer();
    await for (final snapshot in data) {
      final docs = snapshot;
      yield [
        for (final offer in docs)
          OfferEntity(
              name: offer.name ?? '',
              description: offer.description ?? '',
              amount: offer.amount ?? 0,
              products: offer.products,
              id: offer.id ?? '')
      ];
    }
  }

  @override
  Future<void> delete(String offerId) async {
    await datasource.delete(offerId);
  }

  @override
  Future<void> updateOffer(OfferEntity updatedEntity, String offerId) async {
    await datasource.update(
        OfferModel(
            id: updatedEntity.id,
            name: updatedEntity.name,
            description: updatedEntity.description,
            amount: updatedEntity.amount,
            products: updatedEntity.products),
        offerId);
  }

  @override
  Future<OfferEntity> getById(String id) async {
    final data = await datasource.getById(id);
    return OfferEntity(
        id: data.id ?? '',
        name: data.name ?? '',
        description: data.description ?? '',
        amount: data.amount ?? 0,
        products: data.products);
  }
}

@riverpod
OfferRepository offerRepository(OfferRepositoryRef ref) {
  return OfferRepositoryImpl(
    datasource: ref.read(offerFirestoreDatasourceProvider),
  );
}
