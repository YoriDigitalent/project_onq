part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToUserConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToUserConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToMapPage extends PageEvent {
  final PageEvent pageEvent;

  GoToMapPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class GoToJadwalkuPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToPanduanPage extends PageEvent {
  @override
  List<Object> get props => [];
}
