import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/days_dropdown_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvailableDaysSection extends StatelessWidget {
  const AvailableDaysSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        final cubit = context.read<BeProviderCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Text('من : '),
              DaysDropdownSection(
                items: cubit.days,
                onChanged: (day) => cubit.changeFromDay(day),
                value: cubit.fromDay,
              ),
              const Spacer(),
              const Text('الى : '),
              DaysDropdownSection(
                items: cubit.days,
                onChanged: (day) => cubit.changeToDay(day),
                value: cubit.toDay,
              ),
            ],
          ),
        );
      },
    );
  }
}
