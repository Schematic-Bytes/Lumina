import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  bool isModelReleaseSelected = false;
  bool isPropertyReleaseSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Racing Cars",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "10 Items",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 13),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 1),
          child: Column(
            children: [
              SizedBox(
                height: 35,
                child: ListView(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    InputChip(
                      avatar: const Icon(Icons.star),
                      label: Text(
                        "Model Release",
                        style: GoogleFonts.poppins(),
                      ),
                      onSelected: (bool newBool) {
                        setState(() {
                          isModelReleaseSelected = !isModelReleaseSelected;
                        });
                      },
                      selected: isModelReleaseSelected,
                      selectedColor: Colors.grey,
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    InputChip(
                      avatar: const Icon(Icons.star),
                      label: Text(
                        "Property Release",
                        style: GoogleFonts.poppins(),
                      ),
                      onSelected: (bool newBool) {
                        setState(() {
                          isPropertyReleaseSelected =
                              !isPropertyReleaseSelected;
                        });
                      },
                      selected: isPropertyReleaseSelected,
                      selectedColor: Colors.grey,
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Expanded(
                // height: 700,
                child: MasonryGridView.builder(
                  itemCount: 10,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/image${index + 1}.jpg'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 310,
                            child: Column(
                              children: [
                                ListTile(
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Orientation",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {},
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Text(
                                    "Landscape",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {},
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Text(
                                    "Portratit",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {},
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Text(
                                    "Panoramic",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {},
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Text(
                                    "Square",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {},
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Text(
                                    "All",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text(
                    "Orientation",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const VerticalDivider(
                  thickness: 2,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 210,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {},
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Licence",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {},
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Text(
                                    "RE",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {},
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Text(
                                    "RM",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {},
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Text(
                                    "Either",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text(
                    "Licence   ",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
