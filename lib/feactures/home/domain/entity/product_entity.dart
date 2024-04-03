import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required String productId,
    required String name,
    required String phonenumber,
    required String email,
    required String address,
  }) = _ProductEntity;
}
