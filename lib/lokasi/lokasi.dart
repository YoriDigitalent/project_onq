import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;

class Locations {
  List<Lokasi> lokasi;

  Locations({this.lokasi});

  Locations.fromJson(Map<String, dynamic> json) {
    if (json['lokasi'] != null) {
      // ignore: deprecated_member_use
      lokasi = new List<Lokasi>();
      json['lokasi'].forEach((v) {
        lokasi.add(new Lokasi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lokasi != null) {
      data['offices'] = this.lokasi.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

Future<Locations> getLokasi() async {
  const lokasiURL =
      'https://firebasestorage.googleapis.com/v0/b/project-onq.appspot.com/o/dataLoc.json?alt=media&token=e6ac856f-8b99-43e7-baea-e062cbcb3db3';

  final response = await http.get(lokasiURL);
  if (response.statusCode == 200) {
    return Locations.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(lokasiURL));
  }
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

  Lokasi(
      {this.placename,
      this.latitude,
      this.longitude,
      this.address,
      this.city,
      this.province,
      this.country,
      this.branch});

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
