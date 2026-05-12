import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_location_component.dart';
import 'package:booking_app/features/user%20features/home/data/models/service_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AdminServiceCardComponent  extends StatelessWidget {
  const AdminServiceCardComponent ({super.key, required this.service});
  final ServiceModel service;
  @override
  Widget build(BuildContext context) {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
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
                  border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
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
                  style: TextStyle(fontSize: 14, color: Colors.black54),
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
    );
  }
}
