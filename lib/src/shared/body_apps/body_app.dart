import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';


import '../../imports/core_imports.dart';

class BodyApp extends StatefulWidget {
  const BodyApp(
      {required this.bodyOfContent,
        super.key,
        this.txtCustomAppBar,
        this.isShowBackgroundImage = false,
        this.isShowLeading = false,
        this.onPressedArrowBack,
        this.iconButtonCustomAppBar,
        this.bottomNavigationBar,
        this.primaryBackgroundColor,
        this.padding,
        this.isLogo = false,
        this.isText = true});

  final String? txtCustomAppBar;
  final Widget bodyOfContent;
  final Widget? bottomNavigationBar;

  final bool? isShowBackgroundImage;
  final bool? isShowLeading;
  final bool? isLogo;
  final bool? isText;
  final bool? primaryBackgroundColor;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressedArrowBack;
  final Widget? iconButtonCustomAppBar;

  @override
  State<BodyApp> createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarBodyApp(title: widget.txtCustomAppBar,onPressedArrowBack:widget.onPressedArrowBack),
      body: widget.bodyOfContent,
      bottomNavigationBar: widget.bottomNavigationBar
    );
  }
}



class AppBarBodyApp extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBodyApp({super.key, this.title,this.onPressedArrowBack});

  final String? title;
  final void Function()? onPressedArrowBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      titleSpacing: 0,
      leadingWidth: 64.w,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: AppSpacing.pagePadding),
          child: GestureDetector(
            onTap: onPressedArrowBack,
            child:const VectorGraphic(
              width: 32,
              height: 32,
              loader: AssetBytesLoader(AppAssets.backApp,),
            ),
          ),
        ),
      ),
      title: title == null
          ? null
          : Text(title!, style: AppTextStyle.blackW500Size16),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
