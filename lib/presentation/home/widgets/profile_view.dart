import 'package:flutter/material.dart';
import 'package:social/app/styles/colros_manager.dart';
import 'package:social/app/styles/fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      // No appBar
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: ColorManager.getHomeGradient(context),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      'Profile',
                      style: AppTextStyles.splashTitleStyle().copyWith(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                SizedBox(height: 24),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/static_user.png'),
                ),
                SizedBox(height: 24),
                Text(
                  'Logan Smith',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'logan.smith@email.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white : Colors.grey[700],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '+1 234 567 8901',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white : Colors.grey[700],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'New York, USA',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white : Colors.grey[700],
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStat('Posts', '120', isDark),
                    SizedBox(width: 32),
                    _buildStat('Followers', '2.5K', isDark),
                    SizedBox(width: 32),
                    _buildStat('Following', '180', isDark),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  'Bio: Flutter enthusiast. Love coding, coffee, and cats.\nBuilding awesome apps one widget at a time!',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? Colors.blueGrey[900] : null,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value, bool isDark) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.white : Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
