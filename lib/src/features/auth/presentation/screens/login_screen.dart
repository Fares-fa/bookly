import 'package:bookly/src/imports/core_imports.dart';
import 'package:bookly/src/imports/packages_imports.dart';

import 'package:bookly/src/features/auth/presentation/providers/auth_provider.dart';
import 'package:bookly/src/features/auth/presentation/widgets/login_header.dart';
import 'package:bookly/src/features/auth/presentation/widgets/login_phone_form.dart';
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

  Future<void> _handleContinue() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final code = await showOtpBottomSheet(
      context,
      phoneNumber: '$_countryCode${_phoneController.text}',
    );

    if (code == null || !mounted) return;

    context.push(AppRoutes.completeInfo);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return _LoginView(
      formKey: _formKey,
      phoneController: _phoneController,
      isLoading: isLoading,
      onCountryChanged: (code) => _countryCode = code,
      onContinue: _handleContinue,
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({
    required this.formKey,
    required this.phoneController,
    required this.isLoading,
    required this.onCountryChanged,
    required this.onContinue,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final bool isLoading;
  final ValueChanged<String> onCountryChanged;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginHeader(onJoinAsGuest: () {}),
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
                        LoginPhoneForm(
                          formKey: formKey,
                          phoneController: phoneController,
                          onCountryChanged: onCountryChanged,
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
