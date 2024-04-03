import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';

abstract class CoustomerRepository {
  Future<CoustomerEntity> getById(String id);
  Future<void> addCoustomer(CoustomerEntity entity);
  Stream<List<CoustomerEntity>> getAllCoustomer();
  Future<void> deleteCoustomer(String coustomerId);
  Future<void> updateCoustomer(CoustomerEntity updatedEntity, String id);
}
