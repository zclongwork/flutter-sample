import 'dart:async'; // 不导入会导致代码不能自动生成 https://pub.dev/packages/floor
import 'package:floor/floor.dart';
import 'timer_dao.dart';
import 'timer_record.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [TimerRecord])
abstract class AppDatabase extends FloorDatabase {
  TimerDao get timerDao;
}