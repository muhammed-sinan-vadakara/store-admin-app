import 'package:store_admin_app/feactures/home/domain/entity/product_entity.dart';

abstract class ProductRepository {
  Future<ProductEntity> getById(String id);
  Future<void> addproduct(ProductEntity entity);
  Stream<List<ProductEntity>> getAllProduct();
  Future<void> deleteProduct(String productId);
  Future<void> updateProduct(ProductEntity updatedEntity, String id);
}
