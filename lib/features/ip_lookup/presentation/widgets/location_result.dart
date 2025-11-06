import 'package:flutter/material.dart';
import 'package:your_parking_space/features/ip_lookup/domain/entities/ip_location.dart';
import 'package:your_parking_space/routes/app_routes.dart';

class IpLocationResult extends StatelessWidget {
  const IpLocationResult({
    super.key,
    required this.ipLocation,
  });

  final IpLocation ipLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Result:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                MapRoute().push<void>(context);
              },
              child: Row(
                children: [
                  Text(
                    'View in Map',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('IP: ${ipLocation.ip}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('City: ${ipLocation.city}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Region: ${ipLocation.region}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Country: ${ipLocation.countryName}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Postal: ${ipLocation.postal}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Latitude: ${ipLocation.latitude ?? '-'}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Longitude: ${ipLocation.longitude ?? '-'}'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
