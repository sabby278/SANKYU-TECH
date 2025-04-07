import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers with default values
  TextEditingController customerNameController = TextEditingController(
    text: "Abu bin Ali",
  );
  TextEditingController icNumberController = TextEditingController(
    text: "123456-78-9012",
  );
  TextEditingController tinNumberController = TextEditingController(
    text: "123456-78-9012",
  );
  TextEditingController phoneNumberController = TextEditingController(
    text: "01 234 5678",
  );
  TextEditingController emailController = TextEditingController(
    text: "email@address.com",
  );
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController address3Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();

  String selectedState = "Choose State";
  String selectedCountry = "Malaysia";
  String selectedIdType = "IC No.";
  String selectedCountryCode = "+60";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Customer"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField("Customer Name", customerNameController),
                SizedBox(height: 10),

                Text(
                  "Identification Type",
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  children: [
                    _buildRadioButton("IC No."),
                    _buildRadioButton("Passport"),
                    _buildRadioButton("Police"),
                  ],
                ),
                SizedBox(height: 10),

                _buildTextField("IC Number", icNumberController),
                SizedBox(height: 10),

                // "Check Form" Button
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle IC verification
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      "Check Form",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                _buildTextField("TIN Number", tinNumberController),
                SizedBox(height: 10),

                // Phone Number with Country Code
                Text("Phone Number", style: TextStyle(color: Colors.grey)),
                Row(
                  children: [
                    DropdownButton<String>(
                      value: selectedCountryCode,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountryCode = newValue!;
                        });
                      },
                      items:
                          ["+60", "+65", "+1"].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                    ),
                    SizedBox(width: 10),
                    Expanded(child: _buildTextField("", phoneNumberController)),
                  ],
                ),
                SizedBox(height: 10),

                _buildTextField("Email Address", emailController),
                SizedBox(height: 10),

                _buildTextField("Address 1", address1Controller),
                SizedBox(height: 10),

                _buildTextField("Address 2", address2Controller),
                SizedBox(height: 10),

                _buildTextField("Address 3", address3Controller),
                SizedBox(height: 10),

                // City & Postcode in one row
                Row(
                  children: [
                    Expanded(child: _buildTextField("City", cityController)),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField("Postcode", postcodeController),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // State Dropdown
                DropdownButtonFormField<String>(
                  value: selectedState,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedState = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "State",
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  items:
                      [
                        "Choose State",
                        "Johor",
                        "Kedah",
                        "Selangor",
                        "Sarawak",
                        "Sabah",
                        "Kelantan",
                        "Perlis",
                        "Negeri Sembilan",
                        "Terengganu",
                        "Pahang",
                        "Kuala Lumpur",
                        "Perak",
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
                SizedBox(height: 10),

                // Country (Readonly)
                TextFormField(
                  initialValue: selectedCountry,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Country",
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xFF32556E),
                  ), // Changed to specific blue
                ),
                SizedBox(height: 20),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Text Field Builder
  Widget _buildTextField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ Label is now above the input box
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 5), // Space between label and input box
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200], // Grey background
          ),
          style: TextStyle(color: Color(0xFF32556E)), // Blue text color
        ),
      ],
    );
  }

  // Radio Button Builder
  Widget _buildRadioButton(String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedIdType,
          onChanged: (String? newValue) {
            setState(() {
              selectedIdType = newValue!;
            });
          },
        ),
        Text(value),
      ],
    );
  }
}

