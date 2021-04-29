part of 'pages.dart';

class UserConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  UserConfirmationPage(this.registrationData);

  @override
  _UserConfirmationPageState createState() => _UserConfirmationPageState();
}

class _UserConfirmationPageState extends State<UserConfirmationPage> {
  bool isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<PageBloc>()
            .add(GoToRegistrationPage(widget.registrationData));
        return;
      },
      child: Scaffold(
          body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 35, bottom: 80),
                  height: 100,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToSplashPage());
                          },
                          child: Icon(Icons.arrow_back, color: Colors.black),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Konfirmasi\nAkun Baru",
                          style: orangeTextFont.copyWith(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Selamat Datang",
                  style: orangeTextFont.copyWith(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${widget.registrationData.nama}",
                  style: orangeTextFont.copyWith(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 100,
                ),
                (isSigningUp)
                    ? SpinKitFadingCircle(
                        color: Colors.grey,
                        size: 45,
                      )
                    : SizedBox(
                        width: 250,
                        height: 45,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Buat Akun Baru",
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () async {
                              setState(() {
                                isSigningUp = true;
                              });

                              SignInSignUpResult result =
                                  await AuthServices.signUp(
                                      widget.registrationData.email,
                                      widget.registrationData.password,
                                      widget.registrationData.nama);

                              if (result.userModel == null) {
                                setState(() {
                                  isSigningUp = false;
                                });

                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Colors.grey,
                                  message: result.message,
                                )..show(context);
                              }
                            })),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
