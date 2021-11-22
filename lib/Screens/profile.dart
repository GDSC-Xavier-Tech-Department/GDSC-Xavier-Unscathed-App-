import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'package:unscathed/Backend/constants.dart';
import 'package:unscathed/Backend/database.dart';
import 'package:unscathed/Custom%20Widgets/customwidgets.dart';
import 'package:unscathed/Screens/registerpage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

TextEditingController _bioController = TextEditingController();
TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
PhoneController _phoneNumberController =
    PhoneController(PhoneNumber(isoCode: 'PH', nsn: "+649458142318"));
TextEditingController _heightController = TextEditingController();
TextEditingController _streakController = TextEditingController();
TextEditingController _memberSinceController = TextEditingController();
TextEditingController _expirationController = TextEditingController();
TextEditingController _birthdayController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
final GlobalKey _profileKey = GlobalKey<FormState>();

bool editing = false;

Database db = Database(); //Database Object

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    _nameController.text = db.Name;
    _emailController.text = db.Email;
    //_phoneNumberController. = db.PhoneNumber.toString();
    _heightController.text = db.Height.toString();
    _streakController.text = db.LongestStreak;
    _memberSinceController.text = db.MemberSince.toString();
    _expirationController.text = db.Expiration.toString();
    //_birthdayController.text = db.Birthday.toString();
    _passwordController.text = db.Password;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (editing == false) {
                  editing = true;
                } else {
                  editing = false;
                  db.Name = _nameController.text;
                  db.Email = _emailController.text;
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: editing == true
                  ? Icon(Icons.save)
                  : Icon(Icons.edit, size: 20),
            ),
          )
        ],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              //child: Text("Edit"),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () => print("Profile Picture tapped"),
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                    "https://scontent-xsp1-2.xx.fbcdn.net/v/t1.6435-9/173108996_3810358232424372_6382907658385410901_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=RQWtohnfX0oAX_N2Ve_&_nc_ht=scontent-xsp1-2.xx&oh=b0dc7854b1ffcb22cd13c09bd5d8af42&oe=61A995F7",
                  ),
                  radius: 80,
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                child: Text(
                  db.Name,
                  style: kprofileNameText,
                ),
              ),
            ),
            Form(
              key: _profileKey,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    onSaved: (name) => db.Name = name.toString(),
                    controller: _bioController,
                    maxLines: null,
                    textAlign: TextAlign.justify,
                    maxLength: 110,
                    decoration: InputDecoration(
                      // isDense: true,
                      label: Text('Bio'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    enabled: editing,
                  ),
                ),
              ),
            ),
            customDivider(),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.center,
              color: klightBlueGrey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  children: [
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            isDense: true,
                            disabledBorder: InputBorder.none,
                            //disabledBorder: InputBorder.none,
                            label: Text('Name'),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          enabled: editing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          isDense: true,
                          disabledBorder: InputBorder.none,
                          label: Text('Email'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        enabled: editing,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PhoneFormField(
                        controller: _phoneNumberController,
                        onChanged: (number) {
                          setState(() {
                            editing == false
                                ? FormState().save()
                                : print(number);
                          });
                        },
                        enabled: editing,
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
                            hintText: "+000-000-0000",
                            labelText: "Phone Number",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            disabledBorder: InputBorder.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _heightController,
                        decoration: InputDecoration(
                          isDense: true,
                          disabledBorder: InputBorder.none,
                          label: Text('Height'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        enabled: editing,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _streakController,
                        decoration: InputDecoration(
                          isDense: true,
                          disabledBorder: InputBorder.none,
                          label: Text('Longest Streak'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        enabled: editing,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _birthdayController,
                        decoration: InputDecoration(
                          isDense: true,
                          disabledBorder: InputBorder.none,
                          label: Text('Birthday'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        enabled: editing,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _memberSinceController,
                        decoration: InputDecoration(
                          isDense: true,
                          disabledBorder: InputBorder.none,
                          label: Text('Member Since'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        enabled: editing,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _expirationController,
                        decoration: InputDecoration(
                          isDense: true,
                          disabledBorder: InputBorder.none,
                          label: Text('Expires on'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        enabled: editing,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          isDense: true,
                          disabledBorder: InputBorder.none,
                          label: Text('Password'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        enabled: editing,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(10),
                            backgroundColor:
                                MaterialStateProperty.all(klighterBlueGrey)),
                        child: Text(
                          "Logout",
                          style: ksmallTextStyle,
                        ),
                        onPressed: () => print("Logging out"),
                      ),
                    ),
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
