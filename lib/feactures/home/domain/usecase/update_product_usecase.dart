import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/entity/product_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/product_repository.dart';

final class UpdateProductUseCase {
  final ProductRepository repository;

  UpdateProductUseCase({required this.repository});

  Future<void> call({
    required String id,
    required String name,
    required String phonenumber,
    required String email,
    required String address,
  }) async {
    try {
      await repository.updateProduct(
          ProductEntity(
              productId: id,
              name: name,
              phonenumber: phonenumber,
              email: email,
              address: address),
          id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
