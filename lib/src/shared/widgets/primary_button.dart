import '../../imports/imports.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.color,
    this.textColor,
    this.height = ButtonSize.medium,
    this.width,
    this.isLoading = false,
    this.isFullWidth = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final Color? color;
  final Color? textColor;
  final ButtonSize height;
  final double? width;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;

    return AppButton(
      label: label,
      onPressed: onPressed,
      variant: variant,
      color: cs.primary,
      textColor: textColor ?? cs.onPrimary,
      height: ButtonSize.small,
      width: width != null ? ButtonSize.large : null,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }
}
