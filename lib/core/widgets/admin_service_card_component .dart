import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_location_component.dart';
import 'package:booking_app/features/admin%20features/providers/data/repos/providers_repo_impl.dart';
import 'package:booking_app/features/admin%20features/providers/presentation/manager/accept%20service/accept_service_cubit.dart';
import 'package:booking_app/features/user%20features/home/data/models/service_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminServiceCardComponent extends StatelessWidget {
  const AdminServiceCardComponent({super.key, required this.service});
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AcceptServiceCubit(ProvidersRepoImpl()),

      child: BlocListener<AcceptServiceCubit, AcceptServiceState>(
        listener: (context, state) {
          if (!context.mounted) {
            return;
          }

          if (state is AcceptServiceSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
              ),
            );
          }

          if (state is AcceptServiceFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        child: BlocBuilder<AcceptServiceCubit, AcceptServiceState>(
          builder: (context, state) {
            final bool isLoading =
                state is AcceptServiceLoading && state.serviceId == service.id;

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: service.images[0],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Container(color: Colors.grey.shade300),
                          errorWidget: (context, url, error) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade300,
                              border: Border.all(
                                color: Colors.black.withValues(alpha: 0.3),
                              ),
                            ),

                            child: const Icon(Icons.error, color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(service.name, style: Styles.textStyle20),
                            const SizedBox(height: 6),
                            Text(
                              service.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomLocationComponent(
                              location: service.location,
                              city: service.city,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      CardButton(
                        title: isLoading ? 'جاري...' : 'قبول',
                        color: const Color(0xff004E32),
                        bgColor: const Color(0xff006844).withAlpha(70),
                        onPressed: isLoading
                            ? null
                            : () {
                                context
                                    .read<AcceptServiceCubit>()
                                    .acceptService(serviceId: service.id);
                              },
                      ),
                      const SizedBox(width: 10),
                      CardButton(
                        title: 'رفض',
                        color: const Color(0xffBA1A1A),
                        bgColor: const Color(0xffFFDAD6),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color bgColor;
  final Color color;
  final String title;
  const CardButton({
    super.key,
    this.onPressed,
    required this.bgColor,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          child: Text(
            title,
            textDirection: TextDirection.rtl,
            style: Styles.textStyle14.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
