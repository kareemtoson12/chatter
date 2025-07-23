import 'package:flutter/material.dart';
import 'package:social/app/styles/colros_manager.dart';
import 'package:social/app/styles/fonts.dart';
import 'package:social/presentation/home/widgets/chat_details.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        'name': 'joshua_l',
        'avatar': 'assets/images/staticPost.png',
        'last': 'Hey!',
        'time': '10:30 AM',
      },
      {
        'name': 'craig_love',
        'avatar': 'assets/images/story1.jpg',
        'last': 'See you soon!',
        'time': '10: AM',
      },
      {
        'name': 'karennne',
        'avatar': 'assets/images/story2.jpg',
        'last': 'Let\'s catch up.',
        'time': '9 AM',
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: ColorManager.blueWhiteGradientHome,
          ),

          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Chats", style: AppTextStyles.splashTitleStyle()),
              ),

              //search textfeild
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),

                    filled: true,
                    fillColor: Color(0xFAFAFA),
                    hintText: 'search',
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ), // Change to your color
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 55),
              Expanded(
                child: ListView.separated(
                  itemCount: chats.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    return ListTile(
                      trailing: Text(
                        chat['time']!,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(chat['avatar']!),
                      ),
                      title: Text(chat['name']!),
                      subtitle: Text(chat['last']!),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatDetailView(
                              username: chat['name']!,
                              avatar: chat['avatar']!,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
