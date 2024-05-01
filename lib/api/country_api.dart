import 'package:dart_bot/core/helper/api_helper.dart';
import 'package:dart_bot/model/country.dart';

class CountryApi extends ApiHelper<Country> {
  Future<List<Country>?> getCountries() {
    return getItems('/countrys', Country.fromJson);
  }
}
