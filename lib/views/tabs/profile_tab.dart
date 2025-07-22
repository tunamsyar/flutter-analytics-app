import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Stubbed user data
    final user = {
      'photoURL': "https://picsum.photos/200",
      'displayName': 'John Doe',
      'email': 'john.doe@example.com',
      'lastSignIn': DateTime.now().subtract(const Duration(days: 1)),
    };

    ImageProvider? buildProfileImage(String? photoURL) {
      if (photoURL == null || photoURL.isEmpty) return null;
      return NetworkImage(photoURL);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: buildProfileImage(
                        user['photoURL'] as String?,
                      ),
                      child: user['photoURL'] == null
                          ? Icon(
                              MdiIcons.account,
                              size: 50,
                              color: Theme.of(context).colorScheme.onSurface,
                            )
                          : null,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user['displayName'] as String,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user['email'] as String,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Last sign in: ${_formatDate(user['lastSignIn'] as DateTime)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(MdiIcons.bell),
                    title: const Text('Notifications'),
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(MdiIcons.palette),
                    title: const Text('Theme'),
                    trailing: Icon(MdiIcons.chevronRight),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(MdiIcons.security),
                    title: const Text('Privacy & Security'),
                    trailing: Icon(MdiIcons.chevronRight),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(MdiIcons.helpCircle),
                    title: const Text('Help & Support'),
                    trailing: Icon(MdiIcons.chevronRight),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showSignOutDialog(context),
                icon: Icon(MdiIcons.logout),
                label: const Text('Sign Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  foregroundColor: Theme.of(context).colorScheme.onError,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Stubbed sign-out logic
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Signed out')));
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
