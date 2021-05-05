import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_onq/model/model.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToRegistrationPage) {
      yield OnRegistrationPage(event.registrationData);
    } else if (event is GoToUserConfirmationPage) {
      yield OnUserConfirmationPage(event.registrationData);
    } else if (event is GoToMapPage) {
      yield OnMapPage(event.pageEvent);
    } else if (event is GoToJadwalkuPage) {
      yield OnJadwalkuPage();
    } else if (event is GoToPanduanPage) {
      yield OnPanduanPage();
    }
  }
}
