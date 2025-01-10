// 계획 수정 페이지에서 사용하는 repo
import 'package:dio/dio.dart';
import 'package:projectsampledata/_core/utils/http_util.dart';

class PlanUpdateRepository {
  const PlanUpdateRepository();

  Future<Map<String, dynamic>> updatePlan(
      Map<String, dynamic> requestData) async {
    Response response =
        await dio.put("/plan/update", data: requestData); // 차후 /api 추가해야됨
    Map<String, dynamic> body = response.data;

    return body;
  }
}
