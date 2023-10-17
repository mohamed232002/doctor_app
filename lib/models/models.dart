class RegesterModel{
  String name ;
  String phoneNumber;
  String email;
  String password;
  String confirmPassword;
  int gender;

  RegesterModel(
      {required this.name,
      required this.phoneNumber,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.gender});

  Map toJeson (){
    return{
      'name': name,
      'email': email,
      'phone': phoneNumber,
      'gender': gender,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }
}

class LoginModel{
  String password ;
  String email;

  LoginModel(
      {required this.password,
        required this.email,
    });

  Map toJeson (){
    return{
      'email': email,
      'password': password,
    };
  }
}