import 'package:flutter/material.dart';
import 'package:movie_ui/core/theme/app_color.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.value,
  });

  final IconData iconData;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.black, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
