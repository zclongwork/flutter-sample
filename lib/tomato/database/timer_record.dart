import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

@Entity(tableName: 'timer_records')
class TimerRecord {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String startTime;

  final String endTime;

  final String type;

  TimerRecord(this.id, this.startTime, this.endTime, this.type);

  // 格式化时间
  String get formattedStartTime => DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(startTime));
  String get formattedEndTime => DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(endTime));
}