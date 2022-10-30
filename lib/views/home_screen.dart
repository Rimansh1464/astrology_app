import 'package:astrology_app/Providers/api_helper.dart';
import 'package:astrology_app/Providers/theme_provider.dart';
import 'package:astrology_app/utils/all.dart';
import 'package:astrology_app/utils/colors.dart';
import 'package:astrology_app/views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

List<String>? data;
late String apidata;

Apidata() async {
  apidata = await AstrologyApiHelper.astrologyApiHelper
      .todayData(AstrilogyName: "gemini", day: "today")
      .toString();
  // data = AstrologyApiHelper.horoscopeApiHelper.todayData(AstrilogyName: "gemini", day: "today");
  print("+++++++++++++++++++++++++++++++++++");
  print(apidata.length);
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  void initState() {
    Apidata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Provider.of<ThemeProvider>(context,listen: false).isDark == true ?primary:darkprimary,
      backgroundColor:
          Provider.of<ThemeProvider>(context, listen: false).primaryDark,

      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme();
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changDark();
                    print(
                        "${Provider.of<ThemeProvider>(context, listen: false).isDark}");
                  },
                  child: Icon(
                    Icons.menu_open_sharp,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                Spacer(),
                Switch(
                    activeColor: primary2,
                    inactiveTrackColor: darkprimary2,
                    value: Provider.of<ThemeProvider>(context, listen: false)
                        .isDark,
                    onChanged: (val) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changeTheme();
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changDark();
                    })
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "serch your astrology",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.2,
                        child: container(
                            image: AstrologyNameList[0]["image"],
                            name: AstrologyNameList[0]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.7,
                        child: container(
                            image: AstrologyNameList[1]["image"],
                            name: AstrologyNameList[1]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.6,
                        child: container(
                            image: AstrologyNameList[2]["image"],
                            name: AstrologyNameList[2]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.2,
                        child: container(
                            image: AstrologyNameList[3]["image"],
                            name: AstrologyNameList[3]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.7,
                        child: container(
                            image: AstrologyNameList[4]["image"],
                            name: AstrologyNameList[4]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.3,
                        child: container(
                            image: AstrologyNameList[5]["image"],
                            name: AstrologyNameList[5]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.5,
                        child: container(
                            image: AstrologyNameList[6]["image"],
                            name: AstrologyNameList[6]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.1,
                        child: container(
                            image: AstrologyNameList[7]["image"],
                            name: AstrologyNameList[7]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.4,
                        child: container(
                            image: AstrologyNameList[8]["image"],
                            name: AstrologyNameList[8]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.6,
                        child: container(
                            image: AstrologyNameList[9]["image"],
                            name: AstrologyNameList[9]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.5,
                        child: container(
                            image: AstrologyNameList[10]["image"],
                            name: AstrologyNameList[10]["name"]),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1.2,
                        child: container(
                            image: AstrologyNameList[11]["image"],
                            name: AstrologyNameList[11]["name"]),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget container({required String image, required String name}) {
    return InkWell(
      onTap: () async {
        apidata = await AstrologyApiHelper.astrologyApiHelper
            .todayData(AstrilogyName: name.toLowerCase(), day: "today")
            .toString();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      name: name,
                      image: image,
                    )));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              Provider.of<ThemeProvider>(context, listen: false).primaryDark3,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 16,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Provider.of<ThemeProvider>(context, listen: false)
                        .primaryDark3,
                    image: DecorationImage(scale: 5, image: AssetImage(image)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
