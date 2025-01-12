import 'package:dio/dio.dart';

import '../../_core/utils/http_util.dart';

class WeekInfoRepository {
  const WeekInfoRepository();

  Future<Map<String, dynamic>> takeWeekInformaition(int id) async {
    Response response = await dio.get("/api/plan/user", data: id);
    Map<String, dynamic> body = response.data;
    return body;
  }

  Future<Map<String, dynamic>> updateWeekStatus(bool status, String dayOfWeekName) async {
    final data = {
      "status": status,
      "dayOfWeekName": dayOfWeekName
    };

    Response response = await dio.put("/api/plan", data: data);
    Map<String, dynamic> body = response.data;
    return body;
  }

  // 아래는 모든 기록을 recode 테이블로 옮겨담는 용
  // Future<Map<String, dynamic>> recodeAll() async {
  //   Response response = await dio.get("/recode-all");
  //   Map<String, dynamic> body = response.data;
  //   return body;
  // }
}
