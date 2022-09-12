class RegisterModel{

  String? firstname;
  String? lastname;
  String? username;
  String? password;


  RegisterModel({this.firstname, this.lastname, this.username, this.password});


  RegisterModel.fromJson(Map<String,dynamic> toJson) {
    username = toJson['username'];
    firstname = toJson['firstName'];
    lastname = toJson['lastName'];
  }


  Map<String,dynamic> toMap(){
    return {
      'password':password,
      'username':username,
      'firstname':firstname,
      'lastname':lastname,
    };
  }


}