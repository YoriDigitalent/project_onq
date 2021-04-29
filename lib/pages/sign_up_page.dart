part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpPage(this.registrationData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    namaController.text = widget.registrationData.nama;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: mainColor)));

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());

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
                    margin: EdgeInsets.only(top: 35, bottom: 40),
                    height: 50,
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
                            "Buat Akun Baru",
                            style: orangeTextFont.copyWith(fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                      controller: namaController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Nama Lengkap",
                        hintText: "Nama Lengkap",
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Alamat Email",
                        hintText: "Email",
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Password",
                        hintText: "Password",
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                      controller: retypePasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Konfirmasi Password",
                        hintText: "Konfirmasi Password",
                      )),
                  SizedBox(
                    height: 60,
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.arrow_forward),
                    backgroundColor: mainColor,
                    onPressed: () {
                      if (!(namaController.text.trim() != "" &&
                          emailController.text.trim() != "" &&
                          passwordController.text.trim() != "" &&
                          retypePasswordController.text.trim() != "")) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Colors.redAccent,
                          message: "Lengkapi semua input!",
                        )..show(context);
                      } else if (passwordController.text !=
                          retypePasswordController.text) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Colors.redAccent,
                          message:
                              "Password dan Konfirmasi Password tidak sesuai",
                        )..show(context);
                      } else if (passwordController.text.length < 6) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Colors.redAccent,
                          message: "Password kurang dari 6 karakter",
                        )..show(context);
                      } else if (!EmailValidator.validate(
                          emailController.text)) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Colors.redAccent,
                          message: "Alamat email tidak sesuai format",
                        )..show(context);
                      } else {
                        widget.registrationData.nama = namaController.text;
                        widget.registrationData.email = emailController.text;
                        widget.registrationData.password =
                            passwordController.text;

                        context.bloc<PageBloc>().add(
                            GoToUserConfirmationPage(widget.registrationData));
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
