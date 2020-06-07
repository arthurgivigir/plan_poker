class User {
  String name;
  int cardValue = 1;

  User({this.name, this.cardValue});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? '',
        cardValue = json['cardValue'] ?? 1;

  toJson() {
    return {
      'name': name,
      'cardValue': cardValue,
    };
  }
}
