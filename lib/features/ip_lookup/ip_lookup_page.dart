import 'package:flutter/material.dart';
import 'package:your_parking_space/features/ip_lookup/widgets/app_button.dart';
import 'package:your_parking_space/features/ip_lookup/widgets/app_text_field.dart';
import 'package:your_parking_space/routes/app_routes.dart';

class IpLookupPage extends StatelessWidget {
  const IpLookupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IP Geolocation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          children: [
            AppTextField(
              labelText: 'IP Address',
              controller: TextEditingController(),
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Look up IP',
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: AppButton(
                    text: 'Get My Current IP',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            AppButton(
              text: 'Go Map',
              onPressed: () {
                MapRoute().push(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
