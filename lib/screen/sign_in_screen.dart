import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_state/bloc/login/login_bloc.dart';
import 'package:test_state/bloc/login/login_event.dart';
import 'package:test_state/bloc/login/login_state.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        /** dismiss keyboard on tap */
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocBuilder<LoginBloc, LoginState>(builder: (BuildContext context, state) {
          switch (state.status) {
            case LoginStatus.submissionInProgress:
              print('Login in progress');
              break;
            case LoginStatus.submissionFailed:
              print('Login Failed');
              break;
            case LoginStatus.submissionSuccess:
              print('Login Success');
              break;
            case LoginStatus.none:
              break;
            case LoginStatus.submissionFailedGoToSignUp:
              print('Go To Signup');
              break;
          }
          return _buildBody(context);
        }),
      ),
    ));
  }

  Widget _buildBody(BuildContext context) {
    return Center(
        child: Container(
      child: RaisedButton(
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(LoginSubmitted());
        },
        child: Text('Login'),
      ),
    ));
  }
}
