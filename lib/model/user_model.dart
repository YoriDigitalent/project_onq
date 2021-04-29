part of 'model.dart';

class UserModel extends Equatable {
  final String id;
  final String nama;
  final String email;

  UserModel(this.id, this.email, {this.nama});

  @override
  List<Object> get props => [id, nama, email];
}
