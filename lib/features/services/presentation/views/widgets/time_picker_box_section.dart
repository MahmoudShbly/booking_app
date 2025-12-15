import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';

class TimePickerBoxSection extends StatelessWidget {
  const TimePickerBoxSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
       var cubit = context.read<BeProviderCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("دقيقة:"),
            const SizedBox(width: 10),
            NumberPicker(
              minValue: 0,
              maxValue: 59,
              value: cubit.minute,
              itemWidth: 60,
              itemHeight: 40,
              onChanged: (value) => cubit.changeMinute(value),
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(12),
                border: Border.all(),
              ),
            ),
            const SizedBox(width: 20),
            const Text("ساعة:"),
            const SizedBox(width: 10),
            NumberPicker(
              minValue: 0,
              maxValue: 12,
              value: cubit.hour,
              itemWidth: 60,
              itemHeight: 40,
              onChanged: (value) => cubit.changeHour(value),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(),
              ),
            ),
          ],
        );
      },
    );
  }
}
