class User{
  String username;
  String password;
  String email;
  String number;

  User({this.username,this.password,this.email,this.number});
  User.from({this.username,this.password,this.email,this.number});

  User.fromJson(Map<String, dynamic> json)
      : username = json['.username'],
        email = json['.email'],
        number= json['.number'],
        password = json['.password'];

  Map<String, dynamic> toJson() =>{
    'username' : username,
    'password' : password,
    'email' : email,
    'number' : number
  };
}