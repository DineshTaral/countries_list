import 'package:country_list_project/constants/api_constants.dart';
import 'package:country_list_project/features/data/models/countries_model.dart';
import 'package:dio/dio.dart';

class CountriesRepository {
  final _dio = Dio();

  CountriesRepository();

  Future<List<CountriesModel>> getCountries() async {
    try {
      final response = await _dio.get(fetchCountriesApi);
      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => CountriesModel.fromJson(json)).toList();
    } catch (err) {
      rethrow;
    }
  }
}
