import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/entity/product_entity.dart';
import 'package:store_admin_app/feactures/home/domain/repository/product_repository.dart';

final class GetProductUseCase {
  final ProductRepository repository;

  GetProductUseCase({required this.repository});

  Stream<List<ProductEntity>> call() async* {
    try {
      final productStream = repository.getAllProduct();
      await for (final products in productStream) {
        yield [
          for (final product in products)
            ProductEntity(
              productId: product.productId,
              name: product.name,
              phonenumber: product.phonenumber,
              email: product.email,
              address: product.address,
            )
        ];
      }
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
