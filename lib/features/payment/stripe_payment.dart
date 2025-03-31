import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utils/strings.dart';
import '../environment/env_service.dart';

class StripePayment {
  Map<String, dynamic>? paymentIntent;

  /// ✅ Create Payment Intent
  Future<void> createPaymentIntent(String amount, String currency) async {
    try {
      // Define the backend URL (Replace with your actual backend URL)
      final url = Uri.parse('https://api.stripe.com/v1/payment_intents');

      // Stripe Secret Key
      final secretKey = EnvService.stripeSecretKey;

      // Request Headers
      final headers = {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      // Payment Intent Data
      final body = {
        'amount': (int.parse(amount) * 100).toString(), // Amount in cents
        'currency': currency,
      };

      // Send POST request to create Payment Intent
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        paymentIntent = json.decode(response.body);
      } else {
        throw Exception('Failed to create Payment Intent');
      }
    } catch (e) {
      rethrow;
    }
  }

  /// ✅ Initialize Payment Sheet
  Future<void> initPaymentSheet() async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: Strings.makeYourTrip,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// ✅ Display Payment Sheet
  /// ✅ Display Payment Sheet with Return Status
  Future<String> presentPaymentSheet() async {
    try {
      // Show payment sheet
      await Stripe.instance.presentPaymentSheet();

      //  Payment Success
      return 'success';
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        // Payment Canceled
        return 'canceled';
      } else {
        // Payment Failed
        return 'failed';
      }
    } catch (e) {
      // Unexpected Error
      return 'error';
    }
  }

  /// ✅ Complete Payment Flow
  Future<String> makePayment(String amount, String currency) async {
    // 1. Create Payment Intent
    await createPaymentIntent(amount, currency);

    // 2. Initialize Payment Sheet
    await initPaymentSheet();

    // 3. Show Payment Sheet
    return presentPaymentSheet();
  }
}
