import 'package:dio/dio.dart';

import '../../_core/utils/http_util.dart';

class UserInfoRepository {
  const UserInfoRepository();

  Future<Map<String, dynamic>> findById(int id) async {
    Response response = await dio.get("/api/user/$id");
    Map<String, dynamic> body = response.data;
    return body;
  }
}
