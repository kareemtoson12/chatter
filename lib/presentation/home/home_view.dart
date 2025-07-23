import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:social/app/styles/colros_manager.dart';
import 'package:social/app/styles/fonts.dart';
import 'package:social/presentation/home/widgets/chatList.dart';

import 'package:social/presentation/home/widgets/posts_widget.dart';
import 'package:social/presentation/home/widgets/stories.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.favorite_border, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.blue,
        buttonBackgroundColor: Colors.lightBlueAccent,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: ColorManager.blueWhiteGradientHome,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(14),
              child: Column(
                children: [
                  //header
                  // ...existing code...
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chatter',
                        style: AppTextStyles.splashTitleStyle().copyWith(
                          fontSize: 30,
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
                        child: Image.asset('assets/images/message_icon.png'),
                      ),
                    ],
                  ),
                  //
                  SizedBox(height: 15),
                  //stories
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
      ),
    );
  }
}
