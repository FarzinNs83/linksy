import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  static const users = [
    {
      'name': 'Farzin',
      'username': 'feri',
      'image':
          'https://i.pravatar.cc/150?img=1',
    },
    {
      'name': 'Ali Ahmadi',
      'username': 'ali',
      'image':
          'https://i.pravatar.cc/150?img=2',
    },
    {
      'name': 'Sara Mohammadi',
      'username': 'sara',
      'image':
          'https://i.pravatar.cc/150?img=3',
    },
    {
      'name': 'Mohammad',
      'username': 'mmd',
      'image':
          'https://i.pravatar.cc/150?img=4',
    },
    {
      'name': 'Reza',
      'username': 'reza',
      'image':
          'https://i.pravatar.cc/150?img=5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      suggestionsBuilder: (context, controller) {
        final query = controller.text.trim().toLowerCase();
        if (query.isEmpty) {
          return users.map(
            (user) => ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  user['image']!,
                ),
              ),
              title: Text(user['name']!),
              subtitle: Text('@${user['username']}'),
            ),
          );
        }

        final results = users.where((user) {
          final name = user['name']!.toLowerCase();
          final username = user['username']!.toLowerCase();

          return name.contains(query) ||
              username.contains(query);
        }).toList();

        if (results.isEmpty) {
          return const [
            ListTile(
              leading: Icon(Icons.search_off),
              title: Text('No users found'),
            ),
          ];
        }

        return results.map(
          (user) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                user['image']!,
              ),
            ),
            title: Text(user['name']!),
            subtitle: Text('@${user['username']}'),
            onTap: () {
              controller.closeView(user['name']!);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Selected ${user['name']}',
                  ),
                ),
              );
            },
          ),
        );
      }, builder: (BuildContext context, SearchController controller) { 
        return IconButton(
          tooltip: "Open Search Bar",
          onPressed: () {
            controller.openView();
          },
          icon: Icon(Icons.search, size: 32, color: Theme.of(context).colorScheme.onSurface),
        );
       },
    );
  }
}