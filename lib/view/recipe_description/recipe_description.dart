import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controller/profilescreen_controller/profilescreencontroller.dart';
import 'package:recipe_app/view/recipe_description/preparescreen.dart';

class RecipeDescription extends StatefulWidget {
  const RecipeDescription({super.key, required this.index});
  final index;
  @override
  State<RecipeDescription> createState() => _RecipeDescriptionState();
}

class _RecipeDescriptionState extends State<RecipeDescription> {
  @override
  Widget build(BuildContext context) {
    var currentdish =
        Provider.of<ProfileScreenController>(context).myrecipies[widget.index];
    return Scaffold(
      // backgroundColor: Color.fromARGB(164, 5, 169, 114),
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 25, 24, 24),
      //   leading: const Padding(
      //     padding: EdgeInsets.all(7.0),
      //     child: CircleAvatar(),
      //   ),
      //   title: const Text(
      //     "Username",
      //     style: TextStyle(
      //         color: Colors.white,
      //         fontStyle: FontStyle.italic,
      //         fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: const Icon(
      //           Icons.close,
      //           color: Colors.white,
      //         ))
      //   ],
      // ),

      // body
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text(
            //   currentdish.title,
            //   style: const TextStyle(
            //       color: Colors.white,
            //       fontSize: 22,
            //       fontWeight: FontWeight.w600,
            //       fontStyle: FontStyle.italic),
            // ),
            // const SizedBox(height: 10),
            // image
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  image: DecorationImage(
                      image: NetworkImage(currentdish.picture),
                      fit: BoxFit.cover)),
              height: MediaQuery.of(context).size.width,
              width: double.infinity,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      currentdish.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                currentdish.desc,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontStyle: FontStyle.italic),
              ),
            ),

            // ingredients
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/backgroundimg/backgroundingre.jpeg"),
                      //  NetworkImage(
                      //     "https://tse3.mm.bing.net/th?id=OIP.Nl2xhMPGTaT0yE9xUMd-XwAAAA&pid=Api&P=0&h=180"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                  ),
                  color: Colors.white),
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ingredients",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                            currentdish.ingredients.length,
                            (index) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${index + 1} . ",
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        currentdish.ingredients[index].trim(),
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrepareScreen(
                              preparelist: [currentdish.procedure]),
                        )),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 25, 24, 24),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Center(
                          child: Text(
                            "Start cooking  >>",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
