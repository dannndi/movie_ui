import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_ui/core/theme/app_color.dart';
import 'package:movie_ui/core/utils/date_time_extension.dart';
import 'package:movie_ui/feature/movie_booking/presentation/widget/date_widget.dart';
import 'package:movie_ui/feature/movie_booking/presentation/widget/seat_widget.dart';
import 'package:movie_ui/feature/movie_booking/presentation/widget/time_widget.dart';

class MovieBookingScreen extends StatefulWidget {
  const MovieBookingScreen({super.key});

  @override
  State<MovieBookingScreen> createState() => _MovieBookingScreenState();
}

class _MovieBookingScreenState extends State<MovieBookingScreen> {
  final selectedSeat = ValueNotifier<List<String>>([]);
  final selectedDate = ValueNotifier<DateTime>(DateTime.now());
  final selectedTime = ValueNotifier<TimeOfDay?>(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Select Seat",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<List<String>>(
            valueListenable: selectedSeat,
            builder: (context, value, _) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: AppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      alignment: Alignment.center,
                      child: Text(
                        "Screen",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: AppColor.white),
                      ),
                    ),
                    const Expanded(child: SizedBox()),

                    /// lets make 8 seat horizontal
                    /// and 6 seat vertical
                    for (int i = 1; i <= 6; i++) ...[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int j = 1; j <= 8; j++) ...[
                            SeatWidget(
                              seatNumber: "${String.fromCharCode(i + 64)}$j",
                              width: (MediaQuery.of(context).size.width -
                                      48 -
                                      66) /
                                  8,
                              height: (MediaQuery.of(context).size.width -
                                      48 -
                                      66) /
                                  8,
                              isAvailable: i != 6,
                              isSelected: value.contains(
                                "${String.fromCharCode(i + 64)}$j",
                              ),
                              onTap: () {
                                if (value.contains(
                                  "${String.fromCharCode(i + 64)}$j",
                                )) {
                                  selectedSeat.value = List.from(value)
                                    ..remove(
                                      "${String.fromCharCode(i + 64)}$j",
                                    );
                                } else {
                                  selectedSeat.value = List.from(value)
                                    ..add(
                                      "${String.fromCharCode(i + 64)}$j",
                                    );
                                }
                              },
                            ),
                            // make gap, and in the center wider gap
                            if (i != 8) SizedBox(width: j == 4 ? 16 : 4)
                          ]
                        ],
                      ),
                      if (i != 6) const SizedBox(height: 6)
                    ],
                    const Expanded(child: SizedBox()),
                    const SeatInfoWidget(),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(48),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Date",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  ValueListenableBuilder<DateTime>(
                    valueListenable: selectedDate,
                    builder: (context, value, _) {
                      return SizedBox(
                        height: 96,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            14,
                            (index) {
                              final date = DateTime.now().add(
                                Duration(days: index),
                              );
                              return InkWell(
                                onTap: () {
                                  selectedDate.value = date;
                                },
                                child: DateWidget(
                                  date: date,
                                  isSelected:
                                      value.simpleDate == date.simpleDate,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  ValueListenableBuilder<TimeOfDay?>(
                    valueListenable: selectedTime,
                    builder: (context, value, _) {
                      return SizedBox(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            8,
                            (index) {
                              final time = TimeOfDay(
                                hour: 10 + (index * 2),
                                minute: 0,
                              );
                              return InkWell(
                                onTap: () {
                                  selectedTime.value = time;
                                },
                                child: TimeWidget(
                                  time: time,
                                  isSelected: value == time,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 16),
                            ValueListenableBuilder<List<String>>(
                              valueListenable: selectedSeat,
                              builder: (context, value, _) {
                                return Text(
                                  "\$${value.length * 10}",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Text(
                            "Book Now",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
