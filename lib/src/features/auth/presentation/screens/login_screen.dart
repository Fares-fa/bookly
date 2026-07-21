import 'package:bookly/src/imports/core_imports.dart';
import 'package:bookly/src/imports/packages_imports.dart';

import 'package:bookly/src/features/auth/presentation/providers/auth_provider.dart';
import 'package:bookly/src/features/auth/presentation/widgets/otp_bottom_sheet.dart';
import 'package:bookly/src/shared/widgets/primary_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  String _countryCode = '+20';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    Future<void> handleLogin() async {
      if (!(_formKey.currentState?.validate() ?? false)) return;

      ref.read(authControllerProvider.notifier).login(
            context: context,
            phoneNumber: '$_countryCode${_phoneController.text}',
          );
    }

    Future<void> handleContinue() async {
      if (!(_formKey.currentState?.validate() ?? false)) return;

      final code = await showOtpBottomSheet(
        context,
        phoneNumber: '$_countryCode${_phoneController.text}',
      );

      if (code == null || !context.mounted) return;

      context.push(AppRoutes.completeInfo);
    }

    return _LoginView(
      formKey: _formKey,
      phoneController: _phoneController,
      isLoading: isLoading,
      onCountryChanged: (code) => _countryCode = code,
      onLogin: handleLogin,
      onContinue: handleContinue,
      cs: cs,
      tt: tt,
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({
    required this.formKey,
    required this.phoneController,
    required this.isLoading,
    required this.onCountryChanged,
    required this.onLogin,
    required this.onContinue,
    required this.cs,
    required this.tt,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final bool isLoading;
  final ValueChanged<String> onCountryChanged;
  final VoidCallback onLogin;
  final VoidCallback onContinue;
  final ColorScheme cs;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          // padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white,
                      Color(0xFF0042D3),
                      Color(0xFF0042D3)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Column(
                // spacing: AppSpacing.xxl.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF0042D3),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.r),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SafeArea(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: AppSpacing.lg.w),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Join As A Guest',
                                      style: tt.labelLarge?.copyWith(
                                        color: cs.onPrimary,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        SvgPicture.asset(
                          AppAssets.booklyLogo,
                          width: 120.w,
                          height: 35.w,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.md.w,
                      vertical: AppSpacing.lg.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32.r),
                      ),
                    ),
                    child: Column(
                      spacing: AppSpacing.md.h,
                      children: [
                        // Form Card
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter your phone number',
                              style: tt.bodyLarge?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: AppSpacing.sm.h),
                            Text(
                              'A OTP will be sent to your phone number for verification.',
                              style: tt.bodyMedium?.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        Form(
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
                                      flagDecoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      onChanged: (country) => onCountryChanged(
                                          country.dialCode ?? '+20'),
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
                                      decoration: InputDecoration(
                                        hintText: 'Mobile Number',
                                        hintStyle: TextStyle(fontSize: 14),
                                        fillColor: Colors.transparent,
                                        contentPadding: EdgeInsets.all(20),
                                      ),
                                      controller: phoneController,
                                      keyboardType: TextInputType.phone,
                                      validator: (v) => AppUtils.isPhoneNumber(
                                              v.toString())
                                          ? null
                                          : 'Please enter a valid phone number',
                                    ),
                                  )
                                  // Expanded(
                                  //   child: SizedBox(
                                  //     height: 50.h,
                                  //     child: TextFormField(
                                  //       controller: phoneController,
                                  //       keyboardType: TextInputType.phone,
                                  //       textAlignVertical:
                                  //           TextAlignVertical.center,
                                  //       style: tt.displayLarge?.copyWith(
                                  //         color: cs.onSurface,
                                  //       ),
                                  //       decoration: InputDecoration(
                                  //         isDense: true,
                                  //         labelStyle: TextStyle(),
                                  //         hintText: 'Phone number',
                                  //         fillColor: Colors.transparent,
                                  //         contentPadding: EdgeInsets.symmetric(
                                  //           horizontal: AppSpacing.sm.w,
                                  //         ),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius:
                                  //               BorderRadius.circular(12.r),
                                  //         ),
                                  //       ),
                                  //       validator: (v) =>
                                  //           (v == null || v.isEmpty)
                                  //               ? 'Phone number is required'
                                  //               : null,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSpacing.xxxl.h),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg.w,
            vertical: AppSpacing.md.h,
          ),
          child: PrimaryButton(
            label: 'Continue',
            isLoading: isLoading,
            onPressed: onContinue,
            isFullWidth: true,
          ),
        ),
      ),
    );
  }
}
