import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrepareScreen extends StatefulWidget {
  const PrepareScreen({super.key, required this.preparelist});
  final List preparelist;
  @override
  State<PrepareScreen> createState() => _PrepareScreenState();
}

class _PrepareScreenState extends State<PrepareScreen> {
  int stepcount = 0;
  nextstep() {
    stepcount++;
  }

  prevstep() {
    stepcount--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("assets/backgroundimg/procedurebackground.jpeg"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.preparelist[0][stepcount].toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      stepcount == 0
                          ? SizedBox(
                              width: 10,
                            )
                          : IconButton(
                              onPressed: () {
                                if (stepcount > 0) {
                                  setState(() {
                                    prevstep();
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                              ),
                              color: Colors.white,
                            ),
                      Text(
                        "step ${stepcount + 1} of ${widget.preparelist[0].length - 1}",
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      stepcount == widget.preparelist[0].length - 1
                          ? const SizedBox(width: 10)
                          : IconButton(
                              onPressed: () {
                                if (widget.preparelist[0].length - 1 >
                                    stepcount) {
                                  setState(() {
                                    nextstep();
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                              ),
                              color: Colors.white,
                            ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 200)
          ],
        ),
      ),
    );
  }
}
