import 'package:flew_travel/backend/models/chat.dart';
import 'package:flew_travel/frontend/pages/individual_page.dart';
import 'package:flew_travel/package/package.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  //Data Demo
  List<Chat> chatsData = [
    Chat(
      user: "Nguyên Đặng",
      icon:
          "https://images.unsplash.com/photo-1686174099917-325c70c29206?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80",
      time: DateTime.now(),
      currentMessage: "hehe",
    ),
    Chat(
      user: "Thánh Thiện",
      icon:
          "https://plus.unsplash.com/premium_photo-1686090450574-214118216bdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80",
      time: DateTime.now(),
      currentMessage: "Chào bạn tui",
    ),
    Chat(
      user: "Bao Chan",
      icon:
          "https://images.unsplash.com/photo-1686248830847-52afb9109c4c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80",
      time: DateTime.now(),
      currentMessage: "Chào bạn tui",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.support_agent,
            color: Colors.white,
          ),
        ),
        title: Text("Trò chuyện"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.note_rounded),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "Đoạn Chat",
            ),
            Tab(
              text: "Cuộc gọi",
            ),
            Tab(
              text: "Bạn bè",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _chatBuild(context),
          _chatBuild(context),
          _chatBuild(context),
        ],
      ),
    );
  }

  Widget _chatBuild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                print("Hehe");
              },
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Tìm kiếm"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chatsData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: IndividualPage(chats: chatsData[index]),
                        type: PageTransitionType.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                      ),
                    );
                  },
                  child: ChatCard(
                    chats: chatsData[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
