import 'dart:async';
import 'dart:io';
import 'package:FieldApp/location.dart';
import 'package:FieldApp/widget/drop_down.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class CustomerVisit  extends StatefulWidget {
  final id;
  const CustomerVisit({Key? key,required this.id}) : super(key: key);
  @override
  CustomerVisitState createState() => CustomerVisitState();
}
class CustomerVisitState extends State<CustomerVisit> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  late GoogleMapController mapController;
  bool servicestatus = false;
  bool haspermission = false;
  late List<CameraDescription>? cameras;
  XFile? image;
  File? imageFile;
  late CameraController? controller;
  late LocationPermission permission;
  late Position position;
  double long =0.0, lat=0.0;
  late StreamSubscription<Position> positionStream;
  var feedback = [
    'Customer will pay',
    'system will be repossessed',
    'at the shop for replacement',
    'EO take and resale',
    'not the owner',
  ];

  @override
  void initState() {
    checkGps();
    loadCamera();
    super.initState();
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

  }
  void getImage() async{
    final file  = await ImagePicker().pickImage(source: ImageSource.camera);
    if(file?.path != null){
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
  final formKey = GlobalKey<FormState>();
  updateCustomer() async {
    if(imageFile == null || reasonselected == null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select reason and capture image'),
        ),
      );

    }else{
      final fileName = widget.id;
      final destination = 'files/$fileName';
      try {
        GeoPoint newLocation = GeoPoint(lat, long);
        final CollectionReference collectionReference = firestore.collection("new_calling");
        var currentUser = FirebaseAuth.instance.currentUser;
        final ref = firebase_storage.FirebaseStorage.instance
            .ref(destination)
            .child('file/');
        await collectionReference.doc(widget.id).update(
            { 'Reason':reasonselected,
              'Status':'Complete',
              'User UID': currentUser?.uid,
              'date': DateTime.now(),
              'Task Type': 'Visit',
              'image': destination,
              'Location' : newLocation

            }


        );
        await ref.putFile(imageFile!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Task Updated successfully'),
          ),
        );

      }catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occur when submit'),
          ),
        );
      }


    }


    }

  loadCamera() async {
    cameras = await availableCameras();
    if(cameras != null){
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const  SnackBar(
            content: Text('No any camera found'),
          )
      );
    }
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if(servicestatus){
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Location permissions are denied'),
              ),
          );
        }else if(permission == LocationPermission.deniedForever){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location permissions are permanently denied'),
            ),
          );
        }else{
          haspermission = true;
        }
      }else{
        haspermission = true;
      }

      if(haspermission){
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('GPS Service is not enabled, turn on GPS location'),
        ),
      );

    }

    /*setState(() {
      //refresh the UI
    });*/
  }
  String? reasonselected;
  getLocation() async {
    position = await Geolocator.getCurrentPosition();

    long = position.longitude;
    lat = position.latitude;

    setState(() {

      //refresh UI
    });

    LocationSettings locationSettings = const LocationSettings(
       //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {

      long = position.longitude;
      lat = position.latitude;

      setState(() {
        //refresh UI on update
      });
    });
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
                stream: firestore
                    .collection("new_calling").doc(widget.id).snapshots(),
                builder:(context, snapshot){

                  if(snapshot.hasData ){
                    DocumentSnapshot data = snapshot.data!;
                    return Column(
                      children: [

                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.blueGrey.shade800,
                            radius: 50,
                            child: const Text("CP"),
                          ),
                        ),
                        Text('Name:  ${data['Customer Name']}',style:const TextStyle(fontSize: 15)),
                        Text('Account : ${data['Account Number']}',style:const TextStyle(fontSize: 15)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(onPressed: (){},child: Text(data['Customer Phone Number'],style:const TextStyle(fontSize: 20,color: Colors.black),),),
                            TextButton(onPressed: (){},child: Text(data['Area'].toString(),style:const TextStyle(fontSize: 20,color: Colors.black))),

                          ],


                        ),
                        const Card(
                          shadowColor: Colors.amber,
                          color: Colors.black,
                          child: ListTile(
                            title: Center(
                                child: Text("Last Activities",
                                    style: TextStyle(fontSize: 15, color: Colors.yellow))),
                            dense: true,
                          ),
                        ),
                        Form(
                          key: formKey,
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                AppDropDown(
                                    label: 'Reason for not pay',
                                    hint: 'select a reason',
                                    items:feedback,
                                    onChanged:  (String value) {
                                      setState(() {
                                        reasonselected = value;
                                      });}),
                  ElevatedButton.icon(
                  onPressed:()=>getImage(),
                  icon: const Icon(Icons.camera),
                  label: const Text("Capture Image"),

                  ),
                                Container( //show captured image
                                  padding: const EdgeInsets.all(30),
                                  child: imageFile == null?
                                  const Text("No image captured"):
                                  Image.file(File(imageFile!.path), height: 300,),
                                  //display captured image
                                ),
                                ElevatedButton(onPressed: (){
                                  updateCustomer();
                                }, child:const Text('Submit'))
                              ],
                            ),
                          ),
                        ),

                              ElevatedButton.icon(
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) =>
                  CustomerLocation(id: widget.id, customerLocation: data['Location'],name: data['Customer Name'],),
                  ));
                  },
                                label: const Text('Get direction'),
                                icon: const Icon(Icons
                                    .location_on_outlined),
                              ),
                                         ],
                    );
                  }
                  else if(snapshot.hasError){
                    return Column(
                      children: const [
                      CircularProgressIndicator(),
                        Text("Loading data...")
                      ],
                    );
                  }
                  else{
                    return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text("Loading data...")
                        ],
                      ),
                    );
                  }

                },
            ),






          ],
        ),
      ),
    );
  }

}