import 'package:dart_bot/core/helper/api_helper.dart';
import 'package:dart_bot/model/field.dart';

class FieldApi extends ApiHelper<Field> {
  Future<List<Field>?> getDegrees(String degreeId) {
    return getItems('/fields', Field.fromJson, query: {"degreeId": degreeId});
  }
}
