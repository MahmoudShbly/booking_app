import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/user%20features/account/data/repos/account_repo_impl.dart';
import 'package:booking_app/features/user%20features/account/presentation/manager/request_points/request_points_cubit.dart';
import 'package:booking_app/features/user%20features/account/presentation/views/widgets/request_points_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PointRequestButton extends StatelessWidget {
  const PointRequestButton({super.key});

  void _showPointRequestBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return BlocProvider(
          create: (_) => RequestPointsCubit(AccountRepoImpl()),
          child: RequestPointsBottomSheet(parentContext: context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => _showPointRequestBottomSheet(context),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color:  Colors.white,
          ),
          child: Center(
            child: Text(
              'طلب نقاط',
              style: Styles.textStyle12,
            ),
          ),
        ),
      ),
    );
  }
}
