import 'package:freezed_annotation/freezed_annotation.dart';

part 'coustemer_entity.freezed.dart';

@freezed
class CoustomerEntity with _$CoustomerEntity {
  const factory CoustomerEntity({
    required String id,
    required String name,
    required String description,
    required String amount,
  }) = _CoustomerEntity;
}
