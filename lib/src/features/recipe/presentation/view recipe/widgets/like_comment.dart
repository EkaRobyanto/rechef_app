import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';

class LikeComment extends StatefulWidget {
  const LikeComment({
    super.key,
  });

  @override
  State<LikeComment> createState() => _LikeCommentState();
}

class _LikeCommentState extends State<LikeComment> {
  bool isLike = false;
  int likeCount = 123;

  setLike() {
    setState(() {
      isLike = !isLike;
      if (isLike) {
        likeCount++;
      } else {
        likeCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            InkWell(
              onTap: setLike,
              child: Icon(
                isLike ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                size: 30,
                color: isLike ? Styles.color.darkGreen : Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              likeCount.toString(),
              style: Styles.font.base,
            ),
          ],
        ),
        const SizedBox(
          width: 40,
        ),
        Column(
          children: [
            const Icon(
              Icons.chat_bubble_outline,
              size: 30,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '123',
              style: Styles.font.base,
            ),
          ],
        ),
      ],
    );
  }
}
