part of 'custom_widgets.dart';

class CustomPlatformScaffold extends StatelessWidget {
  final Widget child;
  final Widget? title;
  const CustomPlatformScaffold({Key? key, required this.child, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // from https://stackoverflow.com/questions/58004118/how-to-get-the-number-of-routes-in-navigators-stack
    bool isFirstNavigationRouteOnStack = (ModalRoute.of(context) != null)
        ? ModalRoute.of(context)!.isFirst && ModalRoute.of(context)!.isCurrent
        : false;
    return GetPlatform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              leading: (isFirstNavigationRouteOnStack)
                  ? Container()
                  : IconButton(
                      icon: GetPlatform.isAndroid
                          ? const Icon(Icons.arrow_back)
                          : const Icon(CupertinoIcons.chevron_back),
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
