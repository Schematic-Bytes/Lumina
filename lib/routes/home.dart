import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lumina/routes/results.dart';
import 'package:file_picker/file_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          // leading: const Icon(
          //   Icons.menu,
          //   color: Colors.black,
          // ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.dark_mode_sharp,
                color: Colors.black,
              ),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Lumina",
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(top: 2),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Photo",
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: const Icon(
                      Icons.image_search,
                    ),
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png']);
                      if (result == null) return;
                    },
                  ),
                  suffixIcon: IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Result(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
