import '../../imports/imports.dart';

/// A fully themed button supporting all [ButtonVariant]s and [ButtonSize]s.
///
/// Usage:
/// ```dart
/// AppButton(
///   label: 'Save',
///   onPressed: _save,
///   variant: ButtonVariant.primary,
///   size: ButtonSize.large,
///   isLoading: state.isLoading,
/// )
/// ```
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.color,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.height = ButtonSize.medium,
    this.width,
    this.isLoading = false,
    this.isFullWidth = false,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius,
    this.customWidth,
    this.customHeight,
    this.contentPadding,
    this.labelFontWeight = FontWeight.w500,
    this.labelStyle,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final Color? color;
  final Color? textColor;

  /// Overrides the border color. Applies to [ButtonVariant.outline]'s
  /// default border, and adds a border to variants that don't normally
  /// have one.
  final Color? borderColor;

  /// Overrides the border width. Defaults to 1.5 when [borderColor] is set
  /// without an explicit width.
  final double? borderWidth;
  final ButtonSize height;
  final ButtonSize? width;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;

  /// Overrides the [height]-derived pixel height with an exact value
  /// (e.g. to match a design spec that doesn't fit the [ButtonSize] tiers).
  final double? customHeight;

  /// Overrides the [width]-derived pixel width with an exact value.
  final double? customWidth;

  /// Overrides the [height]-derived horizontal padding.
  final EdgeInsetsGeometry? contentPadding;

  /// The font weight of [label]. Defaults to [FontWeight.w500].
  final FontWeight labelFontWeight;

  /// Extra style merged over the computed default (size/weight/color) —
  /// only the fields you set here override it, everything else keeps
  /// falling back to [height]/[labelFontWeight]/[textColor].
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final appColors = context.theme.extension<AppColorsExtension>()!;
    final isDisabled = onPressed == null || isLoading;

    final double buttonHeight = customHeight ?? switch (height) {
      ButtonSize.small => 36.h,
      ButtonSize.medium => 48.h,
      ButtonSize.large => 56.h,
    };

    final double? buttonWidth = customWidth ?? switch (width) {
      ButtonSize.small => 100.w,
      ButtonSize.medium => 150.w,
      ButtonSize.large => 200.w,
      null => null,
    };

    final double horizontalPadding = switch (height) {
      ButtonSize.small => 12.w,
      ButtonSize.medium => 20.w,
      ButtonSize.large => 28.w,
    };

    final double fontSize = switch (height) {
      ButtonSize.small => 12.sp,
      ButtonSize.medium => 14.sp,
      ButtonSize.large => 16.sp,
    };

    final (bg, fg, defaultBorder) = switch (variant) {
      ButtonVariant.primary => (
          color ?? cs.primary,
          color ?? cs.onPrimary,
          null
        ),
      ButtonVariant.secondary => (
          color ?? cs.secondaryContainer,
          cs.onSecondaryContainer,
          null
        ),
      ButtonVariant.outline => (
          color ?? Colors.transparent,
          cs.primary,
          BorderSide(color: cs.outline, width: 1.5)
        ),
      ButtonVariant.ghost => (color ?? Colors.transparent, cs.primary, null),
      ButtonVariant.danger => (color ?? cs.error, cs.onError, null),
      ButtonVariant.success => (color ?? appColors.success, appColors.onSuccess, null),
    };

    final border = borderColor != null
        ? BorderSide(
            color: borderColor!,
            width: borderWidth ?? defaultBorder?.width ?? 1.5,
          )
        : defaultBorder;

    final child = AnimatedSwitcher(
      duration: AppDurations.fast,
      switchInCurve: AppCurves.decelerate,
      child: isLoading
          ? SizedBox(
              key: const ValueKey('loader'),
              width: 20.w,
              height: 20.h,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: fg,
              ),
            )
          : Row(
              key: const ValueKey('content'),
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  SizedBox(width: 8.w),
                ],
                Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: labelFontWeight,
                    color: isDisabled
                        ? fg.withValues(alpha: 0.5)
                        : textColor ?? fg,
                  ).merge(labelStyle),
                ),
                if (suffixIcon != null) ...[
                  SizedBox(width: 8.w),
                  suffixIcon!,
                ],
              ],
            ),
    );

    return AnimatedOpacity(
      duration: AppDurations.fast,
      opacity: isDisabled ? 0.6 : 1.0,
      child: SizedBox(
        width: isFullWidth ? double.infinity : buttonWidth,
        height: buttonHeight,
        child: TextButton(
          onPressed: isDisabled ? null : onPressed,
          style: TextButton.styleFrom(
            backgroundColor: bg,
            foregroundColor: fg,
            padding: contentPadding ?? EdgeInsets.symmetric(horizontal: horizontalPadding),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? (border != null ? BorderRadius.circular(8) : BorderRadius.circular(50)),
              side: border ?? BorderSide.none,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
