import 'package:flutter/material.dart';

class AllCreators extends StatefulWidget {
  const AllCreators({super.key});

  @override
  State<AllCreators> createState() => _AllCreatorsState();
}

class _AllCreatorsState extends State<AllCreators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Users',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          )),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Column(
          children: [
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            ListTile(
              leading: const CircleAvatar(
                maxRadius: 50,
                //minRadius: 40,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaJm2_Izxs7ZDpd7gs1DGi7Is3zvPJB-a9hg&usqp=CAU'),
              ),
              title: const Text(
                'name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'chef description',
                style: TextStyle(fontSize: 18),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: const Text(
                  'Follow',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
