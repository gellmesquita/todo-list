class ActivitiesEntity {
  final String description;
  final String id;
  ActivitiesEntity({ required this.description, required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
    };
  }

  factory ActivitiesEntity.fromJson(Map<String, dynamic> json) {
    return ActivitiesEntity(
      id: json['id'],
      description: json['description'],
    );
  }
}