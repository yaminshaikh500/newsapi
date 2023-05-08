import 'package:flutter/material.dart';
import 'package:newsapi/new_list_view.dart';




class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: signup(),
    );
  }
}

class signup extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text("Create New Account ",style: TextStyle(fontFamily: "InstrumentSerif")),
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.grey,
            body:SafeArea(
                child:Center(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:EdgeInsets.all(10),
                          child:Text("SIGN UP",
                              style:TextStyle(fontSize: 35,fontFamily: "InstrumentSerif")),

                        ),

                        CircleAvatar(
                          radius:30,
                          backgroundImage:AssetImage("assets/images/signup.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            validator: (value){
                              print(value!.length);
                              if(value!.length != 10){
                                return 'Name Must be 10 Characters';
                              }
                              else{
                                return 'Required';
                              }
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              fillColor: Colors.black12,
                              filled: true,
                              hintText: "Enter Name",
                              label: Text("Enter Your First Name"),


                            ),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            validator: (value){
                              print(value!.length);
                              if(value!.length != 10){
                                return 'Name Must be 10 Characters';
                              }
                              else{
                                return 'Required';
                              }
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                fillColor: Colors.black12,
                                filled: true,
                                hintText: "Enter Last Name",
                                label: Text("Enter Your Last Name")

                            ),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              bool isValid = RegExp(
                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(value);
                              if (!isValid) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },

                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                fillColor: Colors.black12,
                                filled: true,
                                hintText: "Enter Email",
                                label: Text("Enter Email ID")

                            ),
                          ),

                        ),
                        Padding(

                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            validator: (value){
                              if(value!.length != 10)
                              {
                                return "Enter Valid Number";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                fillColor: Colors.black12,
                                filled: true,
                                hintText: "Enter Number",
                                label: Text("Enter Your Number")

                            ),
                          ),

                        ),



                        TextButton(
                            onPressed:()=>{
                              if(_formkey.currentState!.validate())
                                {
                                  print("hurray")
                                }
                              else
                                {
                                  print("not validate")
                                }
                            } ,
                            child:Text("SIGN IN",style: TextStyle(color: Colors.black),),
                            style: ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.white70))
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login_app()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 30,fontFamily: 'InstrumentSerif'),
                            ),
                          ),
                        )


                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}
