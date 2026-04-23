import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:flutter/material.dart';

Future<T?> showAppBottomSheet<T>({
	required BuildContext context,
	required Widget title,
	Widget? content,
	String confirmText = 'موافق',
	String? cancelText,
	Color confirmColor = kBlue,
	Color cancelColor = kBlue,
	BoxBorder? confirmBorder,
	BoxBorder? cancelBorder,
	double? confirmWidth,
	double? cancelWidth,
	required VoidCallback onConfirm,
	VoidCallback? onCancel,
	bool isScrollControlled = true,
}) {
	return showModalBottomSheet<T>(
		context: context,
		isScrollControlled: isScrollControlled,
		backgroundColor: Colors.transparent,
		builder: (sheetContext) {
			bool localLoading = false;

			return StatefulBuilder(
				builder: (context, setState) {
					final screenWidth = MediaQuery.of(context).size.width;
					final resolvedConfirmWidth =
							confirmWidth ?? (cancelText == null ? double.infinity : screenWidth * 0.25);
					final resolvedCancelWidth = cancelWidth ?? screenWidth * 0.25;

					final actions = cancelText != null
							? Row(
									children: [
										Expanded(
											child: CustomButtonComponent(
												titleStyle: Styles.textStyle16.copyWith(color: Colors.white),
												title: cancelText,
												onTap: () {
													Navigator.of(sheetContext).pop();
													onCancel?.call();
												},
												width: resolvedCancelWidth,
												borderRadius: 10,
												color: cancelColor,
												border: cancelBorder,
											),
										),
										const SizedBox(width: 10),
										Expanded(
											child: CustomButtonComponent(
												isLoading: localLoading,
												titleStyle: Styles.textStyle16.copyWith(color: Colors.white),
												title: confirmText,
												onTap: () {
													setState(() => localLoading = true);
													
													onConfirm();
												},
												width: resolvedConfirmWidth,
												borderRadius: 10,
												color: confirmColor,
												border: confirmBorder,
											),
										),
									],
							)
							: SizedBox(
									width: double.infinity,
									child: CustomButtonComponent(
										isLoading: localLoading,
										titleStyle: Styles.textStyle20.copyWith(color: Colors.white),
										title: confirmText,
										onTap: () {
											setState(() => localLoading = true);
											onConfirm();
										},
										width: confirmWidth ?? double.infinity,
										borderRadius: 10,
										color: confirmColor,
										border: confirmBorder,
									),
							);

					return SafeArea(
						top: false,
						child: Container(
							decoration: const BoxDecoration(
								color: Colors.white,
								borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
							),
							padding: EdgeInsets.only(
								left: 20,
								right: 20,
								top: 12,
								bottom: MediaQuery.of(context).viewInsets.bottom + 20,
							),
							child: SingleChildScrollView(
								child: Column(
									mainAxisSize: MainAxisSize.min,
									children: [
										Container(
											width: 44,
											height: 5,
											decoration: BoxDecoration(
												color: Colors.grey.shade300,
												borderRadius: BorderRadius.circular(100),
											),
										),
										const SizedBox(height: 16),
										title,
										if (content != null) ...[
											const SizedBox(height: 12),
											content,
										],
										const SizedBox(height: 20),
										actions,
									],
								),
							),
						),
					);
				},
			);
		},
	);
}
