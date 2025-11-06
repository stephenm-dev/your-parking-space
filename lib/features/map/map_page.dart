import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_parking_space/features/ip_lookup/domain/entities/ip_location.dart';

class MapPage extends StatelessWidget {
  const MapPage({
    super.key,
    required this.ipLocation,
  });
  final IpLocation ipLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        leading: BackButton(
          onPressed: context.pop,
        ),
      ),

      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(
                ipLocation.latitude,
                ipLocation.longitude,
              ),
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.arrive.your_parking_space',
              ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () => launchUrl(
                      Uri.parse('https://openstreetmap.org/copyright'),
                    ),
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(
                      ipLocation.latitude,
                      ipLocation.longitude,
                    ),
                    width: 80,
                    height: 80,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 16,
            right: 88,
            bottom: 30,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ipLocation.ip,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${ipLocation.city}, ${ipLocation.region}, ${ipLocation.countryName}',
                    ),
                    Text(
                      'Lat: ${ipLocation.latitude}, Lng: ${ipLocation.longitude}',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
