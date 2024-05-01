import 'package:dart_bot/core/helper/api_helper.dart';
import 'package:dart_bot/model/degree.dart';

class DegreeApi extends ApiHelper<Degree> {
  Future<List<Degree>?> getDegrees(String countryId) {
    return getItems('/degrees', Degree.fromJson, query: {
      "countryId": countryId,
    });
  }
}
