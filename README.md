# ✈️🏨 Flight & Hotel Booking Application

A mini flight and hotel booking application built with **Flutter**. Inspired by MakeMyTrip, this app includes flight search, booking, and payment processing with Stripe (Test Mode).

---

## 📦 Setup & Installation
1. **Clone the Repository**
```bash
git clone https://github.com/Abinesh-Jain/make_your_trip.git
```

2. **Navigate to Project Directory**
```bash
cd flight_hotel_booking
```

3. **Add Environment Variables**
Create a `.env` file in the root directory and add the required API keys:
```
STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
STRIPE_SECRET_KEY=your_stripe_secret_key
```

4. **Install Dependencies**
```bash
flutter pub get
```

5. **Run the Application**
```bash
flutter run
```

---

## 🛠️ Application Flow
1. **Home Screen:** Upon launch, the app will open the Home Screen. The top-right corner will have a flight icon.
2. **Flight Search:** When the flight icon is pressed, the user will be taken to the Flight Search page, where they can fill in the following details:
   - From & To locations
   - Departure date
   - Flight class (Economy, Business)
   - Number of passengers
3. **Flight Selection:** After filling the flight search details, the user will be presented with a list of flight options. The user can select a flight to proceed with booking.
4. **Booking Details:** Once a flight is selected, the user will be taken to the Booking Details page where they will fill in passenger information such as:
   - Name, Age, Email, Phone
5. **Checkout & Payment:** The user can then proceed to the checkout page to confirm their booking and make the payment using Stripe.

---

## 💳 Payment Gateway Setup
### Stripe
1. Create a Stripe account: [https://stripe.com](https://stripe.com)
2. Get your API keys from the Stripe Dashboard.
3. Add API keys in the `.env` file as shown in the Setup section.

---

## 🤝 Contribution
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch (`feature/awesome-feature`).
3. Commit changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/awesome-feature`).
5. Open a Pull Request.