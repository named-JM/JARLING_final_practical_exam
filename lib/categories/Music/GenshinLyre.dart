import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(GenshinLyre());
}

class GenshinLyre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ensure landscape orientation when navigating to this page
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return WillPopScope(
      onWillPop: () async {
        // Set preferred orientations back to portrait when leaving the page
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('21 Rectangles Grid'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the previous page
              Navigator.pop(context);
              // Set preferred orientations back to portrait when leaving the page
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
            },
          ),
          // Add any additional actions or widgets to the AppBar
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Center(
            child: Container(
              width: 550.0,
              height: 550.0,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Play sound based on the index
                      playSound(index +
                          1); // Index is 0-based, add 1 to match your requirement
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50.0),
                          boxShadow: [
                            //bottom right shadow is darker
                            BoxShadow(
                              color: Colors.grey.shade500,
                              offset: Offset(5, 5),
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),

                            //top left shadow is lighter
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-5, -5),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ]),
                    ),
                  );
                },
                itemCount: 21,
              ),
            ),
          ),
        ),
      ),
    );
  }

//when it comes to problem in assets but the pubspec is good and directories is good. it is much cause of that mfker audio bundle file. find that assets/sounds/
  void playSound(int soundNumber) {
    final player = new AudioPlayer();
    player.play(AssetSource('doremi$soundNumber.mp3'));
  }
}
