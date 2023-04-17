import 'package:flutter/material.dart';

import 'Page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  // Back ground colour and Title
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Boarding Form',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: PetBoardingForm(),
    );
  }
}

class PetBoardingForm extends StatefulWidget {
  const PetBoardingForm({Key? key}) : super(key: key);

  @override
  PetBoardingFormState createState() => PetBoardingFormState();
}

class PetBoardingFormState extends State<PetBoardingForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController petTypeController = TextEditingController();
  final TextEditingController petAgeController = TextEditingController();
  DateTime checkInDate = DateTime.now();
  TimeOfDay checkInTime = TimeOfDay.now();

  DateTime departureDate = DateTime.now();
  TimeOfDay departureTime = TimeOfDay.now();
  final TextEditingController checkInTimeController = TextEditingController();
  final TextEditingController departureDateController = TextEditingController();
  final TextEditingController departureTimeController = TextEditingController();

  String? errorMessage;

  Future<void> _selectCheckInTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: checkInTime,
    );

    if (picked != null && picked != checkInTime) {
      setState(() {
        checkInTime = picked;
        // Update the checkInTimeController value
        checkInTimeController.text = picked.format(context);
      });
    }
  }

  Future<void> _selectCheckInDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkInDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != checkInDate) {
      setState(() {
        checkInDate = picked;
        //Show Time
        _selectCheckInTime(context);
      });
    }
  }

  Future<void> _selectDepartureTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: departureTime,
    );

    if (picked != null && picked != departureTime) {
      setState(() {
        departureTime = picked;

        departureTimeController.text = picked.format(context);
      });
    }
  }

  Future<void> _selectDepartureDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: departureDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != departureDate) {
      setState(() {
        departureDate = picked;
        //Show Time
        _selectDepartureTime(context);
      });
    }
  }

  void validateInputs() {
    if (_formKey.currentState!.validate()) {
      // Perform further actions with the validated data
      String name = nameController.text;
      String address = addressController.text;
      String phone = phoneController.text;
      String email = emailController.text;
      String petType = petTypeController.text;
      String petAge = petAgeController.text;

      String checkInTime = checkInTimeController.text;
      String departureDate = departureDateController.text;
      String departureTime = departureTimeController.text;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    petTypeController.dispose();
    petAgeController.dispose();

    checkInTimeController.dispose();
    departureDateController.dispose();
    departureTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Booking Form'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Address is required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone No',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone No is required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: petTypeController,
                    decoration: InputDecoration(
                      labelText: 'Pet Type (Cat/Dog)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pet Type is required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: petAgeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Pet Age',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pet Age is required';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Chek In Date'),
                      TextButton(
                        onPressed: () => _selectCheckInDate(context),
                        child: Text("${checkInDate.toLocal()}".split(' ')[0]),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: checkInTimeController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Check-in Time (HH:MM)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Check-in Time is required';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Departure In Date'),
                      TextButton(
                        onPressed: () => _selectDepartureDate(context),
                        child: Text("${departureDate.toLocal()}".split(' ')[0]),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: departureTimeController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Departure Time (HH:MM)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Departure Time is required';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      validateInputs();

                      final inputNameText = nameController.text.trim();
                      final inputAddressText = addressController.text.trim();
                      final inputPhoneText = phoneController.text.trim();
                      final inputEmailText = emailController.text.trim();
                      final inputPetTypeText = petTypeController.text.trim();
                      final inputPetAgeText = petAgeController.text.trim();

                      final dobText = "${checkInDate.toLocal()}".split(' ')[0];

                      if (inputNameText.isNotEmpty &&
                          dobText.isNotEmpty &&
                          inputAddressText.isNotEmpty &&
                          inputPhoneText.isNotEmpty &&
                          inputEmailText.isNotEmpty &&
                          inputPetTypeText.isNotEmpty &&
                          inputPetAgeText.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page2(),
                            ));
                      }
                    },
                    child: const Text('Submit'),
                  )
                ])))));
  }
}
