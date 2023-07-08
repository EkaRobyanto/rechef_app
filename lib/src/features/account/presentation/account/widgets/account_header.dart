import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../../../../shared/shrink_widget.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://picsum.photos/200',
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : Center(
                              child: CircularProgressIndicator(
                                color: Styles.color.accent,
                              ),
                            ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'JohnDower',
                  style: Styles.font.blg,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: '12',
                        style: Styles.font.bsm,
                      ),
                      TextSpan(
                        text: ' Mengikuti',
                        style: Styles.font.sm,
                      ),
                    ])),
                    const SizedBox(
                      width: 10,
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
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Saya Suka Memasak, Memasak adalah gaya hidup saya',
          style: Styles.font.sm,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ShrinkWidget(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Edit Profil',
                    style: Styles.font.bsm,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ShrinkWidget(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Bagikan Profil',
                    style: Styles.font.bsm,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
