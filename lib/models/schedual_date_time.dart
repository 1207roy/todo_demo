import 'package:equatable/equatable.dart';

class SchedulableTime extends Equatable{
  const SchedulableTime([
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
  ])  : assert(hour >= 0 && hour < 24),
        assert(minute >= 0 && minute < 60),
        assert(second >= 0 && second < 60);

  final int hour;
  final int minute;
  final int second;

  Map<String, int> toMap() {
    return <String, int>{
      'hour': hour,
      'minute': minute,
      'second': second,
    };
  }

  @override
  List<Object> get props => [hour, minute, second];
}
