import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/appointments/presentation/manager/rating%20cubit/rating_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentRatingSection extends StatelessWidget {
  const CommentRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingCubit, RatingState>(
              builder: (context, rating) {
                final rating = context.read<RatingCubit>().stars;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          onPressed: () {
                            context.read<RatingCubit>().changeRate(index + 1);
                          },
                          icon: Icon(
                            index < rating
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            color: Colors.amber,
                            size: 32,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 100,
                      child: CustomTextFormFieldComponent(
                        hint: 'اكتب تعليقك هنا ...',
                        isRequired: false,
                        fillColor: Colors.white,
                        controller: context.read<RatingCubit>().commentController,
                      ),
                    ),
                  ],
                );
              },
            );
  }
}
