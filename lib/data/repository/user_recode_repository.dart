import 'package:dio/dio.dart';

import '../../_core/utils/http_util.dart';

class UserRecodeRepository {
  const UserRecodeRepository();

  Future<Map<String, dynamic>> findAllRecodesByUserId() async {
    Response response = await dio.get("/api/recode");
    Map<String, dynamic> body = response.data;
    return body;
  }
}
