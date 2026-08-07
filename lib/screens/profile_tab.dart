import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'settings_screen.dart';
import 'bookmarks_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String _userName = 'Traveler';
  String _userEmail = 'traveler@safara.com';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await AuthService.getUser();
    if (user != null && mounted) {
      setState(() {
        _userName = user['name'] ?? 'Traveler';
        _userEmail = user['email'] ?? 'traveler@safara.com';
      });
    }
  }

  Future<void> _handleLogout() async {
    await AuthService.logout();
    if (mounted) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginScreen()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.hard, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Row(
                children: [
                  Container(width: 60, height: 60, decoration: BoxDecoration(color: NeoColors.primary, border: NeoBorders.thick, shape: BoxShape.circle), child: const Icon(Icons.person, color: NeoColors.surface, size: 32)),
                  const SizedBox(width: AppSpacing.lg),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(_userName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)), SizedBox(height: 4), Text(_userEmail, style: const TextStyle(fontSize: 14))])),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _buildMenuItem(Icons.bookmark, 'Bookmarks', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BookmarksScreen()))),
            const SizedBox(height: AppSpacing.md),
            _buildMenuItem(Icons.settings, 'Settings', () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()))),
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: NeoColors.red, foregroundColor: NeoColors.surface),
                onPressed: _handleLogout,
                child: const Text('LOGOUT'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.small, borderRadius: BorderRadius.circular(AppRadius.md)),
        child: Row(children: [Icon(icon, size: 28), const SizedBox(width: AppSpacing.md), Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16))), const Icon(Icons.chevron_right)]),
      ),
    );
  }
}
