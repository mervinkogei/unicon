import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicon/screens/profile.dart';
import 'package:unicon/screens/settings.dart';
import 'package:unicon/utils/colors.dart';

class ThemeStyling{
   static var signTitleStyle = GoogleFonts.inter(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );
   static var signButtonStyle = GoogleFonts.inter(
    fontSize: 17.0,
    fontWeight: FontWeight.w700,
  );
  static var forgotPasswordStyle = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
   static var titleStyle = GoogleFonts.inter(
    fontSize: 14.0,
    color: const Color(0xff667085),
    fontWeight: FontWeight.w500,
  );

  static const navigationBarStyle = BorderRadius.only(
    topRight: Radius.circular(0),
    topLeft: Radius.circular(0),
  );

  static var settingTitleStyle = GoogleFonts.inter(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );

  static var profiletitleStyle = GoogleFonts.dmSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  static var profileEmailStyle = GoogleFonts.dmSans(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
  );
}

class DefaultValues{
  // static final cookieJar = CookieJar(); 
  List defaultNavigationList = [
    {
      "icon": const Icon(Icons.home),//Image.asset("images/home_dash.png"),
      "activeIcon": const Icon(Icons.home_outlined), //Image.asset("images/home_dash_active.png"),
      "label": 'Home'
    },
    {
      "icon": Padding(padding: const EdgeInsets.only(bottom: 8), child: Image.asset("images/tasks.png", color: const Color(0xffB0B0B0),),),
      "activeIcon": Padding(padding: const EdgeInsets.only(bottom: 8),child:Image.asset("images/tasks.png")),
      "label": 'My Tasks',
    },
    {
      "icon": const Icon(Icons.notifications),// Image.asset("images/support.png"),
      "label": 'Updates',
      "activeIcon": const Icon(Icons.notifications_active),//Image.asset("images/support_active.png"),
    },
  ];


}
  AppBar customBar(context){
    return AppBar(
      leading: InkWell(
        onTap: (){
          Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (context) =>   Profile()));
        },
        child: const Icon(Icons.person, color: iconColor,)),
      backgroundColor: appBarColor,
      centerTitle: true,
      elevation: 0,
      title: Image.asset('images/app_logo.png'),
      actions:  [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            onTap: (){
              Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (context) =>   Settings()));
        // (route) => false);
            },
            child: Icon(Icons.settings, color: iconColor,)),
        )
      ],
    );
  }