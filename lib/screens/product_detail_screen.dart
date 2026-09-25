import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee_item.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final CoffeeItem item;

  const ProductDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String _selectedSize = 'Medium';
  String _selectedMilk = 'Whole Milk';
  int _sugars = 0;

  final List<String> _sizes = ['Small', 'Medium', 'Large'];
  final List<String> _milks = ['Whole Milk', 'Oat Milk', 'Almond Milk', 'Skim Milk', 'Black'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.item.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.item.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '\$${widget.item.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[800],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.item.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.brown[600],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Select Size',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: _sizes.map((size) {
                      final isSelected = _selectedSize == size;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: isSelected ? Colors.amber[800] : Colors.white,
                              side: BorderSide(color: Colors.amber[800]!),
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedSize = size;
                              });
                            },
                            child: Text(
                              size,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.brown[800],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Milk Choice',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedMilk,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    items: _milks.map((milk) {
                      return DropdownMenuItem(
                        value: milk,
                        child: Text(milk),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _selectedMilk = val;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sugar Level',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: _sugars > 0
                                ? () => setState(() => _sugars--)
                                : null,
                          ),
                          Text('$_sugars', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: _sugars < 5
                                ? () => setState(() => _sugars++)
                                : null,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[800],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false).addItem(
                          widget.item,
                          _selectedSize,
                          _selectedMilk,
                          _sugars,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added ${widget.item.name} to cart!'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Add to Order',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}