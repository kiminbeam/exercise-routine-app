import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/list_detail_of_day_info_repository.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/list_detail_of_day_vm.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/widgets/list_detail_of_day_button.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/widgets/list_detail_of_day_card.dart';

class ListDetailOfDayBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ListDetailOfDayPageModel? model = ref.watch(listDetailOfDayProvider);

    final list = model?.exercisesOfDayInformationList ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          // 추가하기 버튼
          child: ListDetailOfDayButton(),
        ),

        // 운동 리스트
        Expanded(
          child: list.isEmpty
              ? Center(
                  child: Text(
                    'No exercises available',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final exercise = list[index];
                    return ExerciseCard(exercisesOfDayInformation: exercise);
                  },
                ),
        ),
      ],
    );
  }
}
