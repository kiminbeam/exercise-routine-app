import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_list_page/widgets/sliver_persistent_header_delegate.dart';

class ExerciseListBody extends StatelessWidget {
  const ExerciseListBody({
    super.key,
    required this.minHeight1,
    required this.screenHeight,
    required this.screenWidth,
    required this.aspectRatio,
  });

  final double minHeight1;
  final double screenHeight;
  final double screenWidth;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: MySliverPersistentHeaderDelegate(
            minHeight: minHeight1,
            maxHeight: screenHeight * 0.29,
            child: Container(
              color: Colors.teal.shade300,
              padding: EdgeInsets.only(
                  top: screenHeight * 0.008,
                  bottom: screenHeight * 0.008,
                  right: screenWidth * 0.015,
                  left: screenWidth * 0.015),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: screenWidth * 0.25, // 화면 너비의 25%
                        crossAxisSpacing: 0, // 가로 간격
                        mainAxisSpacing: 0, // 세로 간격
                        childAspectRatio: aspectRatio, // 가로:세로 비율
                      ),
                      physics: NeverScrollableScrollPhysics(),

                      shrinkWrap: true,

                      itemCount: 20,
                      // 고정된 그리드 아이템 개수
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.015,
                              vertical: screenHeight * 0.005),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.grey.shade300,
                            ),
                            onPressed: () {
                              print("부위 ${index + 1}");
                            },
                            child: Text(
                              '부위 ${index + 1}',
                              style: TextStyle(fontSize: screenWidth * 0.03),
                            ),
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
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return Container(
                height: screenHeight * 0.09,
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.01,
                    horizontal: screenHeight * 0.015),
                child: ElevatedButton(
                  onPressed: () {
                    print("운동명 ${index + 1} 클릭");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200, // 배경색 설정
                    foregroundColor: Colors.black38, // 텍스트 색 설정
                    elevation: 0, // 그림자 제거
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    ),
                  ),
                  child: Text(
                    "운동명 ${index + 1}",
                    style: TextStyle(fontSize: screenWidth * 0.04),
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
