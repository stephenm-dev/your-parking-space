import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:your_parking_space/core/http_client.dart';
import 'package:your_parking_space/routes/app_router.dart';

void main() {
  HttpClient().init();
  runApp(
    GlobalLoaderOverlay(
      overlayWidgetBuilder: (_) => Container(
        color: Colors.black.withValues(alpha: 0.5),
        child: const Center(child: CircularProgressIndicator()),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}
