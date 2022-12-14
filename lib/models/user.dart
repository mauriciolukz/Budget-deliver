class U_User{

  final int id;
  final String username;
  final String email;
  final String role;
  final String token;


  U_User({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.token
  });

  factory U_User.fromJson(dynamic json) {
    return U_User(
      id: json['user']['id'] as int,
      username: json['user']['username'] as String,
      email: json['user']['email'] as String,
      role: json['user']['role'] as String,
      token: json['token'] as String
    );
  }
  /*
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "caption": caption,
  };*/

}