import 'package:flutter/material.dart';

import '../utils/strings.dart';

class BookHotelScreen extends StatelessWidget {
  const BookHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.hotels)),
    );
  }
}
