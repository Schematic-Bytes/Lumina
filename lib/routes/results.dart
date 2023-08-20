import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lumina/requests/client.dart';
import 'package:lumina/requests/model.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
  final String query;
  const Result({super.key, required this.query});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool isModelReleaseSelected = false;
  bool isPropertyReleaseSelected = false;
  String orientation = "all";

  @override
  Widget build(BuildContext context) {
    final client = context.read<Client>();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.query,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "10 Items",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 13,
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 1,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InputChip(
                        backgroundColor: Colors.transparent,
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
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InputChip(
                        backgroundColor: Colors.transparent,
                        label: Text(
                          "Property Release",
                          style: GoogleFonts.poppins(),
                        ),
                        onSelected: (bool newBool) {
                          setState(() {
                            isPropertyReleaseSelected = !isPropertyReleaseSelected;
                          });
                        },
                        selected: isPropertyReleaseSelected,
                        selectedColor: Colors.grey,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(8)),
              FutureBuilder<Iterable<ImageObjs>>(
                  future: client.getImages(
                    widget.query,
                    isModelReleaseSelected,
                    isPropertyReleaseSelected,
                    orientation,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }
                    if (snapshot.hasData) {
                      final data = snapshot.data!;

                      return Expanded(
                        // height: 700,
                        child: MasonryGridView.builder(
                            itemCount: data.length,
                            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              final currentItem = data.elementAt(index);
                              return Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: InkResponse(
                                  onTap: () {
                                    showModalBottomSheet(
                                      useSafeArea: true,
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  currentItem.filename,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              ClipRRect(
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                                child: Image.network(currentItem.thumbnailUrl),
                                              ),
                                              const SizedBox(height: 20),
                                              Text(
                                                currentItem.caption,
                                                style: GoogleFonts.poppins(fontSize: 16),
                                              ),
                                              const Spacer(),
                                              Align(
                                                alignment: Alignment.bottomRight,
                                                child: Container(
                                                  decoration:
                                                      BoxDecoration(border: Border.all(), shape: BoxShape.circle),
                                                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.download)),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(currentItem.thumbnailUrl),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })
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
                          var refreshWithOrientation = (orientation) {
                            setState(() {
                              orientation = orientation;
                            });
                          };

                          return SizedBox(
                            height: 310,
                            child: Column(
                              children: [
                                ListTile(
                                  visualDensity: const VisualDensity(vertical: -4),
                                  title: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Orientation",
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    refreshWithOrientation("landscape");
                                  },
                                  visualDensity: const VisualDensity(vertical: -4),
                                  title: Text(
                                    "Landscape",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {
                                    refreshWithOrientation("portrait");
                                  },
                                  visualDensity: const VisualDensity(vertical: -4),
                                  title: Text(
                                    "Portrait",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {
                                    refreshWithOrientation("panoramic");
                                  },
                                  visualDensity: const VisualDensity(vertical: -4),
                                  title: Text(
                                    "Panoramic",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {
                                    refreshWithOrientation("square");
                                  },
                                  visualDensity: const VisualDensity(vertical: -4),
                                  title: Text(
                                    "Square",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {
                                    refreshWithOrientation("all");
                                  },
                                  visualDensity: const VisualDensity(vertical: -4),
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
                    style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
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
                                  visualDensity: const VisualDensity(vertical: -4),
                                  title: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "License",
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {},
                                  visualDensity: const VisualDensity(vertical: -4),
                                  title: Text(
                                    "RE",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {},
                                  visualDensity: const VisualDensity(vertical: -4),
                                  title: Text(
                                    "RM",
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                                const Divider(thickness: 1),
                                ListTile(
                                  onTap: () {},
                                  visualDensity: const VisualDensity(vertical: -4),
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
                    "License   ",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
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
