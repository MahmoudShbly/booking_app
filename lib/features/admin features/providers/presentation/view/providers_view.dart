import 'package:booking_app/features/admin%20features/providers/data/repos/providers_repo_impl.dart';
import 'package:booking_app/features/admin%20features/providers/presentation/manager/fetch%20not%20accepted%20services/fetch_not_accepted_services_cubit.dart';
import 'package:booking_app/features/admin%20features/providers/presentation/view/widgets/providers_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvidersView extends StatelessWidget {
  const ProvidersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            FetchNotAcceptedServicesCubit(ProvidersRepoImpl())
              ..fetchNotAcceptedServices(),
        child: const ProvidersViewBody(),
      ),
    );
  }
}

