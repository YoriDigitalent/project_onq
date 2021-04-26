import 'package:flutter/material.dart';
import 'package:project_onq/services/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ignore: deprecated_member_use
              RaisedButton(
                  child: Text('Sign Up'),
                  onPressed: () async {
                    SignInSignUpResult result =
                        await AuthServices.signUp(email, password, nama);

                    if (result.userModel == null) {
                      print(result.message);
                    } else {
                      print(result.userModel.toString().split(',')[1]);
                    }
                  }),
              // ignore: deprecated_member_use
              RaisedButton(
                  child: Text('Sign In'),
                  onPressed: () async {
                    SignInSignUpResult result =
                        await AuthServices.signIn(email, password);

                    if (result.userModel == null) {
                      print(result.message);
                    } else {
                      print(result.userModel.toString().split(',')[1]);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
