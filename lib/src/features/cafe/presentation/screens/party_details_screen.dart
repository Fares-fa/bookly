import 'package:bookly/src/imports/imports.dart';

import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/cafe/domain/cafe_spec.dart';
import 'package:bookly/src/features/cafe/presentation/providers/cafe_booking_flow_provider.dart';
import 'package:bookly/src/features/venue/presentation/widgets/venue_widgets.dart';

/// Step 2 of the cafe booking wizard: party size, seating option and an
/// optional note.
class CafePartyDetailsScreen extends ConsumerStatefulWidget {
  const CafePartyDetailsScreen({super.key});

  @override
  ConsumerState<CafePartyDetailsScreen> createState() =>
      _CafePartyDetailsScreenState();
}

class _CafePartyDetailsScreenState
    extends ConsumerState<CafePartyDetailsScreen> {
  late final TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController =
        TextEditingController(text: ref.read(cafeBookingFlowProvider).note);
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cafeBookingFlowProvider);
    final notifier = ref.read(cafeBookingFlowProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const BookingAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.ml),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).cafeHowManyPeopleTitle,
              style: AppTextStyle.blackW500Size16,
            ),
            SizedBox(height: AppSpacing.md),
            Row(
              children: [
                _Counter(
                  value: state.partySize,
                  onDecrement: notifier.decrement,
                  onIncrement: notifier.increment,
                ),
                const Spacer(),
                _PersonBadge(count: state.partySize),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            const AppDivider(),
            SizedBox(height: AppSpacing.md),
            Text(
              S.of(context).cafeSelectOptionTitle,
              style: AppTextStyle.blackW500Size16,
            ),
            SizedBox(height: AppSpacing.md),
            Row(
              children: [
                for (final option in cafeSpec.seatingOptions) ...[
                  Expanded(
                    child: _OptionPill(
                      label: option.label,
                      selected: state.option == option,
                      onTap: () => notifier.selectOption(option),
                    ),
                  ),
                  if (option != cafeSpec.seatingOptions.last)
                    SizedBox(width: AppSpacing.ms),
                ],
              ],
            ),
            SizedBox(height: AppSpacing.md),
            const AppDivider(),
            SizedBox(height: AppSpacing.md),
            Text(
              S.of(context).cafeAddNoteTitle,
              style: AppTextStyle.blackW500Size16,
            ),
            SizedBox(height: AppSpacing.md),
            _NoteField(
              controller: _noteController,
              onChanged: notifier.setNote,
            ),
            SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
      bottomNavigationBar: BookingBottomBar(
        stepIndex: 1,
        label: S.of(context).cafeContinueButton,
        menuRoute: AppRoutes.cafeMenu,
        menuIcon: Icons.local_cafe_outlined,
        enabled: state.hasPartyDetails,
        onContinue: () => context.push(AppRoutes.cafeBookingSummary),
      ),
    );
  }
}

/// Minus / value / plus stepper pill.
class _Counter extends StatelessWidget {
  const _Counter({
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
  });

  final int value;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.xs),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorders.md,
        boxShadow: AppShadows.subtle,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepButton(icon: Icons.remove, onTap: onDecrement),
          Container(
            width: 44.w,
            alignment: Alignment.center,
            child: Text('$value', style: AppTextStyle.blackW400Size16),
          ),
          _StepButton(icon: Icons.add, onTap: onIncrement),
        ],
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22.w,
        height: 22.w,
        decoration: const BoxDecoration(
          color: AppColors.semiGrey,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: AppColors.textDark),
      ),
    );
  }
}

/// Soft blue circle showing the selected party size, with small cup icons.
class _PersonBadge extends StatelessWidget {
  const _PersonBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final active = count > 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.emoji_food_beverage_outlined,
          size: 20,
          color: active ? AppColors.primary : Colors.transparent,
        ),
        SizedBox(height: AppSpacing.xs),
        Container(
          width: 116.w,
          height: 116.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: active ? 0.28 : 0.18),
            shape: BoxShape.circle,
          ),
          child: Text(
            S.of(context).cafePersonCount(count.toString()),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(height: AppSpacing.xs),
        Icon(
          Icons.local_cafe_outlined,
          size: 20,
          color: active ? AppColors.primary : Colors.transparent,
        ),
      ],
    );
  }
}

class _OptionPill extends StatelessWidget {
  const _OptionPill({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.white,
          borderRadius: AppBorders.md,
          boxShadow: selected ? null : AppShadows.subtle,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: selected ? AppColors.white : AppColors.textDark,
          ),
        ),
      ),
    );
  }
}

class _NoteField extends StatelessWidget {
  const _NoteField({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      maxLines: 4,
      minLines: 4,
      style: AppTextStyle.blackW400Size14,
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        fillColor: AppColors.white,
        border: InputBorder.none,
        hintText: S.of(context).cafeNoteHint,
        hintStyle: TextStyle(
          fontSize: 12.sp,
          color: AppColors.grey,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
