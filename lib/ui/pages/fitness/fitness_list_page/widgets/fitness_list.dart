import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fitness_list_vm.dart';

class FitnessList extends ConsumerWidget {
  const FitnessList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FitnessListModel 상태 구독
    final fitnessListModel = ref.watch(fitnessListProvider);

    // 로딩 상태 처리
    if (fitnessListModel == null) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final fitnessItem = fitnessListModel.fitnessItems[index];
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
                  onTap: () {
                    // 필요 시 특정 동작 추가 가능
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
        childCount: fitnessListModel.fitnessItems.length,
      ),
    );
  }
}
