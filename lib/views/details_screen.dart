import 'package:astrology_app/Providers/api_helper.dart';
import 'package:astrology_app/Providers/theme_provider.dart';
import 'package:astrology_app/model/astrology_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.name, required this.image})
      : super(key: key);
  String name;
  String image;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    DateTime dateToday = new DateTime.now();
    print(dateToday.day);
  }

  DateTime dateToday = new DateTime.now();
  bool yesterday = false;
  bool today = true;
  bool tommorow = false;
  String day = "today";

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor:
          Provider.of<ThemeProvider>(context, listen: false).primaryDark,
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Icon(Icons.arrow_back),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2)),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "${widget.name}",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        yesterday = true;
                        today = false;
                        tommorow = false;
                        day = "yesterday";
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: (yesterday == true)
                            ? Color(0xff7b96c7)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 2, color: Colors.grey)
                        ],
                      ),
                      child: (yesterday == true)
                          ? Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${dateToday.day - 1}/${dateToday.month}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "Yesterday",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ))
                          : Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${dateToday.day - 1}/${dateToday.month}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Text(
                                  "Yesterday",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )
                              ],
                            )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        yesterday = false;
                        today = true;
                        tommorow = false;
                        day = "today";
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: (today == true)
                            ? Provider.of<ThemeProvider>(context, listen: false)
                                .primaryDark1
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 2, color: Colors.grey)
                        ],
                      ),
                      child: (today == true)
                          ? Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${dateToday.day}/${dateToday.month}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "Today",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ))
                          : Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${dateToday.day}/${dateToday.month}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Text(
                                  "Today",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )
                              ],
                            )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        yesterday = false;
                        today = false;
                        tommorow = true;
                        day = "tomorrow";
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: (tommorow == true)
                            ? Color(0xff7b96c7)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 2, color: Colors.grey)
                        ],
                      ),
                      child: (tommorow == true)
                          ? Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${dateToday.day + 1}/${dateToday.month}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "Tommorow",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ))
                          : Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${dateToday.day + 1}/${dateToday.month}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Text(
                                  "Tommorow",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )
                              ],
                            )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              widget.image,
              scale: 3,
              color: Provider.of<ThemeProvider>(context, listen: false)
                  .primaryDark1,
            ),
            Container(
              height: 320,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffb7cdf4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: FutureBuilder(
                  future: AstrologyApiHelper.astrologyApiHelper
                      .todayData(AstrilogyName: widget.name, day: day),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      AstrologyData? data = snapshot.data;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${data?.date}",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("${data?.description}")
                          ],
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
