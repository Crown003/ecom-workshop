import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedCategory = 0;
  int selectedNav = 0;
  int cartCount = 0;

  // Colors
  static const Color bgColor = Color(0xFFF5F4F0);
  static const Color white = Colors.white;
  static const Color darkText = Color(0xFF1C1C2E);
  static const Color purple = Color(0xFF5B4FE9);
  static const Color lightPurple = Color(0xFFECEAFD);
  static const Color grey = Color(0xFF9090A8);

  // Category list
  final List<String> categories = ['All', 'Popular', 'New', 'Sale'];

  // Featured products
  final List<Map<String, dynamic>> featuredProducts = [
    {
      'name': 'Study Chair',
      'price': '₹3,499',
      'oldPrice': '₹4,500',
      'tag': 'Bestseller',
      'color1': Color(0xFF667EEA),
      'color2': Color(0xFF764BA2),
      'emoji': '🪑',
      'rating': '4.9',
    },
    {
      'name': 'Desk Lamp',
      'price': '₹999',
      'oldPrice': '₹1,299',
      'tag': 'New',
      'color1': Color(0xFFf7971e),
      'color2': Color(0xFFffd200),
      'emoji': '💡',
      'rating': '4.7',
    },
    {
      'name': 'Serving Tray',
      'price': '₹799',
      'oldPrice': '₹1,100',
      'tag': 'Sale',
      'color1': Color(0xFF11998e),
      'color2': Color(0xFF38ef7d),
      'emoji': '🍽️',
      'rating': '4.8',
    },
  ];

  // Product list
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Woolen Blanket',
      'type': 'Textiles',
      'price': '₹1,199',
      'color1': Color(0xFFe96c6c),
      'color2': Color(0xFFf5a05a),
      'emoji': '🧶',
      'rating': '4.8',
      'liked': false,
    },
    {
      'name': 'Flower Vase',
      'type': 'Decor',
      'price': '₹649',
      'color1': Color(0xFF43e97b),
      'color2': Color(0xFF38f9d7),
      'emoji': '🏺',
      'rating': '4.6',
      'liked': true,
    },
    {
      'name': 'Wall Shelf',
      'type': 'Furniture',
      'price': '₹2,799',
      'color1': Color(0xFF4facfe),
      'color2': Color(0xFF00f2fe),
      'emoji': '🪵',
      'rating': '4.9',
      'liked': false,
    },
    {
      'name': 'Sofa Cushion',
      'type': 'Textiles',
      'price': '₹449',
      'color1': Color(0xFFa18cd1),
      'color2': Color(0xFFfbc2eb),
      'emoji': '🛋️',
      'rating': '4.5',
      'liked': false,
    },
    {
      'name': 'Scented Candle',
      'type': 'Lifestyle',
      'price': '₹349',
      'color1': Color(0xFFf093fb),
      'color2': Color(0xFFf5576c),
      'emoji': '🕯️',
      'rating': '4.7',
      'liked': true,
    },
    {
      'name': 'Small Plant',
      'type': 'Plants',
      'price': '₹299',
      'color1': Color(0xFF56ab2f),
      'color2': Color(0xFFa8e063),
      'emoji': '🌿',
      'rating': '4.4',
      'liked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            buildHeader(),
            buildSearchBar(),
            buildCategories(),
            buildSectionTitle('Featured', '${featuredProducts.length} picks'),
            buildFeaturedList(),
            buildSectionTitle('All Products', '${products.length} items'),
            buildProductList(),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }

  // Header
  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good morning 👋', style: TextStyle(fontSize: 13, color: grey)),
                const SizedBox(height: 3),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: darkText),
                ),
              ],
            ),
          ),
          // Cart button with badge
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined, color: darkText, size: 26),
              ),
              if (cartCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(color: purple, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        '$cartCount',
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 4),
          // Profile avatar
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [purple, Color(0xFF9B8DF4)]),
            ),
            child: const Center(
              child: Text('A', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  // Search bar
  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha:0.05), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(Icons.search_rounded, color: grey, size: 20),
            const SizedBox(width: 10),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  hintStyle: TextStyle(color: grey, fontSize: 14),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: TextStyle(fontSize: 14, color: darkText),
                cursorColor: purple,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(color: lightPurple, borderRadius: BorderRadius.circular(10)),
              child: const Text('Filter', style: TextStyle(color: purple, fontSize: 12, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }

  // Category chips
  Widget buildCategories() {
    return SizedBox(
      height: 42,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, i) {
          bool isActive = i == selectedCategory;
          return GestureDetector(
            onTap: () => setState(() => selectedCategory = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: isActive ? purple : white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: isActive ? purple.withOpacity(0.35) : Colors.black.withOpacity(0.04),
                    blurRadius: isActive ? 8 : 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  categories[i],
                  style: TextStyle(
                    color: isActive ? Colors.white : grey,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Section title row
  Widget buildSectionTitle(String title, String info) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: darkText)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(color: lightPurple, borderRadius: BorderRadius.circular(10)),
            child: Text(info, style: const TextStyle(fontSize: 12, color: purple, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  // Horizontal featured cards
  Widget buildFeaturedList() {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: featuredProducts.length,
        itemBuilder: (context, i) {
          var p = featuredProducts[i];
          return GestureDetector(
            onTap: () => showProductSheet(p),
            child: Container(
              width: 280,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [p['color1'], p['color2']],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: (p['color1'] as Color).withOpacity(0.35),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -8,
                    bottom: -8,
                    child: Text(p['emoji'], style: const TextStyle(fontSize: 95)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tag
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(p['tag'],
                              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                        ),
                        const Spacer(),
                        Text(p['name'],
                            style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(p['price'],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(width: 8),
                            Text(
                              p['oldPrice'],
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.star_rounded, color: Colors.white, size: 12),
                                  const SizedBox(width: 3),
                                  Text(p['rating'],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Vertical product cards
  Widget buildProductList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: products.length,
      itemBuilder: (context, i) => buildProductCard(products[i], i),
    );
  }

  Widget buildProductCard(Map<String, dynamic> item, int index) {
    return GestureDetector(
      onTap: () => showProductSheet(item),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha:0.05), blurRadius: 14, offset: const Offset(0, 4))
          ],
        ),
        child: Row(
          children: [
            // Image area
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [item['color1'], item['color2']],
                ),
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
              ),
              child: Center(child: Text(item['emoji'], style: const TextStyle(fontSize: 44))),
            ),
            // Details area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Type tag
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: lightPurple, borderRadius: BorderRadius.circular(8)),
                          child: Text(item['type'],
                              style: const TextStyle(
                                  fontSize: 10, color: purple, fontWeight: FontWeight.w700)),
                        ),
                        // Like button
                        GestureDetector(
                          onTap: () => setState(() => products[index]['liked'] = !item['liked']),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              item['liked'] ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                              key: ValueKey(item['liked']),
                              color: item['liked'] ? Colors.redAccent : grey,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(item['name'],
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: darkText)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 14),
                        const SizedBox(width: 3),
                        Text(item['rating'],
                            style: const TextStyle(fontSize: 12, color: grey, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item['price'],
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: purple)),
                        // Add to cart
                        GestureDetector(
                          onTap: () => setState(() => cartCount++),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(10)),
                            child: const Icon(Icons.add_rounded, color: Colors.white, size: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Product detail bottom sheet
  void showProductSheet(Map<String, dynamic> item) {
    // Support both key styles (color1/color2 or gradientStart/gradientEnd)
    final c1 = item['color1'] ?? item['gradientStart'];
    final c2 = item['color2'] ?? item['gradientEnd'];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        height: MediaQuery.of(context).size.height * 0.55,
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Drag handle
            Container(
              width: 40,
              height: 4,
              decoration:
              BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4)),
            ),
            const SizedBox(height: 20),
            // Product image
            Container(
              width: double.infinity,
              height: 140,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [c1, c2]),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(child: Text(item['emoji'], style: const TextStyle(fontSize: 72))),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name'],
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900, color: darkText)),
                      const SizedBox(height: 4),
                      Text(item['price'],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700, color: purple)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 18),
                      const SizedBox(width: 4),
                      Text(item['rating'] ?? '4.8',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700, color: darkText)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() => cartCount++);
                    Navigator.pop(ctx);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item['name']} added to cart 🛍️'),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: purple,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purple,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('Add to Cart',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom nav bar
  Widget buildBottomNav() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 20, offset: const Offset(0, -4))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(Icons.home_rounded, 'Home', 0),
          navItem(Icons.grid_view_rounded, 'Catalog', 1),
          navItem(Icons.shopping_bag_outlined, 'Cart', 2),
          navItem(Icons.person_outline_rounded, 'Profile', 3),
        ],
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index) {
    bool isActive = selectedNav == index;
    return GestureDetector(
      onTap: () => setState(() => selectedNav = index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? lightPurple : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isActive ? purple : grey, size: 24),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? purple : grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}