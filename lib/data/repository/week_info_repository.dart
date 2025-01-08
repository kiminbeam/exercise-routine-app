import 'package:dio/dio.dart';

import '../../_core/utils/http_util.dart';

class WeekInfoRepository {
  const WeekInfoRepository();

  Future<Map<String, dynamic>> takeWeekInformaition() async {
    Response response = await dio.get("/plan/user");
    Map<String, dynamic> body = response.data;
    return body;
  }
}
