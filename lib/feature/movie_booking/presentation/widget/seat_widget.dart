import 'package:flutter/material.dart';
import 'package:movie_ui/core/theme/app_color.dart';

class SeatWidget extends StatelessWidget {
  const SeatWidget({
    super.key,
    required this.seatNumber,
    this.onTap,
    this.height = 50,
    this.width = 50,
    this.isSelected = false,
    this.isAvailable = true,
  });

  final void Function()? onTap;
  final String seatNumber;
  final double width;
  final double height;
  final bool isSelected;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isAvailable ? onTap : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isAvailable
              ? isSelected
                  ? AppColor.primaryColor
                  : AppColor.white
              : Colors.grey,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isAvailable
                ? isSelected
                    ? AppColor.primaryColor
                    : Colors.grey
                : Colors.grey,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          seatNumber,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isAvailable
                    ? AppColor.black
                    : AppColor.black.withOpacity(0.6),
              ),
        ),
      ),
    );
  }
}

class SeatInfoWidget extends StatelessWidget {
  const SeatInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: false,
        ),
        const SizedBox(width: 4),
        Text(
          "Reserved",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 16),
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: true,
        ),
        const SizedBox(width: 4),
        Text(
          "Selected",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 16),
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: false,
        ),
        const SizedBox(width: 4),
        Text(
          "Available",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
