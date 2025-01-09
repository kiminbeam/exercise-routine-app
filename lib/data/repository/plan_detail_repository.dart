// 계획 상세 페이지에서 사용하는 repo
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../_core/utils/http_util.dart';

class PlanDetailRepository {
  const PlanDetailRepository();

  Future<Map<String, dynamic>> findByPlanID(planId) async {
    Response response = await dio.get("/plan/$planId");

    Map<String, dynamic> body = response.data;

    Logger().d(body);
    return body;
  }
}
