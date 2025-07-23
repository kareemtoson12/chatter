import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:social/app/styles/colros_manager.dart';
import 'package:social/app/styles/fonts.dart';
import 'package:social/presentation/home/widgets/chatList.dart';
import 'package:social/presentation/home/widgets/posts_widget.dart';
import 'package:social/presentation/home/widgets/profile_view.dart';
import 'package:social/presentation/home/widgets/stories.dart';
import 'package:social/presentation/settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _screens = [
    _HomeTab(),
    Center(child: Text('Search')),
    Center(child: Text('Add')),
    SettingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white, // ✅ FIXED HERE

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: isDark ? Colors.white : Colors.black,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: isDark ? Colors.white : Colors.black,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: isDark ? Colors.white : Colors.black,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: isDark ? Colors.white : Colors.black,
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
            color: isDark ? Colors.white : Colors.black,
          ),
        ],
        color: Colors.blue,
        buttonBackgroundColor: Colors.lightBlueAccent,
        backgroundColor: isDark ? Colors.black : Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),

      body: _screens[_page],
    );
  }
}

// Extracted Home tab content
class _HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: ColorManager.getHomeGradient(context),
          ),
          child: Padding(
            padding: EdgeInsets.all(14), // ✅ Corrected from EdgeInsetsGeometry
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chatter',
                      style: AppTextStyles.splashTitleStyle().copyWith(
                        fontSize: 30,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ChatListView(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/message_icon.png',
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Stories(),
                SizedBox(height: 25),
                InstagramPost(
                  username: 'joshua_l',
                  userAvatarAsset: 'assets/images/staticPost.png',
                  location: 'Tokyo, Japan',
                  isVerified: true,
                  imageAssets: [
                    'assets/images/staticPost.png',
                    'assets/images/staticPost.png',
                    'assets/images/staticPost.png',
                  ],
                  caption:
                      'The game in Japan was amazing and I want to share some photos',
                  likedByUser: 'craig_love',
                  likeCount: 44686,
                  onLike: () => print('Liked!'),
                  onComment: () => print('Comment tapped'),
                  onShare: () => print('Share tapped'),
                  onSave: () => print('Save tapped'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
