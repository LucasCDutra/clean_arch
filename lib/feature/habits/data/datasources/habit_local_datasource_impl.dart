import 'package:clean_arch/core/database/app_database.dart';
import 'package:clean_arch/core/database/tables/habits_table.dart';
import 'package:clean_arch/feature/habits/data/datasources/habit_local_datasource.dart';
import 'package:sqflite/sqflite.dart';

class HabitLocalDatasourceImpl implements HabitLocalDatasource {
  Future<Database> get _db async => AppDatabase.instance;

  @override
  Future<void> deleteHabit(String id) async {
    final db = await _db;
    await db.delete(
      habitsTableName,
      where: '$habitsTableId = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getHabits() async {
    final db = await _db;
    return await db.query(habitsTableName);
  }

  @override
  Future<void> insertHabit(Map<String, dynamic> habit) async {
    final db = await _db;
    await db.insert(
      habitsTableName,
      habit,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateHabit(Map<String, dynamic> habit) async {
    final db = await _db;
    await db.update(
      habitsTableName,
      habit,
      where: '$habitsTableId = ?',
      whereArgs: [habit[habitsTableId]],
    );
  }
}
