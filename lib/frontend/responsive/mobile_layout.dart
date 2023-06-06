// ignore_for_file: unused_local_variable

import 'package:flew_travel/backend/blocs/user/user_bloc.dart';
import 'package:flew_travel/frontend/responsive/global_varible.dart';
import 'package:flew_travel/package/package.dart';
import 'package:flew_travel/backend/models/user.dart' as model;

class MobileLayout extends StatefulWidget {
  const MobileLayout();
  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final model.User? user = BlocProvider.of<UserBloc>(context).state.getUser;
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _page,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.add,
            ),
            label: 'Tin',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.peopleGroup,
            ),
            label: 'Bạn bè',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bell,
            ),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Tài khoản',
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
