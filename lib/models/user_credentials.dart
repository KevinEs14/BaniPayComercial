class UserCredentials{
  String email;
  String password;

  UserCredentials(this.email,this.password);

  Map<String, dynamic> toJson() => {
    "email":email,
    "password":password,
    "rememberMe":true,
    "username":email
  };


}