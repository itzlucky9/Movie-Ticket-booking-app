import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/screens/seat_screen.dart';
import 'package:movie_ticket_booking_app/screens/widgets/dates_card.dart';
import 'package:movie_ticket_booking_app/screens/widgets/time_card.dart';

class MoviedetailScreen extends StatefulWidget {
  const MoviedetailScreen({super.key, required this.item});

  final item;

  @override
  State<MoviedetailScreen> createState() => _MoviedetailScreenState();
}

class _MoviedetailScreenState extends State<MoviedetailScreen> {

  int selectedIndex = 0;
  int selectedtimeIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    final selectedDate = widget.item["dates"][selectedIndex];

    return Scaffold(
      backgroundColor: Color(0xff2B0A5A),
      body: Stack(
        children: [
          Positioned(
            left: -400,
            top: -20,
            child: Container(
              height: 800,
              width: 800,
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

          Positioned(
            right: -400,
            bottom: -250,
            child: Container(
              height: 800,
              width: 800,

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

          SizedBox(
            height: height * 0.34,
            child: Stack(
              children: [
                Image.network(
                  widget.item["img_url"],
                  width: double.infinity,
                  height: height * 0.34,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: height * 0.34,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),


          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 1
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 15
                              )
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back,
                              size: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),


                      InkWell(
                        onTap: (){
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.15),
                            border: Border.all(
                              color: Colors.white,
                              width: 1
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 15,
                              )
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),


                  Spacer(),
                  Text(
                    widget.item["name"],
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  SizedBox(height: height * 0.01),

                  Text(
                    widget.item["content_desc"],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: height * 0.04,),

                  const Text(
                    "Select Date and Time",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w900
                    ),
                  ),

                  SizedBox(height: height * 0.04,),

                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      itemCount: widget.item["dates"].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){

                        double top = 0;
                        if(index==0) top = 20;
                        if(index==1) top = 10;
                        if(index==2) top = 0;
                        if(index==3) top = 10;
                        if(index==4) top = 20;

                        return Padding(
                          padding: EdgeInsets.only(
                            top: top,
                            right: 24,
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Ink(
                              child: DatesCard(widget.item["dates"][index], selectedIndex == index)
                            )
                          ),
                        );
                      }
                    ),
                  ),



                  SizedBox(height: height * 0.03,),

                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedDate["times"].length,
                      itemBuilder: (context,index){

                        double top = 0;

                        if(index==0) top = 30;
                        if(index==1) top = 15;
                        if(index==2) top = 0;
                        if(index==3) top = 15;
                        if(index==4) top = 30;
                        return Padding(
                          padding: EdgeInsets.only(
                            top: top,
                            right: 24,
                          ),
                          child: InkWell(
                            onTap: (){
                              selectedtimeIndex = index;
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(14),
                            child: TimeCard(selectedDate["times"][index],selectedtimeIndex == index)
                          ),
                        );
                      }),
                  ),

                  SizedBox(height: height * 0.03,),

                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent
                      ),
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (_)=> SeatScreen(
                            movie: widget.item, 
                            date: selectedDate, 
                            time: selectedDate["times"][selectedIndex],)
                          )
                        );
                      },
                      child: Text(
                        "Reservation",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ),
                  ),

                  SizedBox(height: height * 0.01,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
