import 'package:bookly/src/imports/core_imports.dart';
import 'package:bookly/src/imports/packages_imports.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.onJoinAsGuest});

  final VoidCallback onJoinAsGuest;

  @override
  Widget build(BuildContext context) {
    final tt = context.theme.textTheme;
    final cs = context.theme.colorScheme;

    return Container(
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
                    onPressed: onJoinAsGuest,
                    child: Text(
                      'Join As A Guest',
                      style: tt.labelLarge?.copyWith(
                        color: cs.onPrimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          VectorGraphic(
            loader: const AssetBytesLoader(AppAssets.booklyLogo),
            width: 120.w,
            height: 35.w,
          ),
        ],
      ),
    );
  }
}
