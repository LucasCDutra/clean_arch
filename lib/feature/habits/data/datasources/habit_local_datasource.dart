abstract class HabitLocalDatasource {
  Future<void> insertHabit(Map<String, dynamic> habit);
  Future<void> updateHabit(Map<String, dynamic> habit);
  Future<void> deleteHabit(String id);
  Future<List<Map<String, dynamic>>> getHabits();
}
