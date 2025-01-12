import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/global_data/global_data.dart';
import 'package:projectsampledata/ui/pages/fitness/fitness_list_page/widgets/sliver_persistent_header_delegate.dart';

import 'fitness_list_vm.dart';

class FitnessListBody extends ConsumerWidget {
  FitnessListBody({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fitnessListModel = ref.watch(fitnessListProvider);
    if (fitnessListModel == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // 카테고리로 필터링 된 운동리스트
    final filteredItems = fitnessListModel.getFilteredFitnessItems();
    if (filteredItems == null) {
      return const SliverToBoxAdapter(
        child: Center(child: Text('선택된 카테고리에 운동이 없습니다.')),
      );
    }

    final int btnItemCount = fitnessListModel.categoryItems.length;

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: MySliverPersistentHeaderDelegate(
            minHeight: screenHeight * 0.1,
            maxHeight: screenHeight *
                ((btnItemCount % 4 == 0)
                    ? (0.03 + (btnItemCount / 4).toInt() * 0.083)
                    : (0.03 + ((btnItemCount / 4).toInt() + 1) * 0.083)),
            child: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.only(
                top: screenHeight * 0.008,
                bottom: screenHeight * 0.008,
                right: screenWidth * 0.015,
                left: screenWidth * 0.015,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: screenWidth < 400 ? 2 / 1.45 : 2 / 1,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: fitnessListModel.categoryItems.length + 1,
                      itemBuilder: (context, index) {
                        // 전체 버튼
                        if (index == 0) {
                          final isSelected =
                              fitnessListModel.selectedIndex == null;
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.015,
                              vertical: screenHeight * 0.005,
                            ),
                            child: InkWell(
                              onTap: () {
                                ref
                                    .read(fitnessListProvider.notifier)
                                    .selectIndex(null);
                              },
                              child: Card(
                                color:
                                    isSelected ? Colors.black12 : Colors.white,
                                child: Center(
                                  child: Text(
                                    '전체',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        // 카테고리 버튼들
                        final categoryIndex = index - 1;
                        final isSelected =
                            fitnessListModel.selectedIndex == categoryIndex;

                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.015,
                            vertical: screenHeight * 0.005,
                          ),
                          child: InkWell(
                            onTap: () {
                              ref
                                  .read(fitnessListProvider.notifier)
                                  .selectIndex(categoryIndex);
                            },
                            child: Card(
                              color: isSelected ? Colors.black12 : Colors.white,
                              child: Center(
                                child: Text(
                                  fitnessListModel.categoryItems[categoryIndex]
                                      .categoryName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
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
              final fitnessItem = filteredItems[index];
              return Padding(
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
                      onTap: () {
                        GlobalData.fitnessId = fitnessListModel.fitnessItems[index].fitnessId;
                        Navigator.pushNamed(context, "/add-fitness-page");
                      },
                      child: Center(
                        child: Text(
                          fitnessItem.fitnessName,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: filteredItems.length,
          ),
        ),
      ],
    );
  }
}
