import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ServiceProviderShimmer extends StatelessWidget {
	const ServiceProviderShimmer({super.key});

	@override
	Widget build(BuildContext context) {
		return Shimmer.fromColors(
			baseColor: Colors.grey.shade300,
			highlightColor: Colors.grey.shade100,
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: <Widget>[
					Row(
						children: <Widget>[
							_circleBox(size: 36),
							const SizedBox(width: 12),
							Expanded(child: _box(height: 16, width: double.infinity)),
							const SizedBox(width: 12),
							_circleBox(size: 30),
						],
					),
					const SizedBox(height: 16),
					_profitsSkeleton(),
					const SizedBox(height: 20),
					_bookingsSkeleton(),
					const SizedBox(height: 20),
					_reviewsSkeleton(),
					const SizedBox(height: 26),
				],
			),
		);
	}

	Widget _profitsSkeleton() {
		return Container(
			padding: const EdgeInsets.all(20),
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(32),
			),
			child: Column(
				children: <Widget>[
					Row(
						children: <Widget>[
							Expanded(
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										_box(height: 14, width: 100),
										const SizedBox(height: 8),
										_box(height: 28, width: 150),
									],
								),
							),
						],
					),
					const SizedBox(height: 18),
					_box(height: 48, width: double.infinity, radius: 18),
				],
			),
		);
	}

	Widget _bookingsSkeleton() {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: <Widget>[
				Row(
					children: <Widget>[
						_box(height: 20, width: 130),
						const Spacer(),
						_box(height: 14, width: 70),
					],
				),
				const SizedBox(height: 14),
				Row(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						_chipSkeleton(width: 70),
						const SizedBox(width: 8),
						_chipSkeleton(width: 84),
						const SizedBox(width: 8),
						_chipSkeleton(width: 74),
					],
				),
				const SizedBox(height: 14),
				_bookingItemSkeleton(),
				const SizedBox(height: 12),
				_bookingItemSkeleton(),
			],
		);
	}

	Widget _reviewsSkeleton() {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				_box(height: 20, width: 120),
				const SizedBox(height: 10),
				Container(
					padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 35),
					decoration: BoxDecoration(
						color: Colors.white,
						borderRadius: BorderRadius.circular(32),
						border: Border.all(color: Colors.grey.shade300),
					),
					child: Column(
						children: <Widget>[
							Row(
								children: <Widget>[
									_box(height: 40, width: 58, radius: 16),
									const SizedBox(width: 12),
									Expanded(
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												_box(height: 14, width: 140),
												const SizedBox(height: 8),
												_box(height: 12, width: 110),
											],
										),
									),
									const SizedBox(width: 8),
									_box(height: 32, width: 76, radius: 16),
								],
							),
							const SizedBox(height: 12),
							_box(height: 18, width: double.infinity, radius: 12),
							const SizedBox(height: 8),
							_box(height: 18, width: 180, radius: 12),
						],
					),
				),
			],
		);
	}

	Widget _bookingItemSkeleton() {
		return Container(
			padding: const EdgeInsets.all(12),
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(20),
			),
			child: Row(
				children: <Widget>[
					_circleBox(size: 44),
					const SizedBox(width: 12),
					Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								_box(height: 14, width: 120),
								const SizedBox(height: 8),
								_box(height: 12, width: double.infinity),
								const SizedBox(height: 6),
								_box(height: 12, width: 140),
							],
						),
					),
				],
			),
		);
	}

	Widget _chipSkeleton({required double width}) {
		return Container(
			width: width,
			height: 32,
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(20),
			),
		);
	}

	Widget _circleBox({required double size}) {
		return Container(
			width: size,
			height: size,
			decoration: const BoxDecoration(
				color: Colors.white,
				shape: BoxShape.circle,
			),
		);
	}

	Widget _box({
		required double height,
		required double width,
		double radius = 10,
	}) {
		return Container(
			height: height,
			width: width,
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(radius),
			),
		);
	}
}
