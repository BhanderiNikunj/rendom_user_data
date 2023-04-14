import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendom_user_data/Screen/Home/Provider/HomeProvider.dart';
import 'package:rendom_user_data/Screen/Home/View/HomeScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RandomUserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    ),
  );
}
