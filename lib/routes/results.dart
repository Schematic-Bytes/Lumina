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
  bool isSelected = false;

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
          margin: const EdgeInsets.only(left: 15, right: 15, top: 1),
          child: Column(
            children: [
              SizedBox(
                height: 35,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    InputChip(
                      avatar: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/originals/19/bf/64/19bf642f3b4b21127d53d5b41c28add5.jpg"),
                      ),
                      label: const Text(
                        "Landscape",
                      ),
                      onSelected: (bool newBool) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      selected: isSelected,
                      selectedColor: Colors.grey,
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    InputChip(
                      avatar: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/originals/19/bf/64/19bf642f3b4b21127d53d5b41c28add5.jpg"),
                      ),
                      label: const Text(
                        "Portrait",
                      ),
                      onSelected: (bool newBool) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      selected: isSelected,
                      selectedColor: Colors.grey,
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    InputChip(
                      avatar: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/originals/19/bf/64/19bf642f3b4b21127d53d5b41c28add5.jpg"),
                      ),
                      label: const Text(
                        "4K",
                      ),
                      onSelected: (bool newBool) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      selected: isSelected,
                      selectedColor: Colors.grey,
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    InputChip(
                      avatar: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/originals/19/bf/64/19bf642f3b4b21127d53d5b41c28add5.jpg"),
                      ),
                      label: const Text(
                        "Itachi",
                      ),
                      onSelected: (bool newBool) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      selected: isSelected,
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
                  onTap: () {},
                  child: Text(
                    "Orientation",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text("|"),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Landscape",
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
