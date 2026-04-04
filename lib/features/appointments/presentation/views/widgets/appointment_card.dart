import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/enums.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/appointments/data/models/booking_model.dart';
import 'package:booking_app/features/appointments/presentation/views/widgets/text_button_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, this.isDone = false, required this.booking});
  final bool isDone;
  final BookingModel booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 6,
                color: isDone ? kBlue : const Color(0xFF1A3D5D),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildClinicInfo(),
                          _buildStatusBadge(),
                    
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildDetailRow(
                        Icons.calendar_month_outlined,
                        'الأربعاء، 2025/10/11 - 10:00م',
                      ),
                      const SizedBox(height: 12),
                      _buildDetailRow(
                        Icons.location_on_outlined,
                        '${booking.service.city} - ${booking.service.location}',
                      ),
                      const SizedBox(height: 16),
                      _buildPaymentInfoSection(),
                      const SizedBox(height: 16),
                      TextButtonSection(
                        isDone: booking.status == BookingStatus.completed.name,
                        booking: booking,
                      ),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    final bool completed = booking.status == BookingStatus.completed.name;
    final bool active = booking.status == BookingStatus.confirmed.name;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: completed ? Colors.red.withValues(alpha: 0.12) :active?Colors.green.withValues(alpha: 0.12) : kLightBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        completed ? 'مكتمل' : active ? ' فعال' : 'قيد الانتظار',
        style: Styles.textStyle10.copyWith(
          color: completed ?Colors.red:active ? Colors.green.shade700 : kBlue,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildClinicInfo() {
    final String? imageUrl =
        booking.service.images.isNotEmpty ? booking.service.images.first : null;

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: imageUrl == null
                ? Container(
                    width: 48,
                    height: 48,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported_outlined),
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey.shade300),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                booking.service.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A3D5D),
                ),
              ),
              Text(
                ' ', //TODO : ADD CATEGORY NAME
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: Styles.textStyle12.copyWith(
                  color: const Color(0xFF1A3D5D).withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF1A3D5D)),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: Styles.textStyle12.copyWith(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentInfoSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F8FC),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
        
          const SizedBox(width: 10),
          Text.rich(
            TextSpan(
              text: 'المبلغ المدفوع\n ',
              style: Styles.textStyle10.copyWith(fontWeight: FontWeight.w700),
              children: [
                TextSpan(
                  text: '10,000  ',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: 'ل.س',
                  style: Styles.textStyle10
                ),
              ],
            ),
          ),
          Spacer(),
          Text.rich(
            TextSpan(
              text: 'المبلغ المتبقي\n ',
              style: Styles.textStyle10.copyWith(fontWeight: FontWeight.w700),
              children: [
                TextSpan(
                  text: '10,000  ',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                  text: 'ل.س',
                  style: Styles.textStyle10
                ),
              ],
            ),
          ),
       
        
        ],
      ),
    );
  }
}
