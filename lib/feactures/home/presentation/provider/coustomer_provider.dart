import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/home/data/repository/coustomer_repository_impl.dart';
import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/add_coustomer_usecase.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/get_coustomer_usecase.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/remove_coustomer_usecase.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/update_coustomer_usecase.dart';

part 'coustomer_provider.g.dart';

@riverpod
class Coustomer extends _$Coustomer {
  @override
  void build() {}

  Future<void> addcostomer({
    required String id,
    required String name,
    required String description,
    required String amount,
  }) {
    final repository = ref.watch(coustomerRepositoryProvider);
    return AddCoustomerUseCase(repository: repository)(
      id: id,
      name: name,
      description: description,
      amount: amount,
    );
  }

  Future<void> remove({required String id}) async {
    final repository = ref.watch(coustomerRepositoryProvider);
    await RemoveCoustomerUsecase(repository: repository)(id);
  }

  Future<void> updatecoustomer({
    required String costomerid,
    required String name,
    required String description,
    required String amount,
  }) async {
    final repository = ref.watch(coustomerRepositoryProvider);
    await UpdateCoustomerUseCase(repository: repository)(
      id: costomerid,
      name: name,
      description: description,
      amount: amount,
    );
  }
}

@riverpod
Stream<List<CoustomerEntity>> getAllcoustomer(GetAllcoustomerRef ref) {
  final repository = ref.read(coustomerRepositoryProvider);
  return GetOfferUseCase(repository: repository)();
}
