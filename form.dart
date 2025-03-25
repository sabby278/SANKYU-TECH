import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>(); // Unique key for the form

  TextEditingController customerNameController = TextEditingController();
  TextEditingController icNumberController = TextEditingController();
  TextEditingController tinNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField("Customer Name", customerNameController),
                SizedBox(height: 10),
                Text("Identification Type"),
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
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    "Submit Ic",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                _buildTextField("TIN Number", tinNumberController),
                SizedBox(height: 10),
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
                    Expanded(
                      child: _buildTextField(
                        "Phone Number",
                        phoneNumberController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                _buildTextField("Email Address", emailController),
                SizedBox(height: 10),
                _buildTextField("Address 1", address1Controller),
                _buildTextField("Address 2", address2Controller),
                _buildTextField("Address 3", address3Controller),
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
                DropdownButtonFormField<String>(
                  value: selectedState,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedState = newValue!;
                    });
                  },
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
                TextFormField(
                  initialValue: selectedCountry,
                  readOnly: true,
                  decoration: InputDecoration(labelText: "Country"),
                ),
                SizedBox(height: 20),
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        filled: true, // Enables background color
        fillColor: Colors.grey[200], // Sets input box background to grey
      ),
    );
  }

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
