import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../_core/utils/http_util.dart';

class ExerciseDetailRepository {
  const ExerciseDetailRepository();

  Future<Map<String, dynamic>> findById(id) async {
    Response response = await dio.get("/fitness/detail/$id");

    Map<String, dynamic> body = response.data;
    Logger().d(body);

    return body;
  }
}
