
class Auth{

  String email ;
  String password ;
  Auth( { required this.email,   required this.password});

  Map toJson() => {
    'email': email,
    'password': password,
  };
}

class AuthResponse{

  String? message  ;
  Errors? errors ;
  Data? data;
  AuthResponse({required this.message, required this.errors,required this.data});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    if(json['message'] != null && json['errors'] != null){
    return AuthResponse(
      message: json['message'] ,
      errors: Errors.fromJson(json['errors'])  ,
      data: null
    );
    }else{
      return AuthResponse(
        message: null,
        errors: null ,
        data: Data.fromJson(json['data'])
      );


    }
  }

}
class Errors{

  List<String>  message ;
  Errors({required this.message});
  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
      message:  List.from(json['message']) ,
    );
  }
}

class Data{

  int  id ;
  String uuid  ;
  String name ;
  String email ;
  String createdAt  ;

  Data({required this.id,required this.uuid ,required this.name ,required this.email ,required this.createdAt });
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] ,
      uuid: json['uuid'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'],
    );
  }
}