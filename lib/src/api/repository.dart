import 'package:dat_bas_prosto/src/api/provider.dart';
import 'package:dat_bas_prosto/src/database/database_helper.dart';
import 'package:dat_bas_prosto/src/model/data_model.dart';

class Repository {
  DatabaseHelper databaseHelper = DatabaseHelper();
  AppProvider appProvider = AppProvider();

  /// database
  Future<int> saveIncidentType(DataModel item) =>
      databaseHelper.saveIncidentType(item);

  Future<List<DataModel>> getIncidentTypeDatabaseParent(int id) =>
      databaseHelper.getIncidentTypeDatabaseParent(id);

  Future<List<DataModel>> getIncidentTypeDatabase() =>
      databaseHelper.getIncidentTypeDatabase();

  Future<int> deleteIncidentType(int id) =>
      databaseHelper.deleteIncidentType(id);

  Future<int> updateIncidentType(DataModel products) =>
      databaseHelper.updateIncidentType(products);

  /// api
  Future<List<DataModel>> getData() => appProvider.getData();
}
