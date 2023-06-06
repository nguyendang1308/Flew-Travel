import 'package:flew_travel/backend/blocs/user/user_bloc.dart';
import 'package:flew_travel/frontend/constants/dimensions.dart';
import 'package:flew_travel/package/package.dart';
import 'package:flew_travel/backend/models/user.dart' as model;

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({
    Key? key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserBloc _user = BlocProvider.of<UserBloc>(context, listen: false);
    print("Initial Refresh");
    await _user.refreshUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        //web screen
        return widget.webScreenLayout;
      }
      //mobile screen
      return widget.mobileScreenLayout;
    });
  }
}
