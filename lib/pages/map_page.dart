part of 'pages.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final lokasiKC = await locations.getLokasi();
    setState(() {
      _markers.clear();
      for (final lokasi in lokasiKC.lokasi) {
        final marker = Marker(
          markerId: MarkerId(lokasi.placename),
          position: LatLng(lokasi.latitude, lokasi.longitude),
          infoWindow: InfoWindow(
            title: lokasi.placename,
            snippet: lokasi.address,
          ),
        );
        _markers[lokasi.placename] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage());

          return;
        },
        child: Scaffold(
            body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                    target: LatLng(-6.206928, 106.803364), zoom: 12.0),
                markers: _markers.values.toSet(),
              ),
              Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: APIKeys.apiKey,   // Put YOUR OWN KEY here.
          onPlacePicked: (result) { 
            print(result.address); 
            Navigator.of(context).pop();
          },
          initialPosition: HomePage.kInitialPosition,
          useCurrentLocation: true,
        ),
      ),
    );
            ],
          ),
        )));
  }
}
