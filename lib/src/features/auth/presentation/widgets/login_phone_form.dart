import 'package:bookly/src/imports/core_imports.dart';
import 'package:bookly/src/imports/packages_imports.dart';

class LoginPhoneForm extends StatelessWidget {
  const LoginPhoneForm({
    super.key,
    required this.formKey,
    required this.phoneController,
    required this.onCountryChanged,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final ValueChanged<String> onCountryChanged;

  @override
  Widget build(BuildContext context) {
    final tt = context.theme.textTheme;
    final cs = context.theme.colorScheme;

    return Form(
      key: formKey,
      child: Column(
        spacing: AppSpacing.lg.h,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 47.h,
                width: 90.w,
                decoration: BoxDecoration(
                  border: Border.all(color: cs.outline),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: CountryCodePicker(
                  flagWidth: 24.w,
                  flagDecoration: BoxDecoration(shape: BoxShape.circle),
                  onChanged: (country) =>
                      onCountryChanged(country.dialCode ?? '+20'),
                  initialSelection: 'EG',
                  showFlag: true,
                  showDropDownButton: false,
                  padding: EdgeInsets.zero,
                  textStyle: tt.bodyLarge?.copyWith(
                    color: cs.onSurface,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(width: AppSpacing.sm.w),
              Expanded(
                child: TextFormField(
                  style: tt.bodyLarge,
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    hintStyle: TextStyle(fontSize: 14),
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.all(20),
                  ),
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  validator: (v) => AppUtils.isPhoneNumber(v.toString())
                      ? null
                      : 'Please enter a valid phone number',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
