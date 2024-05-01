class User {
  final int id;
  final String countryId;
  final String back;
  User({required this.back, required this.id, required this.countryId});

  // Add fromJson function
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      countryId: json['countryId'],
      back: json['back'],
    );
  }

  // Add toJson function
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'countryId': countryId,
      'back': back,
    };
  }

  copyWith({int? id, String? countryId, String? back}) {
    return User(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      back: back ?? this.back,
    );
  }
}
