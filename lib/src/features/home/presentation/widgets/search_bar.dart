import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mau masak apa hari ini?',
            style: Styles.font.sm,
          ),
          const Icon(
            Icons.search,
          ),
        ],
      ),
    );
  }
}
