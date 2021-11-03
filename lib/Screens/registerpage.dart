import 'package:flutter/material.dart';
import 'package:unscathed/Backend/constants.dart';
import 'package:unscathed/Custom%20Widgets/customwidgets.dart';
import 'package:unscathed/Screens/welcomepage.dart';
import 'package:unscathed/Custom Widgets/customwidgets.dart';

import 'package:intl/intl.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

bool colorCheckVisibility = false;
String? _name;
String? _birthday; //final birthday value casted as String
late DateTime _dateofBirth;

//Controllers
final nameController = TextEditingController();
final emailController = TextEditingController();
final phoneController = TextEditingController();
final dateController = TextEditingController(); //controller for birthday field
final passwordController =
    TextEditingController(); //controller for password field

bool _password1 = true;
bool _passwordEightCharacters = false; //password checker
bool _hasOneNumber = false; //password checker
bool _hasOneCapitalLetter = false;
bool _hasOneSpecialChar = false;
customColorCheckerState checker =
    customColorCheckerState(); //object from customColorCheckerState class to access method for colorchecker

final _formkey = GlobalKey<FormState>();

class _RegisterPageState extends State<RegisterPage> {
  //method in charge of checking the password and confirming if it matches the criteria
  colorCheck(String password) {
    final regexCheckerNumber = RegExp(r'[0-9]{1,}');
    final regexCheckerCapital = RegExp(r'[A-Z]{1,}');
    final regexCheckerSpecialCharacter = RegExp(r'[!@#$%^&*()_+{}|:"?><]');
    setState(() {
      _passwordEightCharacters = false;
      if (password.length >= 8) {
        _passwordEightCharacters = true;
      }
//works by using the onChanged function and passing in the value of the inputted password
      _hasOneNumber = false;
      if (regexCheckerNumber.hasMatch(password)) {
        _hasOneNumber = true;
      }
      _hasOneCapitalLetter = false;
      if (regexCheckerCapital.hasMatch(password)) {
        _hasOneCapitalLetter = true;
      }

      _hasOneSpecialChar = false;
      if (regexCheckerSpecialCharacter.hasMatch(password)) {
        _hasOneSpecialChar = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          //autovalidateMode: AutovalidateMode.always,
          //will always check if input is right even before submit button is pressed; for debugging only
          key: _formkey,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg2.png'), fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('Create Account'),
                        ),
                        Flexible(
                          flex: 5,
                          child: TextFormField(
                            //name
                            controller: nameController,
                            validator: (value) {
                              if (value != null &&
                                  value.isNotEmpty &&
                                  RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(value)) {
                                //checks if value of each textformfield is not null and not empty
                                return null;
                              } else {
                                return "Special characters are not allowed";
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "John Doe",
                              labelText: "Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Flexible(
                          flex: 5,
                          child: TextFormField(
                            validator: EmailValidator(
                                //using dependency
                                errorText: "Enter a valid email address"),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: "name@example.com",
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Flexible(
                          flex: 5,
                          child: PhoneFormField(
                            //using dependency
                            validator: (value) {
                              if (value != null && value.validate()) {
                                return null;
                              } else {
                                return "Enter a valid phone number";
                              }
                            },
                            autocorrect: true,
                            defaultCountry: 'PH',
                            flagSize: 20,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: "+000-000-0000",
                              labelText: "Phone Number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Flexible(
                          flex: 5,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return "Birthday is required";
                              }
                            },
                            //birthday
                            controller: dateController,
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1920),
                                lastDate: DateTime(2022),
                              ).then((value) {
                                setState(() {
                                  _dateofBirth = value
                                      as DateTime; //null safety wont allow datetime? to be passed to datetime data type so use as to explicitly set type
                                  // print(_dateTime);
                                  String formattedDate =
                                      DateFormat.yMd().format(_dateofBirth);
                                  dateController.text = formattedDate;
                                  DateTime temporary = value;
                                  // print(formattedDate);
                                  _birthday = formattedDate;
                                });
                              });
                            },

                            //birthday text field
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              prefixIcon: Icon(Icons.cake),
                              label: Text("Birthday"),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Flexible(
                          //password
                          flex: 5,
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value != null &&
                                  value.isNotEmpty &&
                                  RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                                      .hasMatch(value)) {
                                return null;
                              } else {
                                return "Please enter valid password";
                              }
                            },
                            onChanged: (password) {
                              colorCheck(password);
                              passwordController.text.isEmpty
                                  ? colorCheckVisibility = false
                                  : colorCheckVisibility = true;
                              //if value of password field is empty, then the password checker will disappear
                              //otherwise, it will appear
                            },
                            obscureText: _password1,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _password1 = !_password1;
                                    });
                                  },
                                  icon: _password1
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off)),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          maintainSize: false,
                          maintainAnimation: false,
                          maintainState: false,
                          child: customColorChecker(),
                          visible: colorCheckVisibility,
                        ),
                        SizedBox(height: 5),
                        Flexible(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SizedBox(
                              height: 45.0,
                              width: 230.0,
                              child: customButton(
                                  buttonText: "Submit",
                                  onpress: () {
                                    if (_formkey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Processing Data...')));
                                    }
                                  }),
                            ),
                          ),
                        ),
                        customDivider(),
                        SignInButton(Buttons.GoogleDark, onPressed: () {}),
                        SignInButton(Buttons.Facebook, onPressed: () {}),
                        SignInButton(Buttons.AppleDark, onPressed: () {})
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class customColorChecker extends StatefulWidget {
  const customColorChecker({Key? key}) : super(key: key);

  @override
  _customColorCheckerState createState() => _customColorCheckerState();
}

class _customColorCheckerState extends State<customColorChecker> {
  @override
  Widget build(BuildContext context) {
    //TODO: REFACTOR CODE TO MAKE MORE READABLE
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                child: _passwordEightCharacters
                    ? Center(
                        child: Icon(
                          Icons.check,
                          size: 15,
                        ),
                      )
                    : Container(),
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _passwordEightCharacters
                        ? Colors.green
                        : Colors.transparent,
                    border: _passwordEightCharacters
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Text('Contains at least 8 characters.'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                child: _hasOneNumber
                    ? Center(
                        child: Icon(
                          Icons.check,
                          size: 15,
                        ),
                      )
                    : Container(),
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _hasOneNumber ? Colors.green : Colors.transparent,
                    border: _hasOneNumber
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Text('Must contain at least one number.'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                child: _hasOneCapitalLetter
                    ? Center(
                        child: Icon(
                          Icons.check,
                          size: 15,
                        ),
                      )
                    : Container(),
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _hasOneCapitalLetter
                        ? Colors.green
                        : Colors.transparent,
                    border: _hasOneCapitalLetter
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Text('Has at least one capital letter.'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                child: _hasOneSpecialChar
                    ? Center(
                        child: Icon(
                          Icons.check,
                          size: 15,
                        ),
                      )
                    : Container(),
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color:
                        _hasOneSpecialChar ? Colors.green : Colors.transparent,
                    border: _hasOneSpecialChar
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Text('Has at least one special character.'),
          ],
        ),
      ],
    );
  }
}
