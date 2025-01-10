// 계획 상세 페이지에서 사용하는 repo
import 'package:dio/dio.dart';

import '../../_core/utils/http_util.dart';

class PlanDetailRepository {
  const PlanDetailRepository();

  Future<Map<String, dynamic>> findByPlanID(planId) async {
    Response response = await dio.get("/plan/detail/$planId"); // /api붙이기

    Map<String, dynamic> body = response.data;

    return body;
  }
}
