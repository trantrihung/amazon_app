import 'package:flutter/material.dart';

String uri = "http://localhost:3000";

class GlobalVariable {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackground = Color(0xffebecee);
  static var selectedNaBarColor = Colors.cyan[800];
  static const unselectedNavBarColor = Colors.black87;

  //STATIC IMAGES
  static const List<String> carouselImages = [
    "https://images.unsplash.com/photo-1673001161631-198351b9b933?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1295&q=80",
    "https://plus.unsplash.com/premium_photo-1670426502230-6906ba90feb5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1546842931-886c185b4c8c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80"
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': "Mobiles",
      'images': 'assets/images/mobiles.jpeg',
    },
    {
      "title": "Essentials",
      "images": "assets/images/essentials.jpeg",
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];
}
