import '../../package/package.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedPage(),
  const AddPostScreen(),
  const ChatPage(),
  Text('Four'),
  ProfilePage(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
