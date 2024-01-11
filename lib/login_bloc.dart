
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
          final token = data["refresh"
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMjIyNzg1MiwiaWF0IjoxNzA0NDUxODUyLCJqdGkiOiI2NzYzNDcyMzQwY2Y0NTY5OTQxYTY1MmNhZDU2M2YxMSIsInVzZXJfaWQiOjR9.qnPQ-mlmAnnAWJx5IAo14rZzPT9nJMnoMvM1648Myk"
    "access"
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEyMjI3ODUyLCJpYXQiOjE3MDQ0NTE4NTIsImp0aSI6IjhkNWFiMTBhMTA5YzQzMmU4Njk3YThmYmRlNWQ5OWY4IiwidXNlcl9pZCI6NH0.Q8rmT2FjdWG1VICjrKGncSpYQAsWXThJonDbVcTZFc"
    ]; // Assuming API returns a token;
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
