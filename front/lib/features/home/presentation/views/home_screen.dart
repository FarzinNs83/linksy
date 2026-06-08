import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/core/utils/app_ext.dart';
import 'package:front/core/widgets/network_image.dart';
import '../../../../core/utils/json_log.dart';
import '../providers/home_providers.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/comment_bottom_sheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(getPostsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Linksy'),
        centerTitle: true,
        actions: [AppSearchBar()],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: posts.when(
              data: (posts) {
                jsonLog(posts);
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
