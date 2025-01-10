import 'package:dio/dio.dart';

import '../../_core/utils/http_util.dart';

class FitnessListRepository {
  const FitnessListRepository();

  // 운동 전체 리스트 받아오기
  Future<Map<String, dynamic>> findAllFitness() async {
    Response response = await dio.get("/fitness-list");
    Map<String, dynamic> body = response.data;
    return body;
  }

  // 카테고리에 따른 운동리스트 받아오기
  Future<Map<String, dynamic>> findAllCategory() async {
    Response response = await dio.get("/category-list");
    Map<String, dynamic> body = response.data;
    return body;
  }
}
