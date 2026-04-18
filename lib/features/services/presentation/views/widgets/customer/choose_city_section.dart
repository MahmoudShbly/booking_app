import 'package:booking_app/features/services/presentation/manager/customer/be%20provider/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/customer/days_dropdown_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseCitySection extends StatelessWidget {
  const ChooseCitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        var cubit = context.read<BeProviderCubit>();
        return Row(
          children: <Widget>[
            const Text('اختر المدينة:'),
            const SizedBox(width: 10),
            DropdownMenueComponent(
              items:cubit.cities ,
              onChanged:(city)=> cubit.changeCity(city),
              value: cubit.city,
            ),
          ],
        );
      },
    );
  }
}
