import 'package:flutter/material.dart';
import 'package:pdf_creator/providers/homeProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pdf Creator",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
           MainAxisAlignment.center, 
           children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.orangeAccent,
              ),
            ),
            onPressed: () async {
              await Provider.of<HomeProvider>(
                context,
                listen: false,
              ).createPdf();
            },
            child: const Text(
              "Create PDF",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.orangeAccent,
              ),
            ),
            onPressed: () async {
              // final invoice=Invoice()
              await Provider.of<HomeProvider>(
                context,
                listen: false,
              ).imagePicker();
            },
            child: const Text(
              "Add Image",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
