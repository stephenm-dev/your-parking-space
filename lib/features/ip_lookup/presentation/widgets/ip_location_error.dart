import 'package:flutter/material.dart';

class IpLocationError extends StatelessWidget {
  const IpLocationError({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
        ),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
