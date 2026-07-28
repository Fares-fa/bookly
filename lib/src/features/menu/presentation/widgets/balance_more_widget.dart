import 'package:bookly/src/imports/imports.dart';

class BalanceMoreWidget extends StatelessWidget {
  const BalanceMoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(21.r),
          gradient: const LinearGradient(
              begin: AlignmentGeometry.centerLeft,
              end: AlignmentGeometry.centerRight,
              colors: [
                Color(0xFF0042D3),
                Color(0xFF00226D),
              ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '100.00 EGP',
                  style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Text(
                  'Your Balance',
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.white

                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              const VectorGraphic(
                loader: AssetBytesLoader(AppAssets.balance),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,right: 6.w,
                  child: Icon(Icons.arrow_forward_ios,size: 16.w,color: Colors.white ,))
            ],
          ),
        ],
      ),
    );
  }
}
