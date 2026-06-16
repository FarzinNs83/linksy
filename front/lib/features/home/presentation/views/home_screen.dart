import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/core/utils/app_ext.dart';
import 'package:front/core/utils/shared_pref_manager.dart';
import 'package:front/core/widgets/network_image.dart';
import '../providers/home_providers.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/comment_bottom_sheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(getPostsProvider);
    final userId = SharedPref.instance.getString('userId') ?? '';
    final user = ref.watch(getUserProvider(userId));
    final name = user.maybeWhen(
      data: (user) => user.name,
      orElse: () => "Linksy User",
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Linksy'),
        centerTitle: true,
        actions: [AppSearchBar()],
      ),
      drawer: AppDrawer(name: name),
      body: Column(
        children: [
          _StoryBar(
            currentUserImage: user.maybeWhen(
              data: (u) => u.image,
              orElse: () => '',
            ),
            currentUserName: name,
            onStoryTap: () {},
            onAddStoryTap: () {},
          ),
          Divider(height: 1, color: context.colors.outlineVariant.withValues(alpha: 0.3)),
          Expanded(
            child: posts.when(
              data: (posts) {
                if (posts.isEmpty) {
                  return Center(
                    child: Text(
                      "No Posts Yet!",
                      style: context.textTheme.headlineMedium,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return Column(
                      children: [
                        SizedBox(
                          height: context.screenHeight * .55,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Center(
                                child: NetWorkImage(
                                  image: post.image,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              ),
                              Positioned(
                                left: 8,
                                top: 8,
                                child: Row(
                                  crossAxisAlignment: .start,
                                  children: [
                                    SizedBox(
                                      height: 56,
                                      width: 56,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(100),
                                        child: NetWorkImage(
                                          image: post.user.image,
                                          height: 56,
                                          width: 56,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        post.user.name,
                                        style: context.textTheme.bodyLarge!
                                            .copyWith(
                                              color: context.colors.onPrimary,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_vert_outlined,
                                    color: context.colors.onPrimary,
                                    size: 26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                  size: 32,
                                ),
                              ),
                              Text(
                                post.likes.toString(),
                                style: context.textTheme.labelMedium!.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              6.width,
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => CommentBottomSheet(
                                      comments: post.comments,
                                      postId: post.id,
                                    ),
                                  );
                                },
                                icon: Icon(Icons.comment_outlined, size: 32),
                              ),
                              Text(
                                post.commentCount.toString(),
                                style: context.textTheme.labelMedium!.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.bookmark_outline, size: 32),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                style: context.textTheme.labelLarge,
                                children: [
                                  TextSpan(
                                    text: post.user.name,
                                    style: context.textTheme.labelLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(text: ' :  '),
                                  TextSpan(text: post.title),
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        6.height,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                post.comments.isEmpty
                                    ? "No Comments Yet!"
                                    : post.comments.first.toString(),
                                style: context.textTheme.labelLarge,
                              ),
                              Text(
                                DateTime.now().toString(),
                                style: context.textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        24.height,
                      ],
                    );
                  },
                );
              },
              error: (err, stack) => Center(child: Text(err.toString())),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryBar extends StatelessWidget {
  final String currentUserImage;
  final String currentUserName;
  final VoidCallback onStoryTap;
  final VoidCallback onAddStoryTap;

  const _StoryBar({
    required this.currentUserImage,
    required this.currentUserName,
    required this.onStoryTap,
    required this.onAddStoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        children: [
          _YourStoryAvatar(
            imageUrl: currentUserImage,
            onTap: onAddStoryTap,
          ),
          const SizedBox(width: 12),
          ...List.generate(8, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: _StoryAvatar(
                imageUrl: '',
                name: 'User ${index + 1}',
                hasStory: index.isEven,
                onTap: onStoryTap,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _YourStoryAvatar extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const _YourStoryAvatar({
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade400,
                      Colors.grey.shade500,
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.surface,
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: colors.surfaceContainerHigh,
                    backgroundImage: imageUrl.isNotEmpty
                        ? NetworkImage(imageUrl)
                        : null,
                    child: imageUrl.isEmpty
                        ? Icon(Icons.person, size: 30, color: colors.onSurfaceVariant)
                        : null,
                  ),
                ),
              ),
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: colors.surface, width: 2),
                  ),
                  child: Icon(Icons.add, size: 14, color: colors.onPrimary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 68,
            child: Text(
              'Your story',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                color: colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryAvatar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool hasStory;
  final VoidCallback onTap;

  const _StoryAvatar({
    required this.imageUrl,
    required this.name,
    required this.hasStory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: hasStory
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.shade400,
                        Colors.pink.shade400,
                        Colors.orange.shade400,
                      ],
                    ),
                  )
                : BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.outline,
                  ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.surface,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: colors.surfaceContainerHigh,
                backgroundImage: imageUrl.isNotEmpty
                    ? NetworkImage(imageUrl)
                    : null,
                child: imageUrl.isEmpty
                    ? Icon(Icons.person, size: 30, color: colors.onSurfaceVariant)
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 68,
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                color: colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
