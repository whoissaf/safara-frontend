import 'package:flutter/material.dart';
import '../core/constants.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.lg),
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Detail: Jakarta status updated to Yellow - Stay alert in crowded areas'), backgroundColor: NeoColors.primary, shape: RoundedRectangleBorder(side: NeoBorders.thin)))),
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.small, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Row(
                children: [
                  Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: NeoColors.accent, border: NeoBorders.thin), child: const Icon(Icons.notifications, size: 24)),
                  const SizedBox(width: AppSpacing.md),
                  const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('New Travel Advisory', style: TextStyle(fontWeight: FontWeight.w900)), SizedBox(height: 4), Text('Jakarta status updated to Yellow', style: TextStyle(fontSize: 12))])),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
