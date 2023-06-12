import 'package:flew_travel/backend/models/chat.dart';
import 'package:flew_travel/package/package.dart';
import 'package:intl/intl.dart';

class ChatCard extends StatelessWidget {
  ChatCard({super.key, required this.chats});

  //For Demo
  Chat chats;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(chats.icon),
      ),
      title: Text(
        chats.user,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.done_all),
          SizedBox(
            width: 3,
          ),
          Text(
            chats.currentMessage,
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
      trailing: Text("${DateFormat.jm().format(DateTime.now())}"),
    );
  }
}
