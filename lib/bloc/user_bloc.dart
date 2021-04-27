import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_onq/model/model.dart';
import 'package:project_onq/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      UserModel userModel = await UserServices.getUser(event.id);
      yield UserLoaded(userModel);
    } else if (event is SignOut) {
      yield UserInitial();
    }
  }
}
