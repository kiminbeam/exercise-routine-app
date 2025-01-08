import 'package:dio/dio.dart';

import '../../_core/utils/http_util.dart';

class WeekInfoRepository {
  const WeekInfoRepository();

  Future<Map<String, dynamic>> takeWeekInformaition(int id) async {
    Response response = await dio.get("/api/plan/user", data: id);
    Map<String, dynamic> body = response.data;
    return body;
  }
}
