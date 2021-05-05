part of 'pages.dart';

class PanduanPage extends StatefulWidget {
  @override
  _PanduanPageState createState() => _PanduanPageState();
}

class _PanduanPageState extends State<PanduanPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage());

          return;
        },
        child: Center(
          child: Text("Panduan"),
        ));
  }
}
