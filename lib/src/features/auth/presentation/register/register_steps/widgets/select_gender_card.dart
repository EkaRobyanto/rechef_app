import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/styles.dart';
import '../cubit/select_gender_cubit.dart';

class SelectGenderCard extends StatefulWidget {
  const SelectGenderCard({
    super.key,
    required this.image,
    required this.value,
  });
  final String image, value;

  @override
  State<SelectGenderCard> createState() => _SelectGenderCardState();
}

class _SelectGenderCardState extends State<SelectGenderCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenderCubit, String>(
      builder: (ctx, state) => GestureDetector(
        onTap: () {
          context.read<GenderCubit>().updateValue(widget.value);
        },
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border(
                  bottom: BorderSide(
                    color: state == widget.value
                        ? Styles.color.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                  top: BorderSide(
                    color: state == widget.value
                        ? Styles.color.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                  left: BorderSide(
                    width: 2,
                    color: state == widget.value
                        ? Styles.color.primary
                        : Colors.transparent,
                  ),
                  right: BorderSide(
                    width: 2,
                    color: state == widget.value
                        ? Styles.color.primary
                        : Colors.transparent,
                  ),
                ),
                boxShadow: state == widget.value
                    ? []
                    : [
                        const BoxShadow(
                          color: Color.fromARGB(58, 0, 0, 0),
                          blurRadius: 5,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        ),
                      ],
              ),
              child: Column(
                children: [
                  Image.asset(
                    widget.image,
                    scale: 4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.value,
                    style: Styles.font.bold,
                  )
                ],
              ),
            ),
            AnimatedScale(
              scale: state == widget.value ? 1 : 0,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Styles.color.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
