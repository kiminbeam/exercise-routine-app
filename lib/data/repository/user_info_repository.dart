import 'package:dio/dio.dart';

class UserInfoRepository {
  const UserInfoRepository();

  Future<Map<String, dynamic>> findById({required int id}) async {
    Response response = await findUser();
    Map<String, dynamic> body = response.data;
    return body;
  }
}

// 아래는 샘플 데이터. 언제든지 변경될 수 있음
class User {
  int id;
  String username;
  double? height;
  double? weight;

  User({required this.id, required this.username, this.height, this.weight});

  static fromMap(Map<String, dynamic> map) {}
}

Future<Response> findUser() async {
  final user = {"id": 1, "username": "ssar", "weight": 50, "height": 150};

  Map<String, dynamic> responseBody = {
    'success': true,
    'response': user,
  };
  return Response(
    requestOptions: RequestOptions(path: '/user/1'),
    data: responseBody,
    statusCode: 200,
  );
}
