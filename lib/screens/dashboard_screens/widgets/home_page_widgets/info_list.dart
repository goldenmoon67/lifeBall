import 'package:flutter/material.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InfoList extends StatefulWidget {
  const InfoList({Key? key}) : super(key: key);

  @override
  State<InfoList> createState() => _InfoListState();
}

class _InfoListState extends State<InfoList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextStyle textStyle = const TextStyle(color: Colors.white);
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                _getContainer1(),
                _getContainer2(),
                _getContainer3()
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.blueAccent,
            tabs: const [
              Tab(
                child: Text(
                  "-",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "-",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "-",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _getContainer1() {
    return Container(
      height: 200,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Text(
                  "Hal??saha m?? ar??yorsun?",
                  style: textStyle,
                )),
                Expanded(child: Text("Tak??m??n m?? eksik?", style: textStyle)),
                Expanded(child: Text("Rakip mi ar??yorsun?", style: textStyle)),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          var box = Hive.box("userbox");
                          box.clear();
                          box.put(
                              "KnNmQaqT7i8lDv0LrRwD",
                              MyUser(
                                  "KnNmQaqT7i8lDv0LrRwD",
                                  "Mirac Altinay",
                                  "m@altinay",
                                  "123456",
                                  "https://firebasestorage.googleapis.com/v0/b/halisahaapp.appspot.com/o/user_profile_image%2FKnNmQaqT7i8lDv0LrRwD?alt=media&token=cb944115-5847-4b2a-b395-0197a0431803",
                                  "city",
                                  "town"));
                        },
                        child: const Text("??lanlar?? G??r")))
              ],
            ),
          ),
          Expanded(child: Image.asset("assets/images/abc.png")),
        ],
      ),
    );
  }

  _getContainer2() {
    return Container(
      height: 200,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child:
                  Text("Arkada??lar??n?? Uygulamaya davet et", style: textStyle),
            ),
            Expanded(
              child: Text("Tak??m?? G????lendir", style: textStyle),
            ),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Davet Et")))
          ],
        ),
      ),
    );
  }

  _getContainer3() {
    return Container(
      height: 200,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.teal.shade300),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text("Sana en yak??n ilanlar i??in konumunu a??",
                  style: textStyle),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 95,
                    width: 45,
                    child: Text(
                        "Konum bilginle yak??n??ndaki hal??sahalar??, futbolcular??, tak??mlar?? bulabilirsin.",
                        style: textStyle),
                  ),
                ),
                Expanded(child: Image.asset("assets/images/abc.png"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
