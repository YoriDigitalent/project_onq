part of 'pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //note: HEADER
        Container(
          decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          padding: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              if (userState is UserLoaded) {
                return Center(
                    child: Text(
                  userState.userModel.nama,
                  style: whiteTextFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ));
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 60,
        ),

        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
          // ignore: deprecated_member_use
          child: RaisedButton(
              child: Center(
                child: Text(
                  "Jadwalkan Layanan",
                  style: blackTextFont.copyWith(fontSize: 16),
                ),
              ),
              color: Colors.orange,
              onPressed: () {
                context.bloc<PageBloc>().add(GoToMapPage());
              }),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
          // ignore: deprecated_member_use
          child: RaisedButton(
              child: Center(
                child: Text(
                  "Lihat Jadwalmu",
                  style: blackTextFont.copyWith(fontSize: 16),
                ),
              ),
              color: Colors.orange,
              onPressed: () {
                context.bloc<PageBloc>().add(GoToJadwalkuPage());
              }),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
          // ignore: deprecated_member_use
          child: RaisedButton(
              child: Center(
                child: Text(
                  "Panduan",
                  style: blackTextFont.copyWith(fontSize: 16),
                ),
              ),
              color: Colors.orange,
              onPressed: () {
                context.bloc<PageBloc>().add(GoToPanduanPage());
              }),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 30),
          // ignore: deprecated_member_use
          child: RaisedButton(
              child: Center(
                child: Text(
                  "Sign Out",
                  style: blackTextFont.copyWith(fontSize: 16),
                ),
              ),
              color: Colors.orange,
              onPressed: () {
                context.bloc<UserBloc>().add(SignOut());
                AuthServices.signOut();
              }),
        ),
      ],
    );
  }
}
