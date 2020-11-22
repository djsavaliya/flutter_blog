import 'dart:io';
import 'dart:async';

import 'package:flutter_blog/services/auth.dart';
import 'package:flutter_blog/shared/constants.dart';
import 'package:flutter_blog/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function func;
  Register({this.func});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String firstName = '';
  String lastName = '';
  String email = '';
  String mobile = '';
  String password = '';
  String confirmPassword = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 1.0,
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                widget.func();
              }
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                validator: (val) => val.isEmpty ? 'Please enter first name' : null,
                onChanged: (val) {
                  setState(() => firstName = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                validator: (val) => val.isEmpty ? 'Please enter last name' : null,
                onChanged: (val) {
                  setState(() => lastName = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val.isEmpty ? 'Please enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
                validator: (val) => val.length != 10 ? 'Please enter a 10-digit mobile number' : null,
                onChanged: (val) {
                  setState(() => mobile = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                keyboardType: TextInputType.visiblePassword,
                validator: (val) => val.length < 8 ? 'Password must have 8+ characters' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Confirm Password'),
                keyboardType: TextInputType.visiblePassword,
                validator: (val) => val != password ? 'Passwords do not match' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => confirmPassword = val);
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(firstName,lastName,email,mobile,password);
                    if(result == null){
                      setState(() {
                        error = 'Error in Registration.';
                        loading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
