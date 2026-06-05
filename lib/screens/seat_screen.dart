import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/screens/widgets/forRow.dart';



class SeatScreen extends StatefulWidget {
  const SeatScreen({
    required this.movie,
    required this.date,
    required this.time,
    super.key,
  });

  final movie;
  final date;
  final time;

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  List<bool> seats = List.generate(40, (index) => false);

  // For Reserved Seat 
  List<int> reservedSeat = [0,1,3,4,11,12,15,16,17,36,37,38,39];

  late String date;
  late String time;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = "${widget.date["day"]}, ${widget.date["date"]}, 2026";
    time = widget.time.toString();
  }

  @override
  Widget build(BuildContext context) {

    // length ke liye or arrow function to ab tu smjh hi gya hoga ki ye => to retun ke liye hai or ye true or false return krte hai but where true hi rkhta hai 

    int selectedCount = seats.where((seat)=>seat).length;

    int seatprice = 10;
    int totalPrice = selectedCount * seatprice;

    List<int> selectedSeats = [];

    for(int i =0; i<seats.length; i++){
      if(seats[i]){
        selectedSeats.add(i+1);
      }
    }

    return Scaffold(
      backgroundColor: Color(0xff2B0A5A),
      body: SingleChildScrollView(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: Colors.white, width: 1.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                      
                          const Text(
                            "Choose Seats",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                      
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.white,
                                width: 1
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 50,),
        
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: seats.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context,index){
                          bool isReserved = reservedSeat.contains(index);
                          bool isSelected = seats[index];
                          return InkWell(
                            onTap : isReserved ? null : (){
                              setState(() {
                                seats[index] = !seats[index];
                              });
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: Image.asset(
                                "assets/images/Seat.png",
                                color: isReserved ? Colors.pinkAccent : isSelected ? Colors.cyanAccent : Colors.white,
                              ),
                            ),
                          );
                        }
                      ),
        
                      const SizedBox(height: 20,),
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ForRow("Available", Colors.white),
                          ForRow("Reserved", Colors.pinkAccent),
                          ForRow("Selected", Colors.cyanAccent)
                        ],
                      ),


                      const SizedBox(height: 16,),
        
        
                      // Bottom Panel
        
                      AnimatedOpacity(
                        opacity: selectedCount > 0 ? 1 : 0,
                        duration: Duration(milliseconds: 300),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff5E35B1),
                                Color(0xff9C27B0)
                              ]
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_sharp,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  const SizedBox(width: 8,),
                                
                                  Text(
                                    "${date}  •  ${time} ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white
                                    ),
                                  ),
                                
                                ],
                              ),
                                
                              const SizedBox(height: 16,),
                                
                                
                              Row(
                                children: [
                                  Icon(
                                    Icons.event_seat,
                                    color: Colors.blueGrey,
                                    size: 22,
                                  ),
                                
                                  const SizedBox(width: 8,),
                                
                                  Text(
                                    "Seat  •  ${selectedSeats.join(", ")}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                                
                              const SizedBox(height: 16,),
                                
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.confirmation_num,
                                    size: 22,
                                    color: Colors.redAccent,
                                  ),
                                
                                  const SizedBox(width: 8,),
                                
                                  Text(
                                    "Total: \$$totalPrice",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                                
                              const SizedBox(height: 16,),
                                
                              SizedBox(
                                height: 38,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: (){}, 
                                  child: Text("Buy")
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              )
            ],
        ),
      ),
    );
  }
}