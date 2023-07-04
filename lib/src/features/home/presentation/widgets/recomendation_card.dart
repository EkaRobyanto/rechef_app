import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';

class RecomendationCard extends StatelessWidget {
  const RecomendationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            width: 260,
            child: Image.network(
              fit: BoxFit.fitWidth,
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNxebVRZaEqJkZOUL8cYZYcjUbm2-jhYY7gr0Z8VUH&s',
            ),
          ),
          Container(
            height: 150,
            width: 260,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.1),
                ],
                stops: const [0.3, 0.6, 1],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ayam Goreng',
                  style: Styles.font.bold.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
                  style: Styles.font.xsm.copyWith(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
