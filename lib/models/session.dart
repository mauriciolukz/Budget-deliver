
class Session{

  final int id;
  final String username;
  final String role;
  final String token;

  Session({
    required this.id,
    required this.username,
    required this.role,
    required this.token
  });

  static Session fromJson(Map<String,dynamic> json) {
    return Session(
        id: json['id'],
        username: json['username'],
        role: json['role'],
        token: json['token']
    );
  }

  Map<String,dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "role": role,
      "token": token
    };
  }

}