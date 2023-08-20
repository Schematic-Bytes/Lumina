import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
        body: Column(
          children: [
            const Spacer(),
            Container(
                alignment: Alignment.center,
                child: Lottie.asset('assets/images/animationBackground.json')),
            const Spacer(),
            Container(
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
                          final result = await FilePicker.platform
                              .pickFiles(type: FileType.image);
                          if (result != null) {
                            PlatformFile file = result.files.first;
                          }
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
          ],
        ),
      ),
    );
  }
}
