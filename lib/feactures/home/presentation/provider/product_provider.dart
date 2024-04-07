import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/home/data/repository/product_repository_impl.dart';
import 'package:store_admin_app/feactures/home/domain/entity/product_entity.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/add_product_usecase.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/get_product_usecase.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/remove_product_usecase.dart';
import 'package:store_admin_app/feactures/home/domain/usecase/update_product_usecase.dart';

part 'product_provider.g.dart';

@riverpod
class ProductProvider extends _$ProductProvider {
  @override
  void build() {}

  Future<void> addProduct({
    required String id,
    required String name,
    required String phonenumber,
    required String email,
    required String address,
  }) {
    final repository = ref.watch(productRepositoryProvider);
    return AddProductUseCase(repository: repository)(
      id: id,
      name: name,
      phonenumber: phonenumber,
      email: email,
      address: address,
    );
  }

  Future<void> removebyid({required String id}) async {
    final repository = ref.watch(productRepositoryProvider);
    await RemoveProductUsecase(repository: repository)(id);
  }

  Future<void> updateProduct({
    required String productId,
    required String name,
    required String phonenumber,
    required String email,
    required String address,
  }) async {
    final repository = ref.watch(productRepositoryProvider);
    await UpdateProductUseCase(repository: repository)(
      id: productId,
      name: name,
      address: address,
      email: email,
      phonenumber: phonenumber,
    );
  }
}

@riverpod
Stream<List<ProductEntity>> getAllproduct(GetAllproductRef ref) {
  final repository = ref.read(productRepositoryProvider);
  return GetProductUseCase(repository: repository)();
}
