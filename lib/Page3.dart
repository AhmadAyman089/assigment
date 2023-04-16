import 'package:flutter/material.dart';
import 'Page2.dart';

class PetBoardingPage extends StatefulWidget {
  final BoardingSpace boardingSpace;

  const PetBoardingPage({Key? key, required this.boardingSpace})
      : super(key: key);

  @override
  _PetBoardingPageState createState() => _PetBoardingPageState();
}

class _PetBoardingPageState extends State<PetBoardingPage> {

  

  double _hours = 0;
  int _days = 0;
  double _hourlyRate = 10;
  double _dailyRate = 60;
  double _totalRate = 0;
  String _discountCode = '';
  double _discountPercentage = 0;
  double _totalPayment = 0;
  bool _isRatingGiven = false;
  int _userRating = 0;


  @override
  void initState() {
    super.initState();
    if (widget.boardingSpace.rate.isNotEmpty) {
      _hourlyRate = widget.boardingSpace.rate[0].hoursRate;
      _dailyRate = widget.boardingSpace.rate[0].daysRate;
    }
  }

  void _updateTotalPayment() {
    setState(() {
      double totalHoursRate = _hourlyRate * _hours;
      double totalDaysRate = _dailyRate * _days;
      double totalRate = totalHoursRate + totalDaysRate;
      double discountAmount = totalRate * (_discountPercentage / 100);
      _totalPayment = totalRate - discountAmount;
    });
  }

  void _applyDiscountCode(String discountCode) {
    // Simulating discount code validation
    if (discountCode == 'CATDOG25') {
      setState(() {
        _discountPercentage = 25;
        _totalPayment = _totalRate * (1 - (_discountPercentage / 100));
        _discountCode = discountCode;
      });
    } else {
      setState(() {
        _discountPercentage = 0;
        _totalPayment = _totalRate * (1 - (_discountPercentage / 100));
        _discountCode = '';
      });
    }
  }

  void _submitRating(int rating) {
    setState(() {
      _userRating = rating;
      _isRatingGiven = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.boardingSpace.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              widget.boardingSpace.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Pet Space: 1 space',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Hourly Rate: \$$_hourlyRate',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Daily Rate: \$$_dailyRate',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32.0),
            Text(
              'Boarding Details:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Select Hours: $_hours Hours',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _hours,
              onChanged: (value) {
                setState(() {
                  _hours = value;
                  _updateTotalPayment();
                });
              },
              min: 0,
              max: 24,
              divisions: 24,
              label: _hours.toStringAsFixed(0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Select Days: $_days days',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _days.toDouble(),
              onChanged: (value) {
                setState(() {
                  _days = value.toInt();
                  _updateTotalPayment();
                });
              },
              min: 0,
              max: 7,
              divisions: 7,
              label: _days.toString(),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  _applyDiscountCode(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Discount Code',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Discount: $_discountPercentage%',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Discounted Total Payment: \$${_totalPayment.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32.0),
            Text(
              'Rating:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _isRatingGiven
                ? Text(
                    'Thank you for your rating: $_userRating',
                    style: TextStyle(fontSize: 18),
                  )
                : Column(
                    children: [
                      Text(
                        'Please give us your rating:',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.star),
                            onPressed: () {
                              _submitRating(1);
                            },
                            color: Colors.yellow,
                          ),
                          IconButton(
                            icon: Icon(Icons.star),
                            onPressed: () {
                              _submitRating(2);
                            },
                            color: Colors.yellow,
                          ),
                          IconButton(
                            icon: Icon(Icons.star),
                            onPressed: () {
                              _submitRating(3);
                            },
                            color: Colors.yellow,
                          ),
                          IconButton(
                            icon: Icon(Icons.star),
                            onPressed: () {
                              _submitRating(4);
                            },
                            color: Colors.yellow,
                          ),
                          IconButton(
                            icon: Icon(Icons.star),
                            onPressed: () {
                              _submitRating(5);
                            },
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
