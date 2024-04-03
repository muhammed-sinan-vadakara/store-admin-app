import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/entity/product_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/product_repository.dart';

final class AddProductUseCase {
  final ProductRepository repository;
  AddProductUseCase({required this.repository});
  Future<void> call({
    required String id,
    required String name,
    required String email,
    required String phonenumber,
    required String address,
  }) async {
    try {
      return await repository.addproduct(ProductEntity(
          name: name,
          productId: id,
          email: email,
          phonenumber: phonenumber,
          address: address));
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
