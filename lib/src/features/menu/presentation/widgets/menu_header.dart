import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/src/features/auth/domain/entities/user.dart';

/// Greeting row shown at the top of [MorePage]: avatar, "Hi" + name, a
/// notification/chevron affordance, and a logout button — mirrors the
/// identity block from [HomeHeader] but sits directly on the page
/// background instead of a blue banner.
class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key, required this.user, this.onLogout});

  final AppUser? user;
  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final name = (user?.name?.isNotEmpty ?? false) ? user!.name! : 'Guest';
    final photoUrl = user?.photoUrl;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.pagePadding,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24.r,
                      backgroundColor: cs.surfaceContainerLow,
                      backgroundImage: (photoUrl != null && photoUrl.isNotEmpty)
                          ? NetworkImage(photoUrl)
                          : null,
                      child: (photoUrl != null && photoUrl.isNotEmpty)
                          ? null
                          : Icon(Icons.person, color: cs.onSurfaceVariant),
                    ),
                    SizedBox(width: AppSpacing.ms),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi',
                              style: AppTextStyle.blackW400Size16.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary)),
                          Text(
                            name,
                            style: AppTextStyle.blackW500Size18
                                .copyWith(fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16.r),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14.r)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(14.r),
                onTap: onLogout,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: Center(
                    child: VectorGraphic(
                      loader: const AssetBytesLoader(AppAssets.logout),
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(cs.error, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}