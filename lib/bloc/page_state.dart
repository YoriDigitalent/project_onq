part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  OnRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnUserConfirmationPage extends PageState {
  final RegistrationData registrationData;

  OnUserConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnMapPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnJadwalkuPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnPanduanPage extends PageState {
  @override
  List<Object> get props => [];
}
