import 'package:flew_travel/frontend/pages/profile_page.dart';

import '../../package/package.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedPage(),
  const AddPostScreen(),
  Text('Three'),
  Text('Four'),
  ProfilePage(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
