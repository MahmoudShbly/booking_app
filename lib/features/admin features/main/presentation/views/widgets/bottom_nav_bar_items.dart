import 'package:booking_app/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

List<PersistentBottomNavBarItem> get adminNavBarItems => [
  PersistentBottomNavBarItem(
    icon: const Icon(FontAwesomeIcons.solidHouse),
    title: 'الموجز',
    activeColorPrimary: kBlue,
    inactiveColorPrimary: Colors.grey,
  ),
  PersistentBottomNavBarItem(
    icon: const Icon(FontAwesomeIcons.userClock),
    title: 'الانضمام',
    activeColorPrimary: kBlue,
    inactiveColorPrimary: Colors.grey,
  ),
  PersistentBottomNavBarItem(
    icon: const Icon(FontAwesomeIcons.wallet),
    title: 'الطلبات',
    activeColorPrimary: kBlue,
    inactiveColorPrimary: Colors.grey,
  ),
  PersistentBottomNavBarItem(
    icon: const Icon(FontAwesomeIcons.solidCircleUser),
    title: 'الإعدادات',
    activeColorPrimary: kBlue,
    inactiveColorPrimary: Colors.grey,
  ),
];
