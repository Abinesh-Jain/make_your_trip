import 'package:flutter/material.dart';

import '../components/offer_image.dart';
import '../utils/strings.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.offers)),
      body: ListWheelScrollView(
        itemExtent: 300,
        children: List.generate(
          50,
          (index) => OfferImage(random: index),
        ),
      ),
    );
  }
}
