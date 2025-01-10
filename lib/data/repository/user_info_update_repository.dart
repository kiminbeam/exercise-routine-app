import 'package:dio/dio.dart';
import 'package:projectsampledata/_core/utils/http_util.dart';

class UserInfoUpdateRepository {
  const UserInfoUpdateRepository();

  // init 시에 사용자 정보 가져 오는 메서드
  Future<Map<String, dynamic>> findByUserId(int id) async {
    Response response = await dio.get("/api/user/$id");
    Map<String, dynamic> body = response.data;

    return body;
  }

  Future<Map<String, dynamic>> updateUserInfo(
      Map<String, dynamic> requestData) async {
    Response response = await dio.put("/api/user/update", data: requestData);
    Map<String, dynamic> body = response.data;

    return body;
  }
}
