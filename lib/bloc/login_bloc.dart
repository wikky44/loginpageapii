import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:loginpageapi/model/UserData.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final response = await http.post(
          Uri.parse('https://respos.menuclub.uk'),
          body: json.encode({
            'email': event.email,
            'password': event.password,
          }),
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          final token = data[UserData];
          yield LoginSuccess(token: token);
        } else {
          yield LoginFailure(error: 'Invalid credentials');
        }
      } catch (error) {
        yield LoginFailure(error: 'Network error');
      }
    }
  }
}
