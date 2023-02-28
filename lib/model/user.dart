class User {
  final String id;
  final String name;
  final String number;
  final String mail;
  final String password;

  const User({
    required this.id,
    required this.name,
    required this.number,
    required this.mail,
    required this.password,
  });

  User copy({
    String? id,
    String? name,
    String? number,
    String? password,
    String? mail,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
        mail: mail ?? this.mail,
        password: password ?? this.password,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': number,
        'name': name,
        'number': number,
        'mail': mail,
        'password': password,
      };
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'].toString(),
        name: json['name'].toString(),
        number: json['number'].toString(),
        mail: json['mail'].toString(),
        password: json['password'].toString(),
      );
}
