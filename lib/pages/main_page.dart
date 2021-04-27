part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OnQ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => (userState is UserLoaded)
                    ? Text(userState.userModel.nama)
                    : SizedBox()),
            // ignore: deprecated_member_use
            RaisedButton(
                child: Text("Sign Out"),
                onPressed: () {
                  AuthServices.signOut();
                }),
          ],
        ),
      ),
    );
  }
}
