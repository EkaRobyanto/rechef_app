import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/features/auth/presentation/register/bloc/register_state.dart';

import '../../../../../../constants/styles.dart';
import '../../bloc/register_bloc.dart';
import '../../bloc/register_event.dart';

class InterestBubble extends StatelessWidget {
  const InterestBubble({
    super.key,
    required this.value,
    required this.image,
    required this.size,
  });

  final String value, image;
  final int size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<RegisterBloc>().data.interest.contains(value)
                ? context.read<RegisterBloc>().add(RemoveInterest(value))
                : context.read<RegisterBloc>().add(AddInterest(value));
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: size.toDouble(),
                width: size.toDouble(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  border: context
                          .watch<RegisterBloc>()
                          .data
                          .interest
                          .contains(value)
                      ? Border(
                          bottom: BorderSide(
                            color: Styles.color.primary,
                            width: 2,
                          ),
                          top: BorderSide(
                            color: Styles.color.primary,
                            width: 2,
                          ),
                          left: BorderSide(
                            color: Styles.color.primary,
                            width: 2,
                          ),
                          right: BorderSide(
                            color: Styles.color.primary,
                            width: 2,
                          ),
                        )
                      : null,
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x66000000),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      scale: 3,
                    ),
                    Text(
                      value,
                      style: Styles.font.sm,
                    )
                  ],
                ),
              ),
              AnimatedScale(
                scale:
                    context.watch<RegisterBloc>().data.interest.contains(value)
                        ? 1
                        : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.check_circle,
                  color: Styles.color.primary,
                  size: 30,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
