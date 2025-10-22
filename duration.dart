class MyDuration {
  final int _milliseconds;

  MyDuration(this._milliseconds) {
    if (_milliseconds < 0) {
      throw Exception('Duration cannot be negative!');
    }
  }

  factory MyDuration.fromHours(int hours) {
    if (hours < 0) {
      throw Exception("Duration cannot be negative!");
    }
    return MyDuration(hours * 3600000);  // Must return an instance
  }

  factory MyDuration.fromMinutes(int minutes) {
    if (minutes < 0) {
      throw Exception("Duration cannot be negative!");
    }
    return MyDuration(minutes * 60000);  // Must return an instance
  }

  factory MyDuration.fromSeconds(int seconds) {
    if (seconds < 0) {
      throw Exception("Duration cannot be negative!");
    }
    return MyDuration(seconds * 1000);  // Must return an instance
  }

  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration(_milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    if (_milliseconds - other._milliseconds < 0) {
      throw Exception('Resulting duration cannot be negative!');
    }
    return MyDuration(_milliseconds - other._milliseconds);
  }

  // Fixed typo: "inMileseconds" -> "inMilliseconds"
  int get inMilliseconds => _milliseconds;
  int get inSeconds => (_milliseconds / 1000).round();
  int get inMinutes => (_milliseconds / 60000).round();
  int get inHours => (_milliseconds / 3600000).round();

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
} 

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes// 3 hours, 0 minutes, 0 seconds
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); // true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}