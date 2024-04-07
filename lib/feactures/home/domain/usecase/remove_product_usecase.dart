import 'package:store_admin_app/core/exceptions/base_exception.dart';
import 'package:store_admin_app/feactures/home/domain/repository/product_repository.dart';

final class RemoveProductUsecase {
  final ProductRepository repository;
  RemoveProductUsecase({required this.repository});
  Future<void> call(String productId) async {
    try {
      return repository.deleteProduct(productId);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
