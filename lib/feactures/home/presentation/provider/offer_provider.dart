import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/home/data/repository/offer_repository_impl.dart';
import 'package:store_admin_app/feactures/home/domain/entity/offer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/add_offer_usecase.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/get_offer_usecase.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/remove_offer_usecase.dart';

part 'offer_provider.g.dart';

@riverpod
class Offer extends _$Offer {
  @override
  void build() {}

  Future<void> addOffer({
    required String id,
    required String name,
    required String description,
    required double amount,
    required List<String> product,
  }) {
    final repository = ref.watch(offerRepositoryProvider);
    return AddOfferUseCase(repository: repository)(
        id: id,
        name: name,
        description: description,
        amount: amount,
        product: product = product);
  }

  Future<void> remove({required String id}) async {
    final repository = ref.watch(offerRepositoryProvider);
    await RemoveOfferUsecase(repository: repository)(id);
  }
}

@riverpod
Stream<List<OfferEntity>> getAllOffers(GetAllOffersRef ref) {
  final repository = ref.read(offerRepositoryProvider);
  return GetOfferUseCase(repository: repository)();
}
