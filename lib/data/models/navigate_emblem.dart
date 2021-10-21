import 'package:flutter/material.dart';

import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/res/images.dart';
import 'package:viet_trung_mobile/res/strings.dart';


class NavigateEmblem {
   NavigateEmblem(this.title, this.image, this.color, this.id, this.badgeCount, this.showBadge);
   String title;
   String image;
   Color color;
   int id;
   int badgeCount;
   bool showBadge;
}

List<NavigateEmblem> navigateItem = <NavigateEmblem>[
  NavigateEmblem(NAV_HOME, IC_NAV_HOME, MAIN_COLOR, 0, 0, false),
  NavigateEmblem(NAV_CART, IC_NAV_CART, DISABLED_COLOR, 1, 0, true),
  NavigateEmblem(NAV_NOTIFICATION, IC_NAV_NOTIFICATION, DISABLED_COLOR, 2, 0, false),
  NavigateEmblem(NAV_PROFILE, IC_NAV_PROFILE, DISABLED_COLOR, 3, 0, false),
];