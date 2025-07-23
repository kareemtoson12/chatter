import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/app/styles/colros_manager.dart';
import 'package:social/app/styles/fonts.dart';
import 'package:social/app/theme_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeCubit>().state == ThemeMode.dark;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: ColorManager.getHomeGradient(context),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Settings',
                      style: AppTextStyles.splashTitleStyle().copyWith(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Icon(
                      Icons.dark_mode,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Dark Mode',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Switch(
                      value: isDarkMode,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        context.read<ThemeCubit>().toggleTheme(val);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _settingsItem(Icons.lock, 'Change Password', isDarkMode),
                _settingsItem(Icons.notifications, 'Notifications', isDarkMode),
                _settingsItem(Icons.language, 'Language', isDarkMode),
                _settingsItem(Icons.info_outline, 'About', isDarkMode),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _settingsItem(IconData icon, String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: isDark ? Colors.white : Colors.black),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
