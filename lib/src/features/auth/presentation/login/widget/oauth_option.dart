import 'package:flutter/material.dart';

import '../../../../../constants/image_path.dart';
import '../../../../../constants/styles.dart';
import '../../register/widgets/oauth_button.dart';

class OAuthOptions extends StatelessWidget {
  const OAuthOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text('Atau', style: Styles.font.bold)),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OAuthButton(
              asset: googleAuth,
            ),
            const SizedBox(
              width: 30,
            ),
            OAuthButton(
              asset: facebookAuth,
            ),
          ],
        ),
      ],
    );
  }
}
