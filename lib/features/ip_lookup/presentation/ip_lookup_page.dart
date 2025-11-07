import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:your_parking_space/core/http_client.dart';
import 'package:your_parking_space/features/ip_lookup/data/repositories/ip_lookup_repo_impl.dart';
import 'package:your_parking_space/features/ip_lookup/domain/usercases/get_ip_location.dart';
import 'package:your_parking_space/features/ip_lookup/presentation/bloc/ip_lookup_bloc.dart';
import 'package:your_parking_space/features/ip_lookup/presentation/widgets/app_button.dart';
import 'package:your_parking_space/features/ip_lookup/presentation/widgets/ip_location_error.dart';
import 'package:your_parking_space/features/ip_lookup/presentation/widgets/ip_location_result.dart';
import 'package:your_parking_space/routes/app_routes.dart';

class IpLookupPage extends StatelessWidget {
  const IpLookupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = IpLookupRepoImpl(dio: HttpClient.dio);
    final getIpLocation = GetIpLocation(repo);

    return BlocProvider(
      create: (_) => IpLookupBloc(getIpLocation),
      child: const IpLookupView(),
    );
  }
}

class IpLookupView extends StatelessWidget {
  const IpLookupView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('IP Geolocation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'IP Address',
              ),
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Lookup my IP',
                    onPressed: () {
                      context.read<IpLookupBloc>().add(
                        FetchIpLocation(),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: AppButton(
                    text: 'Lookup specific IP',
                    onPressed: () {
                      context.read<IpLookupBloc>().add(
                        FetchIpLocation(
                          ip: controller.text,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: BlocConsumer<IpLookupBloc, IpLookupState>(
                listener: (context, state) {
                  switch (state) {
                    case IpLookupInitial():
                      context.loaderOverlay.hide();
                    case IpLookupLoading():
                      context.loaderOverlay.show();
                    case IpLookupSuccess():
                      context.loaderOverlay.hide();
                      context.push(
                        MapRoute().location,
                        extra: state.ipLocation,
                      );
                    case IpLookupError():
                      context.loaderOverlay.hide();
                  }
                },
                builder: (_, state) {
                  switch (state) {
                    case IpLookupInitial():
                    case IpLookupLoading():
                      return const SizedBox.shrink();
                    case IpLookupSuccess():
                      return IpLocationResult(
                        ipLocation: state.ipLocation,
                      );
                    case IpLookupError():
                      return IpLocationError(
                        message: state.message,
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
