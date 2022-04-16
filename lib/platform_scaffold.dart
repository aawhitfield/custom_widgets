part of 'custom_widgets.dart';

class CustomPlatformScaffold extends StatelessWidget {
  final Widget child;
  final Widget? title;
  const CustomPlatformScaffold({Key? key, required this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isAndroid ? Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: GetPlatform.isAndroid ? const Icon(Icons.arrow_back) : const Icon(CupertinoIcons.chevron_back),
          onPressed: () => Get.back(),
        ),
        title: title,
      ),
      body: child,
    )
        : CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: title,
      ),
      child: child,
    );
  }
}
