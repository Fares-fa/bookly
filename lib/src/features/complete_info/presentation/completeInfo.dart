import 'package:bookly/src/app.dart';
import 'package:bookly/src/imports/imports.dart';

class CompleteInfo extends StatelessWidget {
  const CompleteInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SvgPicture.asset(AppAssets.smallBooklyIconBlue),
        ),
        body: Container());
  }
}
