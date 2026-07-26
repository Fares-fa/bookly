import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/imports/core_imports.dart';
import 'package:bookly/src/imports/packages_imports.dart';

import 'package:bookly/src/features/auth/presentation/providers/auth_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    Future<void> handleSignup() async {
      if (!(_formKey.currentState?.validate() ?? false)) return;
      

      ref.read(authControllerProvider.notifier).signUp(
        context: context, 
        name: _nameController.text,
        email: _emailController.text, 
        password: _passwordController.text,
      );
    }

    return _SignupView(
      formKey: _formKey,
      nameController: _nameController,
      emailController: _emailController,
      passwordController: _passwordController,
      confirmPasswordController: _confirmPasswordController,
      obscurePassword: _obscurePassword,
      obscureConfirmPassword: _obscureConfirmPassword,
      isLoading: isLoading,
      onToggleObscure: () => setState(() => _obscurePassword = !_obscurePassword),
      onToggleConfirmObscure: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
      onSignup: handleSignup,
      cs: cs,
      tt: tt,
    );
  }
}

class _SignupView extends StatelessWidget {
  const _SignupView({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscurePassword,
    required this.obscureConfirmPassword,
    required this.isLoading,
    required this.onToggleObscure,
    required this.onToggleConfirmObscure,
    required this.onSignup,
    required this.cs,
    required this.tt,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final bool isLoading;
  final VoidCallback onToggleObscure;
  final VoidCallback onToggleConfirmObscure;
  final VoidCallback onSignup;
  final ColorScheme cs;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: AppSpacing.xl.h),
                Text(
                  S.of(context).authCreateAccountTitle,
                  style: tt.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: AppSpacing.sm.h),
                Text(
                  S.of(context).authCreateAccountSubtitle,
                  textAlign: TextAlign.center,
                  style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
                SizedBox(height: AppSpacing.xxxl.h),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: nameController,
                        enabled: !isLoading,
                        label: S.of(context).authFullNameLabel,
                        prefixIcon: const Icon(Icons.person_outline),
                        validator: (v) {
                          if (AppUtils.isBlank(v)) {
                            return S.of(context).authNameRequired;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSpacing.md.h),
                      AppTextField(
                        controller: emailController,
                        enabled: !isLoading,
                        label: S.of(context).authEmailLabel,
                        prefixIcon: const Icon(Icons.email_outlined),
                        validator: (v) {
                          if (AppUtils.isBlank(v)) {
                            return S.of(context).authEmailRequired;
                          }
                          if (!AppUtils.isValidEmail(v!)) {
                            return S.of(context).authEmailInvalid;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSpacing.md.h),
                      AppTextField(
                        controller: passwordController,
                        enabled: !isLoading,
                        label: S.of(context).authPasswordLabel,
                        obscureText: obscurePassword,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(obscurePassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: onToggleObscure,
                        ),
                         validator: (v) {
                          if (AppUtils.isBlank(v)) {
                            return S.of(context).authPasswordRequired;
                          }
                          if (v!.length < 6) {
                            return S.of(context).authPasswordTooShort;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSpacing.md.h),
                      AppTextField(
                        controller: confirmPasswordController,
                        enabled: !isLoading,
                        label: S.of(context).authConfirmPasswordLabel,
                        obscureText: obscureConfirmPassword,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: onToggleConfirmObscure,
                        ),
                         validator: (v) {
                          if (AppUtils.isBlank(v)) {
                            return S.of(context).authConfirmPasswordRequired;
                          }
                          if (v != passwordController.text) {
                            return S.of(context).authPasswordsMismatch;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSpacing.lg.h),
                      AppButton(
                        label: S.of(context).authSignUpButton,
                        isLoading: isLoading,
                        onPressed: isLoading ? null : onSignup,
                        width: ButtonSize.large,
                        isFullWidth: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.xxxl.h),
                InkWell(
                  onTap: () {
                    context.push(AppRoutes.login);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: S.of(context).authAlreadyHaveAccount,
                      style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                      children: [
                        TextSpan(
                          text: S.of(context).authLogIn,
                          style: TextStyle(
                            color: cs.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSpacing.xl.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
