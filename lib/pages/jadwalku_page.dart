part of 'pages.dart';

class JadwalkuPage extends StatefulWidget {
  @override
  _JadwalkuPageState createState() => _JadwalkuPageState();
}

class _JadwalkuPageState extends State<JadwalkuPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage());

          return;
        },
        child: Center(
          child: Text("Jadwalku adalah"),
        ));
  }
}
