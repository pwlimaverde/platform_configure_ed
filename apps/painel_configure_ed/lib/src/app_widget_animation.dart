import 'package:flutter/material.dart';

class AppWidgetAnimation extends StatelessWidget {

  const AppWidgetAnimation({ super.key });

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Container(
        color: Colors.amber,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}