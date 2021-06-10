import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
  @override
  List<Object> get props => [];
}

class SignInBtnPressed extends SignInEvent {
  final String email, password, deviceName;

  SignInBtnPressed({this.email, this.password, this.deviceName});

  @override
  List<Object> get props => [email, password, this.deviceName];
}

class SignOutBtnPressed extends SignInEvent {}
