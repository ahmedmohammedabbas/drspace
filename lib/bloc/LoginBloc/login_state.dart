import 'package:drspace/model/auth.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {

  final AuthResponse authResponse ;
  LoginSuccess({required this.authResponse});

  @override
  List<Object> get props => [authResponse];
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}
