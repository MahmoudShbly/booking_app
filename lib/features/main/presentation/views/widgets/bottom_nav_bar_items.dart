import 'package:booking_app/core/utlis/constant.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

List<PersistentBottomNavBarItem> get navBarItems => [
      PersistentBottomNavBarItem( 
        icon: const Icon(FontAwesomeIcons.solidHouse),
        title: "الرئيسية",
        activeColorPrimary: kBlue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.userClock),
        title: "مواعيدي",
        activeColorPrimary: kBlue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: _buildServicesIcon(),                  
        title: "خدماتي",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
        

      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.solidBell),
        title: "الاشعارات",
        activeColorPrimary: kBlue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.solidCircleUser),
        title: "الحساب",
        activeColorPrimary: kBlue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];


Widget _buildServicesIcon() {
  return Container(
    padding: const EdgeInsets.all(0),
    decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,    
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 6,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: CircleAvatar(

      radius: 40,
      backgroundColor: Colors.white,
      child: const Icon(
        FontAwesomeIcons.gears,
        size: 45,
        color: kBlue,
    
      ),
      
    ),
  );
}