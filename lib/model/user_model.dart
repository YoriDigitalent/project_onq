part of 'model.dart';

class UserModel extends Equatable {
  final String id;
  final String nama;
  final String email;

  UserModel(this.id, this.email, {this.nama});

  @override
  // ignore: todo
  // TODO: implement props)
  List<Object> get props => [id, nama, email];
}
