import 'package:flutter/material.dart';

const KRedDeep = Color(0xFFC74B50);

const KSubtitle1 = TextStyle(
    fontSize: 20, fontFamily: 'Robotocondensed', fontWeight: FontWeight.bold);

const KFavoriteAndShoppingIcon = Colors.deepOrange;

const KWhiteText = TextStyle(color: Colors.white);

const KColorScheme = ColorScheme(
  primary: Colors.blueAccent, // whole app buttons and appbar
  onPrimary: Colors.white, // color of the words in the appbar and button
  secondaryContainer: Colors.amber,
  background: Colors.red,
  onBackground: Colors.black,
  secondary: Colors.amber, //float action button
  onSecondary: Colors.white,
  error: Colors.black,
  onError: Colors.white,
  surface: Colors.white, // AppBar
  onSurface: Colors.black54, //icons, inputs
  brightness: Brightness.light,
);

const kSendButtonTextStyle = TextStyle(
  color: Color(0xFFC74B50),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xFFC74B50), width: 2.0),
  ),
);

const KTextFieldDecoractoin = InputDecoration(
  hintText: 'Enter your email',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFC74B50), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFC74B50), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
