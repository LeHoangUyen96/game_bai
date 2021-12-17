import 'package:flutter/material.dart';

import 'package:viet_trung_mobile_admin/res/colors.dart';
import 'package:viet_trung_mobile_admin/res/images.dart';
import 'package:viet_trung_mobile_admin/res/strings.dart';

class NavigateEmblem {
  NavigateEmblem(this.title, this.image, this.color, this.id, this.badgeCount,
      this.showBadge);
  String title;
  String image;
  Color color;
  int id;
  int badgeCount;
  bool showBadge;
}

List<NavigateEmblem> navigateItem = <NavigateEmblem>[
  NavigateEmblem(NAV_HOME, IC_NAV_HOME, BLACK_1, 0, 0, false),
  NavigateEmblem(MANAGE_PACKAGE_ORDER, IC_NAV_CART, DISABLED_COLOR, 1, 0, true),
  NavigateEmblem(NAV_PROFILE, IC_NAV_PROFILE, DISABLED_COLOR, 2, 0, false),
  NavigateEmblem(
      NAV_NOTIFICATION, IC_NAV_NOTIFICATION, DISABLED_COLOR, 3, 0, false),
];

class NavigateEmblemAdmin {
  NavigateEmblemAdmin(this.title, this.image, this.color, this.id,
      this.badgeCount, this.showBadge);
  String title;
  String image;
  Color color;
  int id;
  int badgeCount;
  bool showBadge;
}

List<NavigateEmblemAdmin> navigateItemAdmin = <NavigateEmblemAdmin>[
  NavigateEmblemAdmin(NAV_HOME, IC_NAV_HOME, BLACK_1, 0, 0, false),
  NavigateEmblemAdmin(
      MANAGE_PACKAGE_ORDER, IC_ORDER, DISABLED_COLOR, 1, 0, true),
  NavigateEmblemAdmin("", "", WHITE, 4, 0, false),
  NavigateEmblemAdmin(MANAGE, IC_ACCOUNT, DISABLED_COLOR, 2, 0, false),
  NavigateEmblemAdmin(NAV_SETTING, IC_SETTING, DISABLED_COLOR, 3, 0, false),
];
