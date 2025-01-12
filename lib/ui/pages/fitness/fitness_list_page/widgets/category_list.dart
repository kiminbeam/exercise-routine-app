import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fitness_list_vm.dart';

class CategortList extends ConsumerWidget {
  const CategortList({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.model,
  });

  final double screenWidth;
  final double screenHeight;
  final FitnessListModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FitnessListModel 상태 구독
    final fitnessModel = ref.watch(fitnessListProvider);

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              // 현재 크롬 400보다 큼
              // 내 폰은 400보다 작음
              childAspectRatio: screenWidth < 400 ? 2 / 1.45 : 2 / 1,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: model.categoryItems.length,
            itemBuilder: (context, index) {
              // 선택 상태 확인
              final isSelected = fitnessModel?.selectedIndex == index;

              return Container(
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.015,
                    vertical: screenHeight * 0.005),
                height: 10,
                child: Card(
                  color: isSelected ? Colors.blue : Colors.white,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        // 선택된 인덱스를 업데이트
                        ref
                            .read(fitnessListProvider.notifier)
                            .selectIndex(index);
                      },
                      child: Text(
                        model.categoryItems[index].categoryName,
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? Colors.white : Colors.black,
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
    );
  }
}
