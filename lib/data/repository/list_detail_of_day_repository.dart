import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:projectsampledata/_core/utils/http_util.dart';

// 요일 별 운동 계획 상세보기 화면에 적용
class ListDetailOfDayInfoRepository {
  const ListDetailOfDayInfoRepository();

  // 요일 별 운동 계획 리스트 가져오도록 서버에 요청
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

  // 요일 별 운동 계획에서 운동 삭제하도록 서버에 요청
  Future<Map<String, dynamic>> deletePlan(int id) async {
    Response response = await dio.delete("/plan/$id/delete");

    Map<String, dynamic> body = response.data;

    Logger().d(body);
    return body;
  }
}
