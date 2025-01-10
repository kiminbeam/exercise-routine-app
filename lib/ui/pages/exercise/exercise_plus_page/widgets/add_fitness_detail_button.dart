import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/add_fitness_detail_vm.dart';

class AddFitnessDetailButton extends ConsumerWidget {
  final _fitnessId;
  final _dayOfWeek;
  final _exerciseSet;  // 세트 수
  final _repeat;  // 반복 횟수
  final _weight; // 무게

  AddFitnessDetailButton(this._fitnessId,this._dayOfWeek,this._exerciseSet,this._repeat,this._weight);

 @override
  Widget build(BuildContext context,WidgetRef ref) {
    AddFitnessDetailVM vm = ref.read(addFitnessDetailProvider(_fitnessId).notifier);
    return TextButton(
      onPressed: () {
        // 추가하기 동작
        vm.AddExerciseDetail(_fitnessId, _dayOfWeek,  _exerciseSet.text.trim(), _repeat.text.trim(),  _weight.text.trim());
      },
      child: Text(
        '추가하기',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      style: TextButton.styleFrom(
          backgroundColor: Colors.grey[600],
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
    );
  }
}
