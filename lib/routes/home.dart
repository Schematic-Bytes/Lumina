import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lumina/routes/results.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "",
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 2),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search Photo",
                    border: InputBorder.none,
                    // prefixIcon: IconButton(
                    //   color: Colors.black,
                    //   icon: const Icon(
                    //     Icons.image_search,
                    //   ),
                    //   onPressed: () {},
                    // ),
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
      ),
    );
  }
}
