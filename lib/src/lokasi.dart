import 'package:flutter/services.dart';

class Locations {
  List<Lokasi> lokasi;

  Locations({this.lokasi});

  Locations.fromJson(Map<String, dynamic> json) {
    if (json['lokasi'] != null) {
      // ignore: deprecated_member_use
      lokasi = new List<Lokasi>();
      json['offices'].forEach((v) {
        lokasi.add(new Lokasi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lokasi != null) {
      data['lokasi'] = this.lokasi.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

Future<Lokasi> loadJSON() async {
  await rootBundle.loadString('assets/data/dataLoc.json');
}

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

  Lokasi.fromJson(Map<String, dynamic> json) {
    placename = json['placename'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    city = json['city'];
    province = json['province'];
    country = json['country'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placename'] = this.placename;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['city'] = this.city;
    data['province'] = this.province;
    data['country'] = this.country;
    data['branch'] = this.branch;

    return data;
  }
}

class Coords {
  double latitude;
  double longitude;

  Coords({this.latitude, this.longitude});

  Coords.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;

    return data;
  }
}
