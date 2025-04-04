 Flutter E-Commerce Cart with Riverpod

📌 Overview

This Flutter project is an E-Commerce Cart System using Riverpod for state management. Users can view products, add or remove items from the cart, and see price details dynamically.

🚀 Features

📦 Product Listing: Displays products with images, brand, and price details.

➕ Add to Cart: Users can increase the quantity of items.

➖ Remove from Cart: Decrease the item count or remove it completely.

🎨 Elegant UI: Well-structured card design for better user experience.

🏗 Tech Stack

Flutter 🖥️ (Framework)

Dart 💙 (Programming Language)

Riverpod 🔄 (State Management)

Material UI 🎨 (Design & Components)

📂 Project Structure

📂 lib/
 ┣ 📂 models/
 ┃ ┗ 📜 product_model.dart    # Product data model
 ┣ 📂 providers/
 ┃ ┗ 📜 cart_provider.dart     # Cart state management with Riverpod
 ┣ 📂 widgets/
 ┃ ┗ 📜 cart_item.dart        # Cart UI component
 ┗ 📜 main.dart               # Main application file

🛠 Installation & Setup

Clone the Repository

git clone https://github.com/your-username/flutter-ecommerce-cart.git
cd flutter-ecommerce-cart

Install Dependencies

flutter pub get

Run the Application

flutter run

📜 Usage

Run the app to see a list of products.

Click on the + button to add a product to the cart.

Click on the - button to decrease quantity or remove the item.

The price updates dynamically based on quantity.

📦 Dependencies

dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.3.0
  gap: ^3.0.1


