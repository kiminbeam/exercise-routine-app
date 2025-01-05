import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/user_info_repository.dart';

class UserInfoModel {
  int id;
  String username;
  double weight;
  double height;

  UserInfoModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        username = map["username"] ?? '',
        weight = map["weight"] ?? 0,
        height = map["height"] ?? 0;
}

final userInfoProvider =
    NotifierProvider<UserInfoVM, UserInfoModel?>(UserInfoVM.new);

class UserInfoVM extends Notifier<UserInfoModel?> {
  final userInfoRepository = const UserInfoRepository();

  @override
  UserInfoModel? build() {
    state = null;
    init(1);
    return state;
  }

  Future<void> init(int id) async {
    Map<String, dynamic> responseBody =
        await userInfoRepository.findById(id: id);
    if (!responseBody["success"]) {
      state = null;
      return;
    }
    state = UserInfoModel.fromMap(responseBody["response"]);
  }
}
