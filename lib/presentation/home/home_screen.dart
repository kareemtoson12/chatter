import 'package:chatter/app/styles/font_style.dart';
import 'package:chatter/presentation/home/widgets/navigation_bar.dart'; // أضف هذا الاستيراد
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    Column(
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Chatter',
              style: FontStyles.titlePacifico.copyWith(fontSize: 32),
            ),
            const Spacer(),
            Image.asset('assets/message.png', height: 40, color: Colors.blue),
          ],
        ),
        const Divider(thickness: 0.3, color: Colors.grey),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: ' Explore Friends.. ',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        const SizedBox(height: 40),
        // Create Post Section
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text(' No Posts yet ', style: TextStyle(color: Colors.grey[600])),
      ],
    ),

    Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 22, color: Colors.blue),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: _pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: MainNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
