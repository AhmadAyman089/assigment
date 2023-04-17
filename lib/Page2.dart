import 'package:flutter/material.dart';
import 'Page3.dart';


class Page2 extends StatefulWidget {

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Boarding Space Types'), // Title 
      ),

    
      body: SafeArea(
      child:ListView.builder(
        itemCount: BoardingSpace.samples.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                 context,
                 MaterialPageRoute(
                  builder: (context) {
                      return PetBoardingPage(boardingSpace: BoardingSpace.samples[index]); // Send info to PetBoardingPage
                    },
                  ),
                );
              },
              child: _buildListItem(BoardingSpace.samples[index]),
            );
          },
        ),
      ),
    );
  }
}



  Widget _buildListItem(BoardingSpace boardingSpace) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(boardingSpace.imageUrl)),
          const SizedBox(
            height: 14.0,
          ),
          Text(
            boardingSpace.title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino',
            ),
          )
        ],
      ),
    ),
  );
}

// Boarding space details


class BoardingSpace {
  int petRate;
  
  List<Rate> rate;
  String title;
  String imageUrl;

  BoardingSpace(this.title, this.imageUrl,this.petRate,this.rate);
  // Show boarding space with rate value
  static List<BoardingSpace> samples = [    
    BoardingSpace('Basic Dog Boarding Space', 'assets/BasicBoardingDog.jpg',1,
    [
      Rate(20, 60, ),
    
    ]),  
    BoardingSpace('Luxury Dog Boarding Space', 'assets/LuxuryBoardingDog.jpg',1,
    [
      Rate(50, 150,),
     
    ]),  
    BoardingSpace('Basic Cat Boarding Space', 'assets/BasicBoardingCat.jpg',1,
    [
      Rate(15, 45,),
      
    ]), 
    BoardingSpace('Luxury Cat Boarding Space', 'assets/LuxuryBoardingCat.jpg',1,
    [
      Rate(30, 90,),
      
    ]), 
     ];
}
// Build StatelessWidget
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boarding Spaces'),
      ),
      body: ListView.builder(
        itemCount: BoardingSpace.samples.length,
        itemBuilder: (context, index) {
          return _buildListItem(context, BoardingSpace.samples[index]);
        },
      ),
    );
  }

  static Widget _buildListItem(BuildContext context, BoardingSpace space) {
    return ListTile(
      leading: Image.asset(
        space.imageUrl,
        fit: BoxFit.cover,
        width: 50.0,
        height: 50.0,
      ),
      title: Text(space.title),
    );
  }
}
// Class for rate
class Rate {
  double hoursRate;
  double daysRate;
  
  Rate(this.hoursRate, this.daysRate);
}
