import 'package:flutter/material.dart';

import '../utils/endpoints.dart';

class OfferImage extends StatelessWidget {
  const OfferImage({super.key, this.random = 1});

  final int random;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${Endpoints.picsum}200/300?random=$random',
      fit: BoxFit.cover,
    );
  }
}
