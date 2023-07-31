import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../../../../shared/circle_net_pic.dart';
import '../../../../../shared/follow_button.dart';
import '../view_recipe.dart';

class RecipeCreatorCard extends StatelessWidget {
  const RecipeCreatorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: const Color(0xFfE0E0E0),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleNetPic(),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Anjing',
                    style: Styles.font.bsm,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '12',
                              style: Styles.font.bsm,
                            ),
                            TextSpan(
                              text: ' Mengikuti',
                              style: Styles.font.sm,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '12',
                              style: Styles.font.bsm,
                            ),
                            TextSpan(
                              text: ' Pengikut',
                              style: Styles.font.sm,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(
              width: 100,
              height: 35,
            ),
            child: const FollowButton(),
          ),
        ],
      ),
    );
  }
}
