import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsViewBodyShmmier extends StatelessWidget {
	const DetailsViewBodyShmmier({super.key});

	@override
	Widget build(BuildContext context) {
		final size = MediaQuery.of(context).size;

		return Shimmer.fromColors(
			baseColor: Colors.grey.shade300,
			highlightColor: Colors.grey.shade100,
			child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .4,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      separatorBuilder: (_, __) => const SizedBox(width: 5),
                      itemBuilder: (context, index) => Container(
                        width: size.width,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _skeletonBox(height: 26, width: size.width * .55),
                        const SizedBox(height: 14),
                        _skeletonBox(height: 18, width: size.width * .35),
                        const SizedBox(height: 20),
                        _skeletonBox(height: 14, width: size.width),
                        const SizedBox(height: 10),
                        _skeletonBox(height: 14, width: size.width * .9),
                        const SizedBox(height: 10),
                        _skeletonBox(height: 14, width: size.width * .75),
                        const SizedBox(height: 26),
                        _skeletonBox(height: 20, width: size.width * .3),
                        const SizedBox(height: 14),
                        ...List.generate(
                          4,
                          (_) => const Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: _ReviewSkeletonItem(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
		);
	}
}

class _ReviewSkeletonItem extends StatelessWidget {
	const _ReviewSkeletonItem();

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.all(12),
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(12),
			),
			child: Row(
				children: [
					const CircleAvatar(radius: 18, backgroundColor: Colors.white),
					const SizedBox(width: 10),
					Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								_skeletonBox(height: 12, width: 120),
								const SizedBox(height: 8),
								_skeletonBox(height: 10, width: 170),
							],
						),
					),
				],
			),
		);
	}
}

Widget _skeletonBox({required double height, required double width}) {
	return Container(
		height: height,
		width: width,
		decoration: BoxDecoration(
			color: Colors.white,
			borderRadius: BorderRadius.circular(10),
		),
	);
}
