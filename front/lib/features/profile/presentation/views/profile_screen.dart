import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_ext.dart';
import '../../../../gen/assets.gen.dart';

class ProfileScreen extends ConsumerWidget {
   const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = List.generate(12, (_) => Assets.png.profile.path);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 8,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              Text(
                "john_doe",
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colors.onPrimary,
                ),
              ),
              Icon(Icons.verified, size: 18, color: Colors.blue.shade500),
            ],
          ),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),

        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Top section
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// Avatar + ring
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple.shade400,
                                Colors.pink.shade400,
                                Colors.orange.shade400,
                              ],
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.colors.surface,
                            ),
                            child: CircleAvatar(
                              radius: 42,
                              backgroundImage: AssetImage(
                                Assets.png.profile.path,
                              ),
                            ),
                          ),
                        ),

                        24.width,

                        /// Stats
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [
                              _IGStat(value: "32", label: "Posts"),
                              _IGStat(value: "1.2K", label: "Followers"),
                              _IGStat(value: "180", label: "Following"),
                            ],
                          ),
                        ),
                      ],
                    ),

                    14.height,

                    /// Name + Bio
                    Text(
                      "John Doe",
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    4.height,
                    Text(
                      "Digital creator",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.blueGrey,
                      ),
                    ),
                    6.height,
                    Text(
                      "Building clean Flutter apps ✨\nUI lover • Riverpod • Mobile Dev",
                      style: context.textTheme.bodyMedium,
                    ),
                    6.height,
                    Text(
                      "github.com/johndoe",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    14.height,

                    /// Buttons
                    Row(
                      children: [
                        Expanded(
                          child: _ProfileActionButton(
                            text: "Edit profile",
                            onTap: () {},
                          ),
                        ),
                         SizedBox(width: 8),
                        Expanded(
                          child: _ProfileActionButton(
                            text: "Links",
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                TabBar(
                  indicatorColor: context.colors.onSurface,
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on)),
                    Tab(icon: Icon(Icons.video_collection_outlined)),
                    Tab(icon: Icon(Icons.person_pin_outlined)),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              _PostsGrid(posts: posts),
               Center(child: Text("Reels")),
               Center(child: Text("Tagged")),
            ],
          ),
        ),
      ),
    );
  }
}

class _IGStat extends StatelessWidget {
  final String value;
  final String label;

   _IGStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

class _ProfileActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

   _ProfileActionButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: context.colors.secondaryContainer.withValues(
            alpha: .4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

class _StoryHighlight extends StatelessWidget {
  final String label;
  final String imagePath;

   _StoryHighlight({required this.label, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:  EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
         SizedBox(height: 6),
        SizedBox(
          width: 64,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class _PostsGrid extends StatelessWidget {
  final List<String> posts;

   _PostsGrid({required this.posts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:  EdgeInsets.only(top: 2),
      itemCount: posts.length,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Image.asset(posts[index], fit: BoxFit.cover);
      },
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

   _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) {
    return false;
  }
}
