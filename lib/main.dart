import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/model/movie_model.dart';
import 'package:movie_ticket_booking_app/screens/Moviedetail_screen.dart';
import 'package:movie_ticket_booking_app/screens/grid_screen.dart';
import 'package:movie_ticket_booking_app/screens/mapscreen.dart';
import 'package:movie_ticket_booking_app/screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(), 
    MapScreen(),
    GridScreen(),
    Profile(),
  ];

  Widget CustomBottomNav() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff8E2DE2), Color(0xffFF6FD8)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
            },
            child: Icon(Icons.home, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
            },
            child: Icon(Icons.location_on, color: Colors.white),
          ),
          InkWell(
            onTap: (){
              setState(() {
                currentIndex = 2;
              });
            },
            child: Icon(Icons.grid_view, color: Colors.white)),
          InkWell(
            onTap: (){
              setState(() {
                currentIndex = 3;
              });
            },
            child: Icon(Icons.person, color: Colors.white,)),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            pages[currentIndex],
        
            Positioned(left: 0, right: 0, bottom: 0, child: CustomBottomNav()),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List movieslist = [];

  void getList() {
    List data = Movie().movieslist;
    setState(() {
      movieslist = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Color(0xff2B0A5A),
      body: Container(
        decoration: const BoxDecoration(
          // color: Color(0xff2B0A5A),
        ),

        child: Stack(
          children: [
            // BLUE GLOW
            Positioned(
              left: -400,
              top: -20.0,

              child: Container(
                width: 800,
                height: 800,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  gradient: RadialGradient(
                    colors: [
                      Color(0xff5DA9FF).withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // PINK GLOW
            Positioned(
              right: -400,
              bottom: -250,

              child: Container(
                width: 800,
                height: 800,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  gradient: RadialGradient(
                    colors: [
                      Color(0xffFF4FD8).withOpacity(0.4),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Choose Movie",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  color: Colors.white,
                                  size: 28,
                                ),

                                SizedBox(width: 10),

                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                      ),
                                      contentPadding: EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Icon(Icons.mic, color: Colors.white, size: 28.0),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: MoviesList(
                        "Now Playing",
                        movieslist.sublist(0, 4),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: MoviesList(
                        "Coming Soon",
                        movieslist.sublist(4, 9),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: MoviesList("Top Movie", movieslist.sublist(9)),
                    ),

                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget MoviesList(String title, List item) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),

      const SizedBox(height: 20),

      SizedBox(
        height: 180,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: item.length,
          itemBuilder: (contex, index) {
            return Container(
              width: 140,
              margin: EdgeInsets.only(right: 12),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(
                      contex, 
                      MaterialPageRoute(builder: (_)=> MoviedetailScreen(item: item[index]))
                    );
                  },
                  child: Ink.image(
                    image: NetworkImage(item[index]["img_url"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}


