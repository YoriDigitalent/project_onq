part of 'model.dart';

class Formulir extends Equatable {
  final String namaLengkap;
  final int noNIK;
  final String tempatLahir;
  final DateTime tanggalLahir;
  final String alamatEmail;
  final int noHP;
  final String namaIbuKandung;
  final String alamatTinggal;

  Formulir(this.namaLengkap, this.noNIK, this.tempatLahir, this.tanggalLahir,
      this.alamatEmail, this.noHP, this.namaIbuKandung, this.alamatTinggal);

  @override
  List<Object> get props => [
        namaLengkap,
        noNIK,
        tempatLahir,
        tanggalLahir,
        alamatEmail,
        noHP,
        namaIbuKandung,
        alamatTinggal
      ];
}
