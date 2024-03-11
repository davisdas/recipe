import 'package:flutter/material.dart';
import 'package:recipe_app/details/categorydetails.dart';
import 'package:recipe_app/details/chef_details.dart';
import 'package:recipe_app/widgets/all_categories.dart';
import 'package:recipe_app/widgets/all_creators.dart';
import 'package:recipe_app/widgets/filter.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _FavoratePageState();
}

class _FavoratePageState extends State<ExplorePage> {
  var catergory = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpuJ4h2m9R-0ddUYVi53CjFBtByDjmhxdafA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk488-Mt1kJ0GxmhEr0h3lXlImeAkTNBXYbg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBenTu6SBmQSJsuPJxTjIAy5FRZx-bH2FWcw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgAw45JF1tN7IvLZBCWZQ68hWsMFlaDiNciQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1rdrz_ScMGHt9gqxMJ9Vv1wgFUfClfG46GA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGB9QhJNZkPEq2a-MJAcsbd7psr66xZJDgcg&usqp=CAU',
  ];
  List data = [
    'Ingredients',
    'Meal Type',
    'Cook Time',
    'Nutrition',
    'Diet',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.black,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterPage(),
                      )),
                  child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Card(
                      color: Colors.orange,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 250,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            //border: Border.all(color: Colors.orange, width: 3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Top categories",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const AllCategories(),
                                              ));
                                        },
                                        child: const Text(
                                          'See All',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        child: Container(
                                          width: 150,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius
                                                .all(Radius.circular(20)
                                                // topLeft: Radius.circular(20),
                                                // topRight: Radius.circular(20),
                                                ),
                                            child: GestureDetector(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CategoryDetails(),
                                                  )),
                                              child: Image.network(
                                                catergory[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //creators
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 300,
                          //height: double.maxFinite,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Popular Creators',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const AllCreators(),
                                              ));
                                        },
                                        child: const Text(
                                          'See All',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 6,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      margin: const EdgeInsets.all(10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ChefDetails(),
                                                  )),
                                              child: const CircleAvatar(
                                                maxRadius: 60,
                                                backgroundImage: NetworkImage(
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaJm2_Izxs7ZDpd7gs1DGi7Is3zvPJB-a9hg&usqp=CAU'),
                                              ),
                                            ),
                                            const Expanded(
                                                child: Text(
                                              'name',
                                              style: TextStyle(fontSize: 18),
                                            ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              // Expanded(
                              //   child: SizedBox(
                              //     width: double.infinity,
                              //     child: ListView.builder(
                              //       itemCount: 10,
                              //       itemBuilder: (context, index) => Padding(
                              //         padding: const EdgeInsets.all(8.0),
                              //         child: GestureDetector(
                              //           child: Container(
                              //             width: 150,
                              //             child: ClipRRect(
                              //               borderRadius: BorderRadius.all(
                              //                   Radius.circular(20)
                              //                   // topLeft: Radius.circular(20),
                              //                   // topRight: Radius.circular(20),
                              //                   ),
                              //               child: Image.network(
                              //                 "https://upload.wikimedia.org/wikipedia/commons/4/48/India_food.jpg",
                              //                 fit: BoxFit.cover,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //       scrollDirection: Axis.horizontal,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //recipes
                      Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Recipes you may like',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: (data.length / 2).ceil() * 180,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                // color: Colors.orange,
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.custom(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  childrenDelegate:
                                      SliverChildListDelegate(List.generate(
                                          20,
                                          (index) => Card(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      image:
                                                          const DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  NetworkImage(
                                                                "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Bangladeshi_Biryani.jpg/220px-Bangladeshi_Biryani.jpg",
                                                              ))),
                                                ),
                                                // Center(
                                                //   child: Column(
                                                //     children: [
                                                //       Container(
                                                //         //height: 150,
                                                //         // decoration: BoxDecoration(
                                                //         //     borderRadius:
                                                //         //         BorderRadius
                                                //         //             .circular(20),
                                                //         //     image: DecorationImage(
                                                //         //         fit: BoxFit.cover,
                                                //         //         image: AssetImage(
                                                //         //             "assets/images/chicken fry.jpg",
                                                //         //             ))),
                                                //       )
                                                //     ],
                                                //   ),
                                                // ),
                                              ))),
                                  // itemBuilder: (context, index) => Image(
                                  //     image:
                                  //         AssetImage('assets/images/chicken fry.jpg')),
                                ),
                              ),
                              // child:
                              // Column(
                              //   children: [
                              //     const Row(
                              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Padding(
                              //           padding: EdgeInsets.only(top: 20),
                              //           child: Text(
                              //             'Recipes you may like',
                              //             style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               fontSize: 26,
                              //               color: Colors.white,
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     const SizedBox(
                              //       height: 20,
                              //     ),
                              //     Container(
                              //       height: 800,
                              //       width: double.infinity,

                              //       child: GridView.builder(
                              //           //  physics: NeverScrollableScrollPhysics(),
                              //           itemCount: 100,
                              //           gridDelegate:
                              //               SliverGridDelegateWithFixedCrossAxisCount(
                              //             crossAxisCount: 2,
                              //           ),
                              //           itemBuilder: (context, index) {
                              //             return Container(
                              //                 color: Colors.red,
                              //                 child: Text('sdgdsgfsd'));
                              //           }),

                              //     ),
                              //   ],
                              //  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
