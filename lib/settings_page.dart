import 'package:flutter/material.dart';
import 'components/settings_menu_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SettingsMenuItem(
              title: 'Profil',
              icon: Icons.person_outline,
              onTap: () {
                print('Profil');
              },
            ),
            SettingsMenuItem(
              title: "Upozornenia",
              icon: Icons.notifications_none,
              onTap: () {
                print('Upozornenia');
              },
            ),
            SettingsMenuItem(
              title: "Súkromie",
              icon: Icons.shield_outlined,
              onTap: () {
                print('Súkromie');
              },
            ),
            SettingsMenuItem(
              title: "Vzhľad",
              icon: Icons.monitor_outlined,
              onTap: () {
                print('Vzhľad');
              },
            ),
            SettingsMenuItem(
              title: "O aplikácii",
              icon: Icons.info_outlined,
              onTap: () {
                print('O aplikácii');
              },
            ),
          ],
        ),
      ),
    );
  }
}