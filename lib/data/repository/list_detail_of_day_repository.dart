import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:projectsampledata/_core/utils/http_util.dart';

// 요일 별 운동 계획 상세보기 화면에 적용
class ListDetailOfDayInfoRepository {
  const ListDetailOfDayInfoRepository();

  Future<Map<String, dynamic>> takeListDetailOfDayInformaition(
      String day) async {
    Response response = await dio.get(
      "/api/plan",
      queryParameters: {"day": day},
    );

    Map<String, dynamic> body = response.data;

    Logger().d(body);
    return body;
  }
}
