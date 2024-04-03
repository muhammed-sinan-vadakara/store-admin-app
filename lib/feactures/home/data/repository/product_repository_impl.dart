import 'dart:core';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/home/data/datasource/product_firestore_datasource.dart';
import 'package:store_admin_app/feactures/home/data/datasource/product_firestore_datasource_impl.dart';
import 'package:store_admin_app/feactures/home/data/model/product_model.dart';
import 'package:store_admin_app/feactures/home/domain/entity/product_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/product_repository.dart';

part 'product_repository_impl.g.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductFirestoreDatasource datasource;
  ProductRepositoryImpl({required this.datasource});
  @override
  Future<void> addproduct(ProductEntity entity) async {
    final productadd = ProductModel(
      id: '',
      name: entity.name,
      phonenumber: entity.phonenumber,
      email: entity.email,
      address: entity.address,
    );
    await datasource.add(productadd);
  }

  @override
  Stream<List<ProductEntity>> getAllProduct() async* {
    final data = datasource.getAllProduct();
    await for (final snapshot in data) {
      final docs = snapshot;
      yield [
        for (final product in docs)
          ProductEntity(
              name: product.name ?? '',
              email: product.email ?? '',
              phonenumber: product.phonenumber ?? '',
              address: product.address ?? '',
              productId: product.id ?? '')
      ];
    }
  }

  @override
  Future<void> deleteProduct(String productId) async {
    await datasource.delete(productId);
  }

  @override
  Future<void> updateProduct(
      ProductEntity updatedEntity, String productId) async {
    await datasource.update(
        ProductModel(
          id: updatedEntity.productId,
          name: updatedEntity.name,
          email: updatedEntity.email,
          phonenumber: updatedEntity.phonenumber,
          address: updatedEntity.address,
        ),
        productId);
  }

  @override
  Future<ProductEntity> getById(String id) async {
    final data = await datasource.getById(id);
    return ProductEntity(
      productId: data.id ?? '',
      name: data.name ?? '',
      email: data.email ?? '',
      phonenumber: data.phonenumber ?? '',
      address: data.address ?? '',
    );
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(
    datasource: ref.read(productFirestoreDatasourceProvider),
  );
}
