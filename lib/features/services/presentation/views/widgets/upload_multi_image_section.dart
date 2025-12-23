import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/upload_multi_image_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImageSection extends StatelessWidget {
  const UploadMultiImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        final cubit = context.read<BeProviderCubit>();

        return Column(
          children: <Widget>[
            Text(
              ' اختر صور اضافية 3 صور على الاكثر :',
              style: Styles.textStyle26.copyWith(color: kBlue),
            ),
            SizedBox(height: 24),
            UploadMultiImageBox(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                final List<XFile> images = await picker.pickMultiImage(limit: 3);
                if (images.isNotEmpty) {
                  cubit.setImages(images);
                }
              },
              images: cubit.images,

            ),
          ],
        );
      },
    );
  }
}
