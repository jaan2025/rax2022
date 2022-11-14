import 'dart:ffi';
import 'package:flutter_management/Provider/schoolNameProvider.dart';
import 'package:flutter_management/Screens/Login.dart';
import 'package:flutter_management/api/ApiServises.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_management/Screens/schooldetails.dart';
import 'package:flutter_management/model/SecondSheetModel.dart';

import '../responsive/id.dart';


class HomeScreen extends ConsumerStatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
 List<secondSheetModel>? school;

/*
  @override
  void initState() {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     ref.read(schoolNameNotifier);
   });
    super.initState();
  }

*/

/*

  nameSchool(int index){
    return
  }
*/


  @override
  Widget build(BuildContext context) {

    var state = ref.watch(schoolNameNotifier).value;


    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Consumer(builder: (context,ref,child){
        return Stack(
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 75,
                      height: 300,
                      decoration:  BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('Assets/image3.jpg'),
                              fit: BoxFit.fitWidth

                          )
                      ),
                    ),
                  ),
                  Text(
                    "TELANGANA MINORITIES \n RESIDENTIAL EDUCATIONAL \n INSTITUTIONS SOCIETY",
                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.52,
                  margin: const EdgeInsets.only(top: 230),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    //color: Colors.black,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: Colors.white,
                    shadowColor: Colors.red,
                    elevation: 40,
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: SingleChildScrollView(
                        child: Column(
                          children:  [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Text('School Code',
                                  style: TextStyle(
                                      fontFamily: 'SFUIDisplay',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.all(10),
                              child:ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state?.length ?? 0,
                                  itemBuilder: (context,index){
                                    return listSchools(index);
                                  }),
                            ),

                            //
                           /* Padding(
                              padding:  EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  ref.read(apiProvider).getClass6();
                                  ref.read(apiProvider).getClass5();
                                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => schooldetails()));
                                  });

                                } , child:   Text('GO',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'SFUIDisplay',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 675.0, left: 100),
                child: Text("Powered By Smart School ERP"),
              )
            ]
        );
      })
    );
  }
  listSchools(int index){
    var state = ref.watch(schoolNameNotifier);
    var state1 = ref.watch(schoolNameNotifier).value;


    print("print state !!!!!!!!!!!!!!!!!" + state.toString());
    print("print state11111111 !!!!!!!!!!!!!!!!!" + state1![index].toString());
    return  InkWell(
      onTap: (){
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => schooldetails(secondsheetmodel: state1[index])));
            });

      },
      child: SizedBox(
        height: 50,
        child: Card(
          elevation: 30,
          child: Center(child: Text( state1[index].NameoftheSchool.toString(),
            //state.value![index].NameoftheSchool.toString() ,
      textAlign: TextAlign.center,)),
        ),
      ),
    );
  }

}

