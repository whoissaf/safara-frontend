import 'package:flutter/material.dart';
import '../core/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  bool _isNotifEnabled = true;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          _buildSwitchTile('Theme', 'Dark Mode', _isDarkMode, (val) => setState(() => _isDarkMode = val)),
          _buildSwitchTile('Notification', 'Push Notifications', _isNotifEnabled, (val) => setState(() => _isNotifEnabled = val)),
          _buildDropdownTile('Language', ['English', 'Bahasa Indonesia'], _selectedLanguage, (val) {
            if (val != null) {
              setState(() => _selectedLanguage = val);
            }
          }),
          _buildActionTile('Privacy', 'Manage Data & Permissions', () {}),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String category, String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, borderRadius: BorderRadius.circular(AppRadius.md)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(category, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900)), Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))]),
          Switch(value: value, onChanged: onChanged, activeColor: NeoColors.primary),
        ],
      ),
    );
  }

  Widget _buildDropdownTile(String category, List<String> options, String value, ValueChanged<String?> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, borderRadius: BorderRadius.circular(AppRadius.md)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(category, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900)), Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))]),
          DropdownButton<String>(value: value, items: options.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _buildActionTile(String category, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, borderRadius: BorderRadius.circular(AppRadius.md)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(category, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900)), Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))]),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
