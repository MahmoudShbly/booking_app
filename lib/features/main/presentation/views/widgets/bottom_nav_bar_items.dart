 import 'package:booking_app/core/utlis/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

List<PersistentBottomNavBarItem> navBarItems = [
      PersistentBottomNavBarItem( 
        icon: Icon(FontAwesomeIcons.solidHouse),
        title: "الرئيسية",
        activeColorPrimary: kBlue,
        inactiveColorPrimary: Colors.grey,
        
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.userClock),
        title: "مواعيدي",
        activeColorPrimary: kBlue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.gears),
        title: "خدماتي",
        activeColorPrimary: kBlue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.solidBell),
        title: "الاشعارات",
        activeColorPrimary: kBlue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.solidCircleUser),
        title: "الحساب",
        activeColorPrimary: kBlue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
