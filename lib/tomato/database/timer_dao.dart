import 'package:floor/floor.dart';
import 'timer_record.dart';

@dao
abstract class TimerDao {
  @insert
  Future<void> insertTimer(TimerRecord timer);

  @Query('SELECT * FROM timer_records ORDER BY startTime DESC')
  Future<List<TimerRecord>> findAllTimers();
}