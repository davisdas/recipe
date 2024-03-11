import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controller/profilescreen_controller/profilescreencontroller.dart';
import 'package:recipe_app/controller/sharedprefcontroller/sharedprefcontroller.dart';
import 'package:recipe_app/view/loginregister/loginscreen.dart';
import 'package:recipe_app/view/recipe_description/recipe_description.dart';
import 'package:recipe_app/widgets/itemviewcontainer/itemviewcontainer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    Provider.of<ProfileScreenController>(context, listen: false).getrecipe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var myrecipies = Provider.of<ProfileScreenController>(context).myrecipies;
    return Scaffold(
      // app bar (logout button)
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'username',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Provider.of<SharedPrefController>(context, listen: false)
                    .logoutuser();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                ),
              ))
        ],
      ),

      ///// body
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // profile photo
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            "https://tse2.explicit.bing.net/th?id=OIP.2BvoUsJNneeu_ALPbUmCHwHaLH&pid=Api&P=0&h=180"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //  following
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "following",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "299",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            )
                          ],
                        ),

                        // followers
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "followers",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "200",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            )
                          ],
                        ),

                        // posts

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "posts",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10, bottom: 5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Icon(
            //         Icons.grid_on_sharp,
            //         size: 28,
            //       ),
            //       Icon(
            //         Icons.list_alt,
            //         size: 30,
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(
                width: double.infinity,
                // child: GridView.builder(
                //   gridDelegate:
                //       const SliverGridDelegateWithFixedCrossAxisCount(
                //           mainAxisSpacing: 5,
                //           crossAxisSpacing: 5,
                //           crossAxisCount: 3),
                //   itemCount: 25,
                //   itemBuilder: (context, index) => Container(
                //     decoration: BoxDecoration(
                //         image: DecorationImage(
                //             image: NetworkImage(
                //                 "https://tse4.mm.bing.net/th?id=OIP.RNU40oIz9jSFEsH1tbbNFwHaE8&pid=Api&P=0&h=180"),
                //             fit: BoxFit.cover)),
                //   ),
                // )
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: myrecipies != null
                        ? List.generate(myrecipies.length, (index) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RecipeDescription(index: index),
                                    )),
                                child: ItemviewContainer(
                                    title: myrecipies[index].title,
                                    username: "username",
                                    image: myrecipies[index].picture),
                              ),
                            );
                          })
                        : []))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
