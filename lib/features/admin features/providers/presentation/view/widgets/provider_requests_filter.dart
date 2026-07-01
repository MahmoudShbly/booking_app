import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProviderRequestsFilter extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const ProviderRequestsFilter({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ProviderRequestFilterButton(
            title: 'طلبات جديدة',
            isSelected: selectedIndex == 0,
            onTap: () => onChanged(0),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _ProviderRequestFilterButton(
            title: 'طلبات مرفوضة',
            isSelected: selectedIndex == 1,
            onTap: () => onChanged(1),
          ),
        ),
      ],
    );
  }
}

class _ProviderRequestFilterButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _ProviderRequestFilterButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? const Color(0xFF003D9B) : const Color(0xFFEDEEF0),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 40,
          child: Center(
            child: Text(
              title,
              style: Styles.textStyle14.copyWith(
                color: isSelected ? Colors.white : const Color(0xFF434654),
                fontWeight: FontWeight.w600,
                height: 20 / 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
