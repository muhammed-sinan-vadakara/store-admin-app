import 'dart:core';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/home/data/datasource/costomer_firestore_datasource.dart';
import 'package:store_admin_app/feactures/home/data/datasource/coustomer_firestore_datasource_impl.dart';
import 'package:store_admin_app/feactures/home/data/model/coustomer_model.dart';
import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/coustomer_repository.dart';

part 'coustomer_repository_impl.g.dart';

class CoustomerRepositoryImpl implements CoustomerRepository {
  final CoustomerFirestoreDatasource datasource;
  CoustomerRepositoryImpl({required this.datasource});
  @override
  Future<void> addCoustomer(CoustomerEntity entity) async {
    final coustomeradd = CoustomerModel(
        id: '',
        name: entity.name,
        description: entity.description,
        amount: entity.amount);
    await datasource.add(coustomeradd);
  }

  @override
  Stream<List<CoustomerEntity>> getAllCoustomer() async* {
    final data = datasource.getAllCoustomer();
    await for (final snapshot in data) {
      final docs = snapshot;
      yield [
        for (final offer in docs)
          CoustomerEntity(
              name: offer.name ?? '',
              description: offer.description ?? '',
              amount: offer.amount ?? '',
              id: offer.id ?? '')
      ];
    }
  }

  @override
  Future<void> deleteCoustomer(String offerId) async {
    await datasource.delete(offerId);
  }

  @override
  Future<void> updateCoustomer(
      CoustomerEntity updatedEntity, String offerId) async {
    await datasource.update(
        CoustomerModel(
          id: updatedEntity.id,
          name: updatedEntity.name,
          description: updatedEntity.description,
          amount: updatedEntity.amount,
        ),
        offerId);
  }

  @override
  Future<CoustomerEntity> getById(String id) async {
    final data = await datasource.getById(id);
    return CoustomerEntity(
      id: data.id ?? '',
      name: data.name ?? '',
      description: data.description ?? '',
      amount: data.amount ?? '',
    );
  }
}

@riverpod
CoustomerRepository coustomerRepository(CoustomerRepositoryRef ref) {
  return CoustomerRepositoryImpl(
    datasource: ref.read(coustomerFirestoreDatasourceProvider),
  );
}
