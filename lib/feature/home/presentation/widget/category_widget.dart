import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  final category = const [
    "Horror",
    "Action",
    "Comedy",
    "Romance",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          category.length,
          (index) {
            return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                category[index],
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          },
        ),
      ),
    );
  }
}
