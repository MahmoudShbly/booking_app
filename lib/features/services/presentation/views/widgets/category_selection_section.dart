import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelectionSection extends StatelessWidget {
  const CategorySelectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        final cubit = context.read<BeProviderCubit>();
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: GridView.builder(
            padding: const EdgeInsets.all(40),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 3,
            ),
            itemCount: cubit.categories.length,
            itemBuilder: (context, index) {
              final bool isSelected = index == cubit.selectedIndex;

              return GestureDetector(
                onTap: () => cubit.selectCategory(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        offset: Offset(2, 4),
                        spreadRadius: 1,
                        blurRadius: 2,
                      ),
                    ],
                    color: isSelected ? Colors.deepOrange : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.deepOrange),
                  ),
                  child: Center(
                    child: Text(
                      cubit.categories[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
