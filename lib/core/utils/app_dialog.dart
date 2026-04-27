import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required Widget title,
  required String message,
  Widget? content,
  String confirmText = 'موافق',
  String? cancelText,
  Color confirmColor = kBlue,
  Color cancelColor = kBlue,
  BoxBorder? confirmBorder,
  BoxBorder? cancelBorder,
  required Function onConfirm,
}) {
  return showDialog<T>(
    context: context,

    barrierDismissible: false,
    builder: (dialogContext) {
      bool localLoading = false; 

      return StatefulBuilder( 
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    title,
                    const SizedBox(height: 12),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Styles.textStyle18,
                    ),
                    if (content != null) ...[
                      const SizedBox(height: 12),
                      content,
                    ],
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (cancelText != null)
                          CustomButtonComponent(
                            titleStyle: Styles.textStyle20
                                .copyWith(color: Colors.white),
                            title: cancelText,
                            onTap: () => GoRouter.of(dialogContext).pop(),
                            width: MediaQuery.of(context).size.width * 0.25,
                            borderRadius: 10,
                            color: cancelColor,
                            border: cancelBorder,
                          ),
                        if (cancelText != null) const SizedBox(width: 10),
                        CustomButtonComponent(
                          isLoading: localLoading, 
                          titleStyle: Styles.textStyle20
                              .copyWith(color: Colors.white),
                          title: confirmText,
                          onTap: () async{
                            setState(() => localLoading = true);
                           await onConfirm();
                          },
                          width: MediaQuery.of(context).size.width * 0.25,
                          borderRadius: 10,
                          color: confirmColor,
                          border: confirmBorder,
                        ),
                      ],
                    ),
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