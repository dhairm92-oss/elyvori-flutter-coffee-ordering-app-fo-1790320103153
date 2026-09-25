import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber[800]!, Colors.orange[900]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Text(
                  'Sunrise Rewards Club',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '145',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sunrise Beans Available',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 16),
                LinearProgressIndicator(
                  value: 0.65,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  '55 beans until your next free drink!',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Available Rewards',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildRewardTile('Free Espresso Shot', '50 Beans', Icons.coffee),
          _buildRewardTile('Any Pastry or Bakery Item', '100 Beans', Icons.cake),
          _buildRewardTile('Free Signature Drink', '200 Beans', Icons.local_cafe),
          _buildRewardTile('Sunrise Coffee Mug', '400 Beans', Icons.card_giftcard),
        ],
      ),
    );
  }

  Widget _buildRewardTile(String title, String cost, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber[100],
          child: Icon(icon, color: Colors.amber[900]),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(cost, style: TextStyle(color: Colors.amber[800], fontWeight: FontWeight.w600)),
        trailing: OutlinedButton(
          onPressed: () {},
          child: const Text('Redeem'),
        ),
      ),
    );
  }
}
