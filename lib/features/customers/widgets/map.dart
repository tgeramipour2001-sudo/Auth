import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:login/features/customers/functions/getUserLocation.dart';

class CustomerMap extends StatefulWidget {
  final String latitude;
  final String longitude;
  const CustomerMap({super.key, required this.latitude, required this.longitude});

  @override
  State<CustomerMap> createState() => _CustomerMapState();
}

class _CustomerMapState extends State<CustomerMap> {
 
  final MapController mapController = MapController();

  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
  }

@override
  void dispose() {
    
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 15, color: Colors.white30)],
      ),
      width: double.infinity,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: LatLng(double.parse(widget.latitude), double.parse(widget.longitude)),
            initialZoom: 16,
          ),

          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.login',
              
            ),
             if (widget.latitude != null && widget.longitude != null)
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(double.parse(widget.latitude), double.parse(widget.longitude)),
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 45,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
