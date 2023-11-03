
import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final bool isCompleted;

  Todo({ required this.title, required this.description,  required this.isCompleted});

}
