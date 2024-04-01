import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_entity.freezed.dart';

@freezed
class OfferEntity with _$OfferEntity {
  const factory OfferEntity({
    required String id,
    required String name,
    required String description,
    required double amount,
    required List<String> products,
  }) = _OfferEntity;
}
