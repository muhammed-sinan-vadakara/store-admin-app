import 'package:freezed_annotation/freezed_annotation.dart';

part 'coustemer_entity.freezed.dart';

@freezed
class CoustomerEntity with _$CoustomerEntity {
  factory CoustomerEntity({
    required String Coustomerid,
    required String name,
    required String description,
    required String amount,
  }) = _CoustomerEntity;
}
