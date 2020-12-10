import 'package:flutter/cupertino.dart';
import 'package:tododemo/utils/extensions/extension.dart';

class ThemedActivityIndicator extends StatelessWidget {
  const ThemedActivityIndicator({Key key, this.radius = 10, this.isDarkMode}) : super(key: key);
  final double radius;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) => CupertinoActivityIndicator().getThemedIndicator(
        context,
        radius: radius,
        isDarkMode: isDarkMode,
      );
}
