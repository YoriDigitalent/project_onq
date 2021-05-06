part of 'pages.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final lokasiKantor = await lokasiBank.loadJSON();
    setState(() {
      _markers.clear();
      for (final lok in lokasiKantor.lokasi) {
        final marker = Marker(
          markerId: MarkerId(lok.placename),
          position: LatLng(lok.latitude, lok.longitude),
          infoWindow: InfoWindow(
            title: lok.placename,
            snippet: lok.branch,
          ),
        );
        _markers[lok.placename] = marker;
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
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(41.2878742, 36.326696),
              zoom: 6,
            ),
            markers: _markers.values.toSet(),
          ),
        ));
  }
}
