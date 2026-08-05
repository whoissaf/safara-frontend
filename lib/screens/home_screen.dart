import 'package:flutter/material.dart';
import '../core/constants.dart';
import 'home_tab.dart';
import 'map_tab.dart';
import 'report_tab.dart';
import 'notifications_tab.dart';
import 'profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const HomeTab(),
    const MapTab(),
    const ReportTab(),
    const NotificationsTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: _buildNavItem(Icons.home_rounded, 0),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem(Icons.map_rounded, 1),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                label: 'Report',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem(Icons.notifications_rounded, 3),
                label: 'Notif',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem(Icons.person_rounded, 4),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _currentIndex == index;
    return Icon(
      icon,
      size: 24,
      color: isSelected ? AppColors.primary : AppColors.textSecondary,
    );
  }
}
