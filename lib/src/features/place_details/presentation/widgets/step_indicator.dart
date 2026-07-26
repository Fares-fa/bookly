import 'package:flutter/material.dart';

import 'package:bookly/src/theme/app_colors.dart';

/// Row of pill segments indicating progress through a multi-step flow
/// (e.g. the hotel booking process), with completed/current steps filled
/// in the primary color and remaining steps shown faded.
class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 3,
  });

  /// 1-based index of the current step.
  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        children: List.generate(totalSteps, (index) {
          final isActive = index < currentStep;
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: index == totalSteps - 1 ? 0 : 6),
              height: 6,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          );
        }),
      ),
    );
  }
}
