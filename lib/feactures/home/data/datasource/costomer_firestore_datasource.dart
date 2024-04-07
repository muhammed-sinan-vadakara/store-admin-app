import 'package:store_admin_app/feactures/home/data/model/coustomer_model.dart';

abstract class CoustomerFirestoreDatasource {
  Future<void> add(CoustomerModel model);
  Future<void> update(CoustomerModel updatedModel, String id);
  Future<void> delete(String coustomerId);
  Stream<List<CoustomerModel>> getAllCoustomer();
  Future<CoustomerModel> getById(String id);
}
