import 'package:bookly/src/imports/imports.dart';
import 'package:bookly/generated/l10n.dart';
import 'package:bookly/src/features/auth/domain/entities/user.dart';

/// Greeting row shown at the top of [MorePage]: avatar, "Hi" + name, and a
/// notification bell — mirrors the identity block from [HomeHeader] but sits
/// directly on the page background instead of a blue banner.
class MoreHeader extends StatelessWidget {
  const MoreHeader({super.key, required this.user});

  final AppUser? user;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;
    final name = (user?.name?.isNotEmpty ?? false) ? user!.name! : S.of(context).moreGuestFallbackName;
    final photoUrl = user?.photoUrl;

    return Row(
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
              Text(
                S.of(context).moreGreeting,
                style: tt.bodyMedium?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                name,
                style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        _NotificationBell(cs: cs),
      ],
    );
  }
}

class _NotificationBell extends StatelessWidget {
  const _NotificationBell({required this.cs});

  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.showSnackBar(S.of(context).moreNoNewNotifications),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.sm),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: VectorGraphic(
          loader: const AssetBytesLoader(AppAssets.notification),
          width: 18,
          height: 18,
          colorFilter: ColorFilter.mode(cs.primary, BlendMode.srcIn),
        ),
      ),
    );
  }
}