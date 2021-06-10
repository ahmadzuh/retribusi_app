import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signin_event.dart';
import 'signin_state.dart';

import '../../repositories/auth_repo.dart';
import '../auth_bloc/auth_bloc.dart';
import '../auth_bloc/auth_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final Auth _auth;
  final AuthBloc _authBloc;

  SignInBloc(Auth auth, AuthBloc authBloc)
      : this._auth = auth,
        this._authBloc = authBloc,
        assert(authBloc != null),
        super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    final currentState = state;
    if (event is SignInBtnPressed) {
      yield SignInLoading();
      if (currentState is SignInFailure) {
        yield SignInInitial();
      }
      try {
        final Response response = await _auth.signIn(
            email: event.email, password: event.password, deviceName: 'Mobile');
        final String message = response.data['message'].toString();
        final String token = response.data['token'].toString();

        if (response.data['status'] == true) {
          //ProfilePreference.setProfile(response.data['user']['name']);

          _authBloc.add(LoggedIn(token: token));
          yield SignInSuccess(message: message);
        } else {
          yield SignInFailure(message: message);
          print(message);
        }
      } catch (e) {
        yield SignInFailure(message: e.toString());
      }
    }
    if (event is SignOutBtnPressed) {
      _authBloc.add(LoggedOut());
      yield SignInInitial();
    }
  }
}
