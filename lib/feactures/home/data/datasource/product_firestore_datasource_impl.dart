import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/home/data/datasource/product_firestore_datasource.dart';
import 'package:store_admin_app/feactures/home/data/model/product_model.dart';

part 'product_firestore_datasource_impl.g.dart';

class ProductFirestoreDatasourceImpl implements ProductFirestoreDatasource {
  final collection = FirebaseFirestore.instance
      .collection(
        "${user!.uid.toString()} Coustomers",
      )
      .withConverter(
          fromFirestore: ProductModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> add(ProductModel model) async {
    await collection.doc().set(model);
  }

  @override
  Stream<List<ProductModel>> getAllProduct() async* {
    final productStream = collection.snapshots(includeMetadataChanges: true);
    await for (final products in productStream) {
      yield [for (final product in products.docs) product.data()];
    }
  }

  @override
  Future<void> update(ProductModel updatedModel, String id) async {
    await collection.doc(id).set(updatedModel);
  }

  @override
  Future<void> delete(String coustomerId) async {
    await collection.doc(coustomerId).delete();
  }

  @override
  Future<ProductModel> getById(String id) async {
    final data = await collection.doc(id).get();
    return data.data()!;
  }
}

@riverpod
ProductFirestoreDatasource productFirestoreDatasource(
    ProductFirestoreDatasourceRef ref) {
  return ProductFirestoreDatasourceImpl();
}

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final myUid = user!.uid;
