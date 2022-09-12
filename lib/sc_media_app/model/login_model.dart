class LoginModel{

  String? username;
  String? password;

  int? result ;
  String? message;
  String? token;



  // {
  // "result": 1,
  // "message": "User authenticated",
  // "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2Vyc19pZCI6NDQsInVzZXJuYW1lIjoiYWhtZWRhYSIsInBhc3N3b3JkIjoiJDJiJDEwJFV1QjV1ci9seGxNSldYZ0g4OG13QWVVakhxbGI2NEd2b0cyb0oxLkJEdHZicHAxbjlDMjRPIiwiaWF0IjoxNjYyOTc0ODc2LCJleHAiOjE2NjI5Nzg0NzZ9.aOD6KnbglmY_rtTlHmeKABs60pfC0UpD-GywBv0snJA"
  // }

  LoginModel({this.username, this.password});


  LoginModel.fromJson(Map<String,dynamic> toJson) {
    result = toJson['result'];
    message = toJson['message'];
    token = toJson['token'];
  }


  Map<String,dynamic> toMap(){

    return {
      'password':password,
      'username':username,
    };
  }


}