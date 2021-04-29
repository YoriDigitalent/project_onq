part of 'pages.dart';

class InformationPage extends StatelessWidget {
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
                      fontSize: 20, fontWeight: FontWeight.w600),
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
        )
      ],
    );
  }
}
