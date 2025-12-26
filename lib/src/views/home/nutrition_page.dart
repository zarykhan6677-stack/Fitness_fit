import 'package:flutter/material.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF416C),
                  Color(0xFF833AB4),
                  Color(0xFFFD1D1D),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Decorative circles
          Positioned(
            top: -40,
            left: -20,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -50,
            right: -30,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Main content (scrollable)
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nutrition Guide",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _nutritionCard(
                    "Calories Intake",
                    Icons.local_fire_department,
                    "Track your daily calories to maintain your fitness goals.",
                  ),

                  _nutritionCard(
                    "Protein",
                    Icons.egg_alt,
                    "Protein helps in muscle building and strength.",
                  ),

                  _nutritionCard(
                    "Carbohydrates",
                    Icons.bakery_dining,
                    "Carbs provide instant energy for the body.",
                  ),

                  _nutritionCard(
                    "Healthy Fats",
                    Icons.favorite,
                    "Good fats are essential for hormones & energy.",
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nutritionCard(String title, IconData icon, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 40),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              "$title\n$subtitle",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
