import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/home/data/datasource/costomer_firestore_datasource.dart';
import 'package:store_admin_app/feactures/home/data/model/coustomer_model.dart';

part 'coustomer_firestore_datasource_impl.g.dart';

class CoustomerFirestoreDatasourceImpl implements CoustomerFirestoreDatasource {
  final collection = FirebaseFirestore.instance
      .collection(
        "${user!.uid.toString()} Product",
      )
      .withConverter(
          fromFirestore: CoustomerModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> add(CoustomerModel model) async {
    await collection.doc().set(model);
  }

  @override
  Stream<List<CoustomerModel>> getAllCoustomer() async* {
    final coustomerStream = collection.snapshots(includeMetadataChanges: true);
    await for (final coustomers in coustomerStream) {
      yield [for (final coustomers in coustomers.docs) coustomers.data()];
    }
  }

  @override
  Future<void> update(CoustomerModel updatedModel, String id) async {
    await collection.doc(id).set(updatedModel);
  }

  @override
  Future<void> delete(String coustomerId) async {
    await collection.doc(coustomerId).delete();
  }

  @override
  Future<CoustomerModel> getById(String coustomerid) async {
    final data = await collection.doc(coustomerid).get();
    return data.data()!;
  }
}

@riverpod
CoustomerFirestoreDatasource coustomerFirestoreDatasource(
    CoustomerFirestoreDatasourceRef ref) {
  return CoustomerFirestoreDatasourceImpl();
}

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final myUid = user!.uid;
