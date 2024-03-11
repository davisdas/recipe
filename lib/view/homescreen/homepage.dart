import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/addrecipescreen.dart';
import 'package:recipe_app/view/profilepage/profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var text = [
    "Recipe added in food with friends",
    "Recipe added in food with friends",
    "Recipe added in food with friends",
  ];
  var name = ["Harry terl", "Mark Tony", "Lery Heal"];
  var img = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Bangladeshi_Biryani.jpg/220px-Bangladeshi_Biryani.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Biriyani.jpg/220px-Biriyani.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/1/18/Chicken_Biryani_in_Chennai.jpg"
  ];
  var simg = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Chicken_Biryani.jpg/220px-Chicken_Biryani.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/4/48/India_food.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Bangladeshi_Biryani.jpg/220px-Bangladeshi_Biryani.jpg"
  ];
  // int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade200,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddRecipe())),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 241, 241),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                )),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/profile-photos-4.jpg")),
          ),
        ),
        title: Text(
          "welcome user",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        actions: [],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   // height: 100,
          //   width: double.infinity,
          //   margin: const EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     color: Colors.orange,
          //     borderRadius: BorderRadius.circular(20),
          //     border: Border.all(color: Colors.orange, width: 2),
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Row(
          //               children: [
          //                 GestureDetector(
          //                   onTap: () => Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) =>
          //                               const ProfilePage())),
          //                   child: const CircleAvatar(
          //                     child: Icon(
          //                       Icons.person,
          //                       size: 30,
          //                       color: Colors.black,
          //                     ),
          //                   ),
          //                 ),
          //                 const Padding(
          //                   padding: EdgeInsets.only(left: 10, top: 8),
          //                   child: Text(
          //                     'Helloo',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 20,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             const Padding(
          //               padding: EdgeInsets.only(right: 10),
          //               child: CircleAvatar(
          //                   child: Icon(
          //                 Icons.notifications,
          //                 size: 30,
          //                 color: Colors.black,
          //               )),
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: ListView.builder(
                    itemCount: img.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color.fromARGB(255, 243, 241, 241)),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: NetworkImage(img[index])),
                                title: Text(name[index]),
                                subtitle: Text(text[index]),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    // color: Color(0xff28344c),
                                    color: Colors.deepOrangeAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 260,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 200,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        child: Image.network(
                                          simg[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              const Text("Birira Tacos",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(name[index],
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.bookmark_add_outlined,
                                            size: 30,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ),
          )

          // Expanded(
          //   child: Container(
          //     child: ListView.builder(
          //         itemCount: 10,
          //         itemBuilder: (context, index) => Padding(
          //               padding: const EdgeInsets.symmetric(
          //                   horizontal: 8, vertical: 15),
          //               child: Column(
          //                 children: [
          //                   Container(
          //                     height: 250,
          //                     decoration: BoxDecoration(
          //                         color: Colors.white,
          //                         borderRadius: BorderRadius.circular(10),
          //                         image: DecorationImage(
          //                             image: NetworkImage(
          //                               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMWCOd4JImKHTfiAvi9wXlljHAm-uDTYf8Bg&usqp=CAU',
          //                             ),
          //                             fit: BoxFit.fill)
          //                         // Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMWCOd4JImKHTfiAvi9wXlljHAm-uDTYf8Bg&usqp=CAU'
          //                         // )
          //                         // )
          //                         ),

          //                     // child: Column(
          //                     //   mainAxisAlignment: MainAxisAlignment.end,
          //                     //   children: [
          //                     //     Padding(
          //                     //       padding:
          //                     //           const EdgeInsets.symmetric(vertical: 5),
          //                     //       child: Row(
          //                     //         mainAxisAlignment:
          //                     //             MainAxisAlignment.spaceBetween,
          //                     //         children: [
          //                     //           Icon(Icons.thumb_up_alt_outlined),
          //                     //           Icon(Icons.favorite_border)
          //                     //         ],
          //                     //       ),
          //                     //     )
          //                     //   ],
          //                     // ),
          //                   ),
          //                 ],
          //               ),
          //             )),
          //   ),
          // )
        ],
      ),
    );
  }
}
