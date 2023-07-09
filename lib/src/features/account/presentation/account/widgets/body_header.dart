import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';

class BodyHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Align(
      child: Stack(
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            color: Styles.color.primary,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Boxicons.bx_book_alt),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Resep Saya',
                  style: Styles.font.bsm,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
