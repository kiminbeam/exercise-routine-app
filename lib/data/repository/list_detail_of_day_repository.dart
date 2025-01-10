import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:projectsampledata/_core/utils/http_util.dart';
import 'package:projectsampledata/data/repository/week_info_repository.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/list_detail_of_day_vm.dart';

// 요일 별 운동 계획 상세보기 화면에 적용
class ListDetailOfDayInfoRepository {
  const ListDetailOfDayInfoRepository();

  Future<Map<String, dynamic>> takeListDetailOfDayInformaition(
      int id, String day) async {
    Response response = await dio.get(
      "/plan/$id",
      queryParameters: {"day": day},
    );

    Map<String, dynamic> body = response.data;

    Logger().d(body);
    return body;
  }
}
