import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:lumina/requests/client.dart';
import 'package:lumina/routes/results.dart';
import 'package:provider/provider.dart';

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
                  child: SearchInput(key: key),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _controller = TextEditingController();
  String? initialStringValue;

  @override
  Widget build(BuildContext context) {
    final client = context.read<Client>();
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Search Photo",
        border: InputBorder.none,
        prefixIcon: IconButton(
          color: Colors.black,
          icon: const Icon(
            Icons.image_search,
          ),
          onPressed: () async {
            final result =
                await FilePicker.platform.pickFiles(type: FileType.image);
            if (result != null) {
              PlatformFile file = result.files.first;
              final label = await client.predict(file.path!);
              setState(() {
                _controller.text = label;
              });
            }
          },
        ),
        suffixIcon: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.search),
          onPressed: () {
            _controller.text == ""
                ? null
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(query: _controller.text),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
