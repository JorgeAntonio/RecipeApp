import 'package:hive/hive.dart';

part 'favoritos_adapter.g.dart';

@HiveType(typeId: 1)
class Favorite {
  @HiveField(0)
  String title;
  @HiveField(1)
  String image;
  @HiveField(2)
  String description;
  @HiveField(3)
  String ingredients;
  @HiveField(4)
  String steps;
  @HiveField(5)
  String time;
  @HiveField(6)
  String difficulty;
  @HiveField(7)
  String dinners;
  @HiveField(8)
  String video;

  Favorite({
    this.title,
    this.image,
    this.description,
    this.ingredients,
    this.steps,
    this.time,
    this.difficulty,
    this.dinners,
    this.video,
  });
}
