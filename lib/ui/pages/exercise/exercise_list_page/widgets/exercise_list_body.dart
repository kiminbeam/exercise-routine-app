import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_list_page/widgets/exercise_list_vm.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_list_page/widgets/sliver_persistent_header_delegate.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ExerciseListBody extends ConsumerWidget {
  ExerciseListBody({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ExerciseListModel? model = ref.watch(ExerciseListProvider);
    ExerciseListVM vm = ref.read(ExerciseListProvider.notifier);
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      int btnitemCount = vm.count;
      return CustomScrollView(
        slivers: [
          SmartRefresher(
            controller: vm.refreshCtrl,
            enablePullUp: true,
            onRefresh: () async => await vm.init(),
            child: SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: MySliverPersistentHeaderDelegate(
                minHeight: screenHeight * 0.1,
                maxHeight: screenHeight *
                    ((btnitemCount % 4 == 0)
                        ? (0.03 + (btnitemCount / 4).toInt() * 0.083)
                        : (0.03 + ((btnitemCount / 4).toInt() + 1) * 0.083)),
                child: Container(
                  color: Colors.grey[300],
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.008,
                      bottom: screenHeight * 0.008,
                      right: screenWidth * 0.015,
                      left: screenWidth * 0.015),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: screenWidth < 400 ? 2 / 1 : 5 / 2,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: btnitemCount,
                          // 부위
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.015,
                                  vertical: screenHeight * 0.005),
                              height: 10,
                              child: Card(
                                child: Center(
                                    child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "${model.categoryName}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 운동리스트 시작!
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: 100,
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        // onTap: () {
                        //   MaterialPageRoute(
                        //     builder: (_) =>
                        //         이동할페이지 넣기
                        //   )
                        // },
                        child: Center(
                            child: Text(
                          "${model.fitnessName}",
                          style: TextStyle(fontSize: 30),
                        )),
                      ),
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      );
    }
  }
}
