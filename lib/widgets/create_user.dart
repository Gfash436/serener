class UserSignUp {
  String firstname, lastname, email, password, phonenumber, age;
  UserSignUp({
    required this.password,
    required this.email,
    required this.age,
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["firstName"] = firstname;
    data["lastName"] = lastname;
    data["age"] = age;
    data["phoneNumber"] = phonenumber;
    data["password"] = password;
    data["email"] = email;
    return data;
  }
}
