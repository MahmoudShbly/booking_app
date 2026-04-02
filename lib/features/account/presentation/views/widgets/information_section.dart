import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/account/presentation/manager/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is AccountLoaded) {
          return Column(
            children: <Widget>[
              Text(
                state.userData.name,
                style: Styles.textStyle40.copyWith(
                  color: kBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                state.userData.email,
                style: Styles.textStyle16.copyWith(color: Colors.grey),
              ),
            ],
          );
        } else if (state is AccountError) {
          return Text('Error: ${state.message}');
        } else {
           return const CircularProgressIndicator();
        }
      },
    );
  }
}
