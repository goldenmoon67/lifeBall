import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/hive_services/hive_service.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:halisaha_app/screens/helper_secreens/my_info_screens/edit_profile_screen.dart';

import '../../../../constants/login_constants.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    MyUser _currentUser = HiveService.readCurrentUser();
    return Column(
      children: <Widget>[
        Stack(
          children: [
            Image.asset(
              "assets/images/back_myProfile.jpg",
              fit: BoxFit.contain,
              height: 300,
              width: double.infinity,
            ),
            Positioned(
              top: 150,
              right: 130,
              left: 130,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 10))
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_currentUser.imageUrl),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(_currentUser.name.toString(),
            style: LoginConstants.loginTextStyle),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          child: const Text(
            "Profili D??zenle",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditProfilePage())).then(
              (value) {
                setState(() {});
              },
            );
          },
        ),
        getEvents(),
      ],
    );
  }

  Expanded getEvents() {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          buildEvent(
            "Tak??mlar??m",
            Colors.red.shade400,
            Icons.add_to_home_screen_rounded,
            context,
          ),
          buildEvent(
            "Ma??lar??m",
            Colors.orange.shade400,
            Icons.h_mobiledata_sharp,
            context,
          ),
          buildEvent(
            "??zelliklerim",
            Colors.blue.shade400,
            Icons.analytics_outlined,
            context,
          ),
          buildEvent(
            "Ba??ar??lar??m",
            Colors.lightGreenAccent.shade400,
            Icons.gamepad,
            context,
          ),
        ],
      ),
    );
  }

  GestureDetector buildEvent(
      String text, Color color, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (text) {
          case "Tak??mlar??m":
            Navigator.pushNamed(context, "/MyTeamsScreen");
            break;
          case "??zelliklerim":
            Navigator.pushNamed(context, "/MyFeaturesScreen");
            break;
          case "Ma??lar??m":
            Navigator.pushNamed(context, "/MyMatchesScreen");
            break;
          case "Ma?? Bul":
            Navigator.pushNamed(context, "/FindMatchSinglePlayerScreen");
            break;
          default:
            const AlertDialog(
              title: Text("Hata"),
              content: Text(
                  "Ula??maya ??al????t??????n??z sayfa ??uanda kullan??mda de??ildir."),
            );
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        color: color,
      ),
    );
  }
}
