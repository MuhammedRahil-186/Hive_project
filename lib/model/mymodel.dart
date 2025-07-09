import 'package:hive/hive.dart';

part 'mymodel.g.dart'; // ✅ must match this filename exactly

@HiveType(typeId: 0)
class StudentItem {
  @HiveField(0)
  final String subject;

  @HiveField(1)
  final String topic;

  @HiveField(2)
  final double duration;

  StudentItem({
    required this.subject,
    required this.topic,
    required this.duration,
  });
}
