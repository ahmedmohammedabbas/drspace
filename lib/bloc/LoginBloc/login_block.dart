import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:drspace/model/auth.dart';
import 'package:drspace/services/connection.dart';
import 'login_event.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(LoginInitial()) ; 
  final Connection _conn = new Connection();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    try {
      Auth auth = new Auth(email: event.email,password:  event.password);
      var json = jsonEncode(auth)   ;
      final  response = await _conn.userAuth(json);
      if (response.data != null) {
        yield LoginSuccess(authResponse: response);
      } else {
        yield LoginFailure(error: response.message! + response.errors!.message[0] );
      }
    }  catch (e) {
      yield LoginFailure(error: "An unknown error occured");
    }
  }
}

