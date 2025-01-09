import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';
import 'package:projectsampledata/data/repository/user_info_repository.dart';

class UserInfoModel {
  int id;
  String username;
  double weight;
  double height;

  UserInfoModel({
    required this.id,
    required this.username,
    required this.weight,
    required this.height,
  });

  UserInfoModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        username = map["username"] ?? '',
        weight = map["weight"] ?? 0,
        // toDouble()
        height = map["height"] ?? 0;

  UserInfoModel copyWith({String? username, double? weight, double? height}) {
    return UserInfoModel(
        id: this.id,
        username: username ?? this.username,
        weight: weight ?? this.weight,
        height: height ?? this.height);
  }
}

final userInfoProvider =
    NotifierProvider.autoDispose<UserInfoVM, UserInfoModel?>(UserInfoVM.new);

class UserInfoVM extends AutoDisposeNotifier<UserInfoModel?> {
  final userInfoRepository = const UserInfoRepository();

  @override
  UserInfoModel? build() {
    init();
    return null;
  }

  Future<void> init() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    Map<String, dynamic> responseBody =
        await userInfoRepository.findById(sessionUser.id!);
    if (!responseBody["success"]) {
      state = null;
      return;
    }
    state = UserInfoModel.fromMap(responseBody["response"]);
  }

  void updateUserInfo(Map<String, dynamic> updateData) {
    state = state!.copyWith(
      username: updateData["username"],
      weight: updateData["weight"],
      height: updateData["height"],
    );
  }
}
