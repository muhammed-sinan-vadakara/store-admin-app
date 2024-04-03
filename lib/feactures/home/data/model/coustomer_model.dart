// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'coustomer_model.freezed.dart';
part 'coustomer_model.g.dart';

@freezed
class CoustomerModel with _$CoustomerModel {
  const CoustomerModel._();

  factory CoustomerModel({
    required String? id,
    required String? name,
    required String? description,
    required String? amount,
  }) = _CoustomerModel;

  factory CoustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CoustomerModelFromJson(json);

  factory CoustomerModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;
    return CoustomerModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson()..remove('id');
  }
}
