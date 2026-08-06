import 'package:flutter/material.dart';
import '../core/constants.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

  final List<Map<String, String>> _timeline = const [
    {'date': '02-08-2026 23:25', 'type': 'Community Report', 'status': 'Submitted'},
    {'date': '02-08-2026 23:30', 'type': 'Moderator Approval', 'status': 'Verified'},
    {'date': '02-08-2026 23:35', 'type': 'Attestation', 'status': 'On-chain'},
    {'date': '02-08-2026 23:40', 'type': 'AI Analysis', 'status': 'Generated'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Detail'), leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Monas, Jakarta', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
            const SizedBox(height: AppSpacing.lg),
            
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(color: NeoColors.yellow, border: NeoBorders.thick, boxShadow: NeoShadows.hard, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Row(
                children: [
                  Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, shape: BoxShape.circle), child: const Icon(Icons.warning_amber, size: 32)),
                  const SizedBox(width: AppSpacing.lg),
                  const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('ATTENTION LEVEL', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
                    SizedBox(height: 4),
                    Text('Yellow - Need Attention', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                    Text('Confidence: 40%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  ])),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.small, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: NeoColors.primary, border: NeoBorders.thin), child: const Icon(Icons.lightbulb, color: NeoColors.surface, size: 20)), const SizedBox(width: AppSpacing.md), const Text('RECOMMENDATION', style: TextStyle(fontWeight: FontWeight.w900))]),
                const SizedBox(height: AppSpacing.md),
                const Text('Stay Alert', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: NeoColors.primary)),
                const SizedBox(height: AppSpacing.sm),
                const Text('Keep your belongings secure and stay aware of your surroundings.'),
              ]),
            ),
            const SizedBox(height: AppSpacing.lg),

            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(color: NeoColors.accent, border: NeoBorders.thick, boxShadow: NeoShadows.small, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: NeoColors.black, border: NeoBorders.thin), child: const Icon(Icons.auto_awesome, color: NeoColors.accent, size: 20)), const SizedBox(width: AppSpacing.md), const Text(' AI EXPLANATION', style: TextStyle(fontWeight: FontWeight.w900))]),
                const SizedBox(height: AppSpacing.md),
                const Text('Berdasarkan analisis evidence yang terverifikasi:\n\n• Single Community Report (Bobot: 30)\n\nRekomendasi Sistem: Stay Alert\n\nCatatan: Keputusan akhir perjalanan tetap berada di tangan Anda.', style: TextStyle(fontSize: 14, height: 1.5)),
              ]),
            ),
            const SizedBox(height: AppSpacing.lg),

            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.small, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Row(
                children: [
                  Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: NeoColors.green, border: NeoBorders.thick, shape: BoxShape.circle), child: const Icon(Icons.verified, color: NeoColors.surface, size: 28)),
                  const SizedBox(width: AppSpacing.lg),
                  const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('VERIFIED BY ATTESTCOIN', style: TextStyle(fontWeight: FontWeight.w900)),
                    SizedBox(height: 4),
                    Text('Data ini telah diverifikasi secara kriptografis.', style: TextStyle(fontSize: 12)),
                  ])),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            const Text('EVIDENCE TIMELINE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.small, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Column(
                children: List.generate(_timeline.length, (index) {
                  final event = _timeline[index];
                  final isLast = index == _timeline.length - 1;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(width: 12, height: 12, decoration: BoxDecoration(color: NeoColors.primary, shape: BoxShape.circle, border: NeoBorders.thin)),
                          if (!isLast) Container(width: 2, height: 40, color: NeoColors.black),
                        ],
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(event['type']!, style: const TextStyle(fontWeight: FontWeight.w900)),
                              Text(event['date']!, style: const TextStyle(fontSize: 12, color: NeoColors.text)),
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(color: NeoColors.accent, border: NeoBorders.thin),
                                child: Text(event['status']!, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
