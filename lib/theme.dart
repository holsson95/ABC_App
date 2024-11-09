import 'package:flutter/material.dart';

class AppTheme {
  // Define the main theme using your color palette
  static ThemeData get lightTheme {
    return ThemeData(

      primaryColor: Color(0xFF071f56),

     
      // Background color
      scaffoldBackgroundColor: Color(0xFF071f56), // Example light gray

      // AppBar theme
      appBarTheme: AppBarTheme(
        color: Color(0xFF071f56), // Purple for the app bar
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color:Colors.white)
      ),

      // Button theme
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFFFFC107), // Amber for buttons
        textTheme: ButtonTextTheme.primary,
      ),

      // Floating Action Button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF6A0DAD), // Purple floating button
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: Color(0xFF6A0DAD),
        labelStyle: TextStyle(color: Colors.white),
        disabledColor: Colors.grey,
        selectedColor: Color(0xFF6A0DAD),
        secondarySelectedColor: Colors.purpleAccent,
        padding: EdgeInsets.all(4),
        brightness: Brightness.dark,
      ),
    );
  }
}
