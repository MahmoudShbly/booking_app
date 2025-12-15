import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/upload_image_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UploadMainImage extends StatelessWidget {
  const UploadMainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        BeProviderCubit cubit = context.read<BeProviderCubit>();
        return Column(
          children: <Widget>[
            Text(
              'اختر صورة رئيسية للخدمة :',
              style: Styles.textStyle26.copyWith(color: kBlue),
            ),
            SizedBox(height: 24),
            UploadImageBox(
              onTap: (){   ImagePicker()
                  .pickImage(source: ImageSource.gallery)
                  .then((onValue) => cubit.setMainImage(onValue!));}
            ),
          ],
        );
      },
    );
  }
}
