import 'package:store_admin_app/feactures/home/data/model/product_model.dart';

abstract class ProductFirestoreDatasource {
  Future<void> add(ProductModel model);
  Future<void> update(ProductModel updatedModel, String id);
  Future<void> delete(String productId);
  Stream<List<ProductModel>> getAllProduct();
  Future<ProductModel> getById(String id);
}
