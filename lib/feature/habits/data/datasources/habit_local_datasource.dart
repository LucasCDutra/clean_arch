import 'package:clean_arch/feature/habits/data/models/habit_model.dart';

abstract class HabitLocalDatasource {
  Future<void> insertHabit(HabitModel habit);
  Future<void> updateHabit(HabitModel habit);
  Future<void> deleteHabit(String id);
  Future<List<HabitModel>> getHabits();
}
