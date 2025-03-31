import 'package:flutter/material.dart';

import '../components/offer_image.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../utils/strings.dart';
import '../utils/textstyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.shopping_bag),
        title: const Text(Strings.makeYourTrip),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.bookFlight),
            icon: const Icon(Icons.flight),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.bookHotel),
            icon: const Icon(Icons.hotel),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.offers),
            icon: const Icon(Icons.local_offer),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CarouselView(
              itemExtent: double.infinity,
              children: List.generate(
                5,
                (index) => GridTile(
                  header: GridTileBar(
                    title: Text(
                      '${Strings.offer} #${index + 1}',
                      style: Textstyles.f24w700,
                    ),
                    backgroundColor: Colors.black.withOpacity(.5),
                  ),
                  footer: GridTileBar(
                    title: const Text(
                      Strings.flat45OFF,
                      style: Textstyles.f16w600,
                    ),
                    subtitle: const Text(
                      Strings.limitedTimeOffer,
                      style: Textstyles.f12w400,
                    ),
                    backgroundColor: Colors.black.withOpacity(.5),
                  ),
                  child: OfferImage(random: index + 1),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.description, color: AppColors.accent),
            title: const Text(
              Strings.termsAndConditions,
              style: Textstyles.f14w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: AppColors.accent),
            title: const Text(
              Strings.privacyPolicy,
              style: Textstyles.f14w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail, color: AppColors.accent),
            title: const Text(
              Strings.contactUs,
              style: Textstyles.f14w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
