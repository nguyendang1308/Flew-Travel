class Chat {
  String user;
  String icon;
  DateTime time;
  String currentMessage;
  Chat({
    required this.user,
    required this.icon,
    required this.time,
    required this.currentMessage,
  });

  @override
  String toString() {
    return 'Chat(user: $user, icon: $icon, time: $time, currentMessage: $currentMessage)';
  }
}
