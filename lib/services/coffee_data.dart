import '../models/coffee_item.dart';

class CoffeeData {
  static final List<CoffeeItem> items = [
    (
      id: '1',
      name: 'Sunrise Signature Latte',
      category: 'Hot Coffee',
      price: 4.50,
      description: 'Our signature blend with velvety microfoam and a double shot of sunrise espresso.',
      imageUrl: 'https://images.unsplash.com/photo-1541167760496-1628856ab772?auto=format&fit=crop&w=600&q=80',
    ),
    (
      id: '2',
      name: 'Golden Morning Cappuccino',
      category: 'Hot Coffee',
      price: 4.25,
      description: 'Equal parts espresso, steamed milk, and rich airy foam dusted with cinnamon.',
      imageUrl: 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=600&q=80',
    ),
    (
      id: '3',
      name: 'Dawn Cold Brew',
      category: 'Cold Brew',
      price: 4.00,
      description: 'Steeped for 18 hours for an ultra-smooth, low-acidity refreshing morning kick.',
      imageUrl: 'https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?auto=format&fit=crop&w=600&q=80',
    ),
    (
      id: '4',
      name: 'Amber Honey Iced Macchiato',
      category: 'Cold Brew',
      price: 4.80,
      description: 'Layered vanilla, cold milk, rich espresso, and a drizzle of local wildflower honey.',
      imageUrl: 'https://images.unsplash.com/photo-1578314675249-a6919f3cbce3?auto=format&fit=crop&w=600&q=80',
    ),
    (
      id: '5',
      name: 'Matcha Sunrise Green Tea',
      category: 'Teas',
      price: 4.75,
      description: 'Ceremonial grade Uji matcha whisked fresh with velvety steamed oat milk.',
      imageUrl: 'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?auto=format&fit=crop&w=600&q=80',
    ),
    (
      id: '6',
      name: 'Sunrise Almond Croissant',
      category: 'Bakery',
      price: 3.75,
      description: 'Flaky, buttery pastry filled with rich almond frangipane and toasted almonds.',
      imageUrl: 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?auto=format&fit=crop&w=600&q=80',
    ),
  ].map((e) => CoffeeItem(
        id: e.id,
        name: e.name,
        category: e.category,
        price: e.price,
        description: e.description,
        imageUrl: e.imageUrl,
      )).toList();
}
