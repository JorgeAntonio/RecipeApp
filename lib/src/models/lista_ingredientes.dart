class ListaRecetas {
  String name;
  String image;
  String description;
  List<String> categories;
  List<String> ingredients;
  List<String> steps;
  List<String> tags;
  String mealType;
  String difficulty;
  int time;
  int dinners;
  String lastUpdated;
  String language;

  ListaRecetas(
      {this.name,
      this.image,
      this.description,
      this.categories,
      this.ingredients,
      this.steps,
      this.tags,
      this.mealType,
      this.difficulty,
      this.time,
      this.dinners,
      this.lastUpdated,
      this.language});

  ListaRecetas.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    categories = json['categories'].cast<String>();
    ingredients = json['ingredients'].cast<String>();
    steps = json['steps'].cast<String>();
    tags = json['tags'].cast<String>();
    mealType = json['meal_type'];
    difficulty = json['difficulty'];
    time = json['time'];
    dinners = json['dinners'];
    lastUpdated = json['last_updated'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['categories'] = this.categories;
    data['ingredients'] = this.ingredients;
    data['steps'] = this.steps;
    data['tags'] = this.tags;
    data['meal_type'] = this.mealType;
    data['difficulty'] = this.difficulty;
    data['time'] = this.time;
    data['dinners'] = this.dinners;
    data['last_updated'] = this.lastUpdated;
    data['language'] = this.language;
    return data;
  }
}
