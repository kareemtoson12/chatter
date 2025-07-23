import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> stories = [
      {
        'image': 'assets/images/story1.jpg',
        'name': 'Your Story',
        'live': false,
      },
      {
        'image': 'assets/images/static_user.png',
        'name': 'karennne',
        'live': true,
      },
      {
        'image': 'assets/images/static_user.png',
        'name': 'zackjohn',
        'live': false,
      },
      {
        'image': 'assets/images/static_user.png',
        'name': 'kieron_d',
        'live': false,
      },
      {
        'image': 'assets/images/static_user.png',
        'name': 'craig_',
        'live': false,
      },
    ];

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final story = stories[index];
          return Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: story['live']
                          ? const LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.red,
                                Colors.orange,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : LinearGradient(
                              colors: [
                                Colors.grey.shade300,
                                Colors.grey.shade300,
                              ],
                            ),
                    ),
                    child: CircleAvatar(
                      radius: 36,
                      backgroundImage: AssetImage(story['image']),
                    ),
                  ),
                  if (story['live'])
                    Positioned(
                      bottom: -2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'LIVE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                story['name'],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
