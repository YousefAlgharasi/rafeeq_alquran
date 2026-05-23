import 'package:flutter/widgets.dart';

class ResponsiveBreakpoints {
  const ResponsiveBreakpoints._();

  static const double wideNavigation = 700;
  static const double maxContentWidth = 960;

  static bool useNavigationRail(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= wideNavigation;
  }
}
