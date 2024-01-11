import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (String? value) {
                    return (value != null && !value.contains('@')) ? 'Not valid email' : null;},),

                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (String? value) {
                    return (value!.length<6) ? 'password too short or empty' : null;},
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context).add(
                      LoginButtonPressed(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
