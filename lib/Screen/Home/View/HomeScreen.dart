import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rendom_user_data/ApiHelper/ApiHelper.dart';
import 'package:rendom_user_data/Screen/Home/Model/RandomUserModel.dart';
import 'package:rendom_user_data/Screen/Home/Provider/HomeProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RandomUserProvider? randomUserProviderTrue;
  RandomUserProvider? randomUserProviderFalse;

  @override
  Widget build(BuildContext context) {
    randomUserProviderFalse =
        Provider.of<RandomUserProvider>(context, listen: false);
    randomUserProviderTrue =
        Provider.of<RandomUserProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: randomUserProviderFalse!.ApiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              RandomUserModel? r1 = snapshot.data;
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 150,
                      backgroundImage: NetworkImage(
                        "${r1!.results![0].picture!.large}",
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Text(
                        "Name :- ${r1.results![0].name!.title}. ${r1.results![0].name!.first} ${r1.results![0].name!.last}",
                        style: GoogleFonts.lobster(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Text(
                        "Gender :- ${r1.results![0].gender}",
                        style: GoogleFonts.lobster(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Text(
                        "Mobile No. :- ${r1.results![0].phone}",
                        style: GoogleFonts.lobster(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Text(
                        "Address :- ${r1.results![0].location!.city} ${r1.results![0].location!.state}",
                        style: GoogleFonts.lobster(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Text(
                        "TimeZone :- ${r1.results![0].location!.timezone}",
                        style: GoogleFonts.lobster(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white30,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Refresh",
                          style: GoogleFonts.lobster(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
