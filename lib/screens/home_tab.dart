import 'package:flutter/material.dart';
import '../core/constants.dart';
import 'location_detail_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  final List<Map<String, dynamic>> _trendingLocations = const [
    {'name': 'Monas, Jakarta', 'level': 'Yellow', 'color': AppColors.yellow},
    {'name': 'Bundaran HI', 'level': 'Green', 'color': AppColors.green},
    {'name': 'Kota Tua', 'level': 'Orange', 'color': AppColors.orange},
    {'name': 'Malioboro', 'level': 'Green', 'color': AppColors.green},
    {'name': 'Pantai Kuta', 'level': 'Yellow', 'color': AppColors.yellow},
    {'name': 'Borobudur', 'level': 'Green', 'color': AppColors.green},
    {'name': 'Puncak Bogor', 'level': 'Orange', 'color': AppColors.orange},
    {'name': 'Ancol Jakarta', 'level': 'Red', 'color': AppColors.red},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth - (AppSpacing.lg * 3)) / 2;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Traveler',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            Text(
              'Safara',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchBar(context),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildSectionTitle(context, 'Trending Locations'),
                    const SizedBox(height: AppSpacing.lg),
                    _buildTrendingLocations(context, cardWidth),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildSectionTitle(context, 'Latest Advisory'),
                    const SizedBox(height: AppSpacing.lg),
                    GestureDetector(
                      onTap: () {},
                      child: _buildLatestAdvisory(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppBorderRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search location...',
          prefixIcon: Icon(Icons.search_rounded),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
        ),
      ),
    );
  }
  
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: () {},
          child: const Text('See All'),
        ),
      ],
    );
  }
  
  Widget _buildTrendingLocations(BuildContext context, double cardWidth) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: cardWidth / 240,
        crossAxisSpacing: AppSpacing.lg,
        mainAxisSpacing: AppSpacing.lg,
      ),
      itemCount: _trendingLocations.length,
      itemBuilder: (context, index) {
        final location = _trendingLocations[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LocationDetailScreen()),
            );
          },
          child: _buildLocationCard(context, location),
        );
      },
    );
  }
  
  Widget _buildLocationCard(BuildContext context, Map<String, dynamic> location) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppBorderRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: (location['color'] as Color).withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppBorderRadius.lg),
                ),
              ),
              child: Icon(
                Icons.location_on_rounded,
                size: 60,
                color: location['color'] as Color,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location['name'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.xs),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: (location['color'] as Color).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppBorderRadius.sm),
                  ),
                  child: Text(
                    '${location['level']} - Attention',
                    style: TextStyle(
                      color: location['color'] as Color,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildLatestAdvisory(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppBorderRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.yellow.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppBorderRadius.md),
                ),
                child: const Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.yellow,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Travel Advisory',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Jakarta, Indonesia',
                      style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textTertiary,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const Text(
            'Stay alert in crowded areas. Recent reports of petty theft in tourist zones.',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
