import 'package:flutter/material.dart';

const double kPi = 3.1415926535897932;

// const Color kPrimaryColor = Color(0xFFa6e3e9);
// const Color kPrimaryLighterColor = Color(0xFFe3fdfd);
// const Color kPrimaryLightColor = Color(0xFFcbf1f5);
// const Color kPrimaryDarkColor = Color(0xFF71c9ce);
// const Color kPrimaryDarkerColor = Color(0xFF27496d);

const Color kPrimaryColor = Color(0xFFdcd6f7);
const Color kPrimaryLighterColor = Color(0xFFf4eeff);
const Color kPrimaryLightColor = Color(0xFFa6b1e1);
const Color kPrimaryDarkColor = Color(0xFF6a75ca);
const Color kPrimaryDarkerColor = Color(0xFF545DA1);

const Color kSecondaryColor = Color(0xFFE9575F);
const Color kSecondaryLightColor = Color(0xFFF1A7A2);
const Color kSecondaryDarkColor = Color(0xFFDE214C);

const Color kTextColor = Color(0xFF5130A8);

const String kRouteHome = '/';
const String kRouteRoomScreen = '/room';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
