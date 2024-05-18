import 'package:flutter/services.dart' show rootBundle;
import 'package:exman_ruben_alvarado_62111565/models/data_model.dart';

class DataService {
  Future<List<DataModel>> fetchData() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    return DataModel.fromJsonList(jsonString);
  }
}
