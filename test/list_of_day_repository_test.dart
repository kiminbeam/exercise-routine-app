import 'package:flutter_test/flutter_test.dart';
import 'package:projectsampledata/data/repository/list_detail_of_day_repository.dart';
import 'package:projectsampledata/data/repository/user_info_update_repository.dart';

void main() {
  test('Test ListDetailOfDayInfoRepository', () async {
    // Arrange
    ListDetailOfDayInfoRepository repo = ListDetailOfDayInfoRepository();

    int id = 1;

    // Act
    var result = await repo.deletePlan(id);

    // Assert
    expect(result, isNotNull); // 원하는 조건에 따라 수정
  });
}
