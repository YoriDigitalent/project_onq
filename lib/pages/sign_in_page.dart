part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: Colors.orange)));
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());

        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: Text(
                        "Halo!",
                        style: orangeTextFont.copyWith(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isEmailValid = EmailValidator.validate(text);
                        });
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Alamat Email",
                          hintText: "Email"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isPasswordValid = text.length >= 6;
                        });
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Password",
                          hintText: "Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Text(
                        "Lupa Password? ",
                        style: blackTextFont.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Klik di sini",
                        style: orangeTextFont.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ]),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 60, bottom: 40),
                      child: isSigningIn
                          ? SpinKitFadingCircle(
                              color: mainColor,
                            )
                          : FloatingActionButton(
                              child: Icon(Icons.arrow_forward,
                                  color: isEmailValid && isPasswordValid
                                      ? Colors.white
                                      : Colors.white30),
                              backgroundColor: isEmailValid && isPasswordValid
                                  ? Colors.orange
                                  : Colors.blueGrey,
                              onPressed: isEmailValid && isPasswordValid
                                  ? () async {
                                      setState(() {
                                        isSigningIn = true;
                                      });

                                      SignInSignUpResult result =
                                          await AuthServices.signIn(
                                              emailController.text,
                                              passwordController.text);

                                      if (result.userModel == null) {
                                        setState(() {
                                          isSigningIn = false;
                                        });

                                        // tampilan pesan
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Colors.redAccent,
                                          message: result.message,
                                        )..show(context);
                                      }
                                    }
                                  : null),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Belum punya akun? ",
                          style: blackTextFont.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Sign Up",
                          style: orangeTextFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
