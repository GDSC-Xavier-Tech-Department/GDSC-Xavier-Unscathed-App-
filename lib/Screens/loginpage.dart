import 'package:flutter/material.dart';
import 'package:unscathed_app/Backend/constants.dart';
import 'package:unscathed_app/Screens/welcomepage.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

late DateTime _dateofBirth;
final dateController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg2.png'), fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Create Account'),
                    SizedBox(height: 15.0),
                    CustomFormOne(
                        keyboardtype: TextInputType.name,
                        iconChosen: Icons.person,
                        FormisFor: "Name",
                        Hint: "John Doe"),
                    SizedBox(height: 15.0),
                    CustomFormOne(
                        keyboardtype: TextInputType.emailAddress,
                        iconChosen: Icons.email,
                        FormisFor: "Email",
                        Hint: "name@example.com"),
                    SizedBox(height: 15.0),
                    CustomFormOne(
                        keyboardtype: TextInputType.phone,
                        iconChosen: Icons.phone,
                        FormisFor: "Phone Number",
                        Hint: "+63935-000-0000"),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: dateController,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
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
                            // print(formattedDate);
                            //dateController.value = ;
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
                    SizedBox(
                      height: 15.0,
                    ),
                    CustomFormPasswords(passwordLabel: "Password"),
                    SizedBox(height: 15.0),
                    CustomFormPasswords(passwordLabel: "Retype Passowrd"),
                    SizedBox(height: 15.0),
                    customButton(buttonText: "Submit", onpress: () {})
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomFormOne extends StatefulWidget {
  IconData iconChosen;
  String FormisFor;
  String Hint;
  TextInputType keyboardtype;

  CustomFormOne(
      {required this.iconChosen,
      required this.FormisFor,
      required this.Hint,
      required this.keyboardtype});

  @override
  _CustomFormOneState createState() => _CustomFormOneState();
}

class _CustomFormOneState extends State<CustomFormOne> {
  final inputController = TextEditingController();
  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: widget.Hint,
          label: Text(widget.FormisFor),
          prefixIcon: Icon(widget.iconChosen),
          suffixIcon: inputController.text.isEmpty
              ? Container(
                  width: 0.0,
                )
              : IconButton(onPressed: () {}, icon: Icon(Icons.close))),
    );
  }
}

class CustomFormPasswords extends StatefulWidget {
  String passwordLabel;

  CustomFormPasswords({required this.passwordLabel});

  @override
  _CustomFormPasswordsState createState() => _CustomFormPasswordsState();
}

class _CustomFormPasswordsState extends State<CustomFormPasswords> {
  final inputController = TextEditingController();
  bool isVisible = true;
  String password = "";
  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => setState(() {
        this.password = value;
      }),
      onSubmitted: (value) => setState(() {
        this.password = value;
      }),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          errorText: "Passwords do not match.   ",
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon:
                isVisible ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ),
          labelText: widget.passwordLabel),
      obscureText: isVisible,
    );
  }
}
