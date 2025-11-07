import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
              onTap: () => context.push(
                MapRoute().location,
                extra: ipLocation,
              ),
              child: Row(
                children: [
                  Text(
                    'View on Map',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Flexible(
          child: Card(
            child: ListView(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              children: [
                _IpInfoRow(
                  label: 'IP Address',
                  value: ipLocation.ip,
                ),
                _IpInfoRow(
                  label: 'City',
                  value: ipLocation.city,
                ),
                _IpInfoRow(
                  label: 'Region',
                  value: ipLocation.region,
                ),
                _IpInfoRow(
                  label: 'Country',
                  value: ipLocation.countryName,
                ),
                _IpInfoRow(
                  label: 'Postal',
                  value: ipLocation.postal,
                ),
                _IpInfoRow(
                  label: 'Latitude',
                  value: ipLocation.latitude.toString(),
                ),
                _IpInfoRow(
                  label: 'Longitude',
                  value: ipLocation.longitude.toString(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _IpInfoRow extends StatelessWidget {
  const _IpInfoRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        '$label: $value',
      ),
    );
  }
}
