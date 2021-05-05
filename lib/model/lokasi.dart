part of 'model.dart';

class Lokasi {
  String placename;
  double latitude;
  double longitude;
  String address;
  String city;
  String province;
  String country;
  String branch;

  Lokasi(this.placename, this.latitude, this.longitude, this.address, this.city,
      this.province, this.country, this.branch);

  static Lokasi getJsonParser(dynamic json) {
    String placename = json['placename'];
    double latitude = json['latitude'];
    double longitude = json['longitude'];
    String address = json['address'];
    String city = json['city'];
    String province = json['province'];
    String country = json['country'];
    String branch = json['branch'];

    return new Lokasi(placename, latitude, longitude, address, city, province,
        country, branch);
  }
}

// Membuat fungsi decode file json yang memiliki kembalian berupa List Future
Future<List<Lokasi>> loadJson() async {
  return await rootBundle
      .loadString('assets/data/dataLoc.json')
      .then((String news) => json.decode(news) as List)
      .then((List value) {
    List<Lokasi> listLokasi = [];
    value.forEach((index) => listLokasi.add(Lokasi.getJsonParser(index)));
    return listLokasi;
  });
}
