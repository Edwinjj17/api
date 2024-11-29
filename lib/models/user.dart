// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;

  User({required this.id,
     required this.firstname,
     required this.lastname,
     required this.email,
     required this.phone}); 

  User copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
  }) {
    return User(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, firstname: $firstname, lastname: $lastname, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.firstname == firstname &&
      other.lastname == lastname &&
      other.email == email &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstname.hashCode ^
      lastname.hashCode ^
      email.hashCode ^
      phone.hashCode;
  }
}
