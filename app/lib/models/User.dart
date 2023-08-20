class User {
  String id;
  String username;
  String email;
  int contact_number;
  String password;
  String access_token;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.contact_number,
    required this.password,
    required this.access_token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['name'],
      email: json['email'],
      password: json['password'],
      contact_number: json['contact_number'],
      access_token: json['access_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }
}
