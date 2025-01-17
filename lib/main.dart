import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'node.dart';
import 'package:audioplayers/audioplayers.dart';

List<Node> listOfNodes = [];
List<Node> decisionMap = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //POPULATE LIST CODE
  String csv = "my_map.csv";
  String fileData = await rootBundle.loadString(csv);
  print(fileData);  //test data is loaded.

  List<String> rows = fileData.split("\n");
  for (int i = 0; i < rows.length; i++) {
    //selects an item from row and places
    String row = rows[i];
    List<String> itemInRow = row.split(",");

    Node node = Node(
      int.parse(itemInRow[0]),
      int.parse(itemInRow[1]),
      int.parse(itemInRow[2]),
      int.parse(itemInRow[3]),
      int.parse(itemInRow[4]),
      itemInRow[5],
      itemInRow[6],
      itemInRow[7],
      itemInRow[8],
      itemInRow[9],
      double.parse(itemInRow[10]),
      double.parse(itemInRow[11]),
    );

    decisionMap.add(node);
  }

  runApp(
    const MaterialApp(
      home: MyFlutterApp(),
    ),
  );
}

class MyFlutterApp extends StatefulWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyFlutterState();
  }
}

class MyFlutterState extends State<MyFlutterApp> {
  bool isGameStarted = false; // Track whether the game has started
  String difficulty = 'Medium'; // Default difficulty
  int maxAttempts = 2; // Default attempts for medium difficulty
  int currentAttempts = 0; // Track current attempts

  // AUDIO
  final audioPlayer = AudioPlayer();
  String audioUrl = "";

  // Variables
  late int iD;
  late int solution1;
  late int solution2;
  late int solution3;
  late int solution4;
  String question = "";
  String answer1 = "";
  String answer2 = "";
  String answer3 = "";
  String answer4 = "";
  late double axis_x;
  late double axis_y;
  bool showTryAgain = false;

  // Hero image position
  late double heroPositionX = axis_x; // Horizontal position of hero (relative to the maze)
  late double heroPositionY = axis_y; // Vertical position of hero (relative to the maze)

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        Node current = decisionMap.first;
        if (current != null) {
          iD = current.iD;
          solution1 = current.solution1;
          solution2 = current.solution2;
          solution3 = current.solution3;
          solution4 = current.solution4;
          question = current.question;
          answer1 = current.answer1;
          answer2 = current.answer2;
          answer3 = current.answer3;
          answer4 = current.answer4;
          axis_x = current.axis_x;
          axis_y = current.axis_y;
        }
      });
    });
  }

  // Handle when the player makes a wrong answer
  void handleWrongAnswer() {
    setState(() {
      currentAttempts++;
      maxAttempts--; // Reduce a life
      showTryAgain = true;

      if (maxAttempts < 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Scaffold(
                  //backgroundColor: Colors.black,
                  body: Center(
                    child: Image.asset('game_over.png'),
                  ),
                ),
          ),
        );
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            showTryAgain = false;
          });
        });
      }
    });
  }

  // Handlers to move the hero (update position based on the solution)
  void answer1Handler() {
    setState(() {
      bool correct = false;
      for (Node nextNode in decisionMap) {
        if (nextNode.iD == iD + 1) {
          if (solution1 == 2) {
            correct = true;
            iD = nextNode.iD;
            solution1 = nextNode.solution1;
            solution2 = nextNode.solution2;
            solution3 = nextNode.solution3;
            solution4 = nextNode.solution4;
            question = nextNode.question;
            answer1 = nextNode.answer1;
            answer2 = nextNode.answer2;
            answer3 = nextNode.answer3;
            answer4 = nextNode.answer4;
            axis_x = nextNode.axis_x;
            axis_y = nextNode.axis_y;
            break;
          }
        }
      }
      if (!correct) handleWrongAnswer();
    });
  }

  void answer2Handler() {
    setState(() {
      bool correct = false;
      for (Node nextNode in decisionMap) {
        if (nextNode.iD == iD + 1) {
          if (solution2 == 2) {
            correct = true;
            iD = nextNode.iD;
            solution1 = nextNode.solution1;
            solution2 = nextNode.solution2;
            solution3 = nextNode.solution3;
            solution4 = nextNode.solution4;
            question = nextNode.question;
            answer1 = nextNode.answer1;
            answer2 = nextNode.answer2;
            answer3 = nextNode.answer3;
            answer4 = nextNode.answer4;
            axis_x = nextNode.axis_x;
            axis_y = nextNode.axis_y;
            break;
          }
        }
      }
      if (!correct) handleWrongAnswer();
    });
  }

  void answer3Handler() {
    setState(() {
      bool correct = false;
      for (Node nextNode in decisionMap) {
        if (nextNode.iD == iD + 1) {
          if (solution3 == 2) {
            correct = true;
            iD = nextNode.iD;
            solution1 = nextNode.solution1;
            solution2 = nextNode.solution2;
            solution3 = nextNode.solution3;
            solution4 = nextNode.solution4;
            question = nextNode.question;
            answer1 = nextNode.answer1;
            answer2 = nextNode.answer2;
            answer3 = nextNode.answer3;
            answer4 = nextNode.answer4;
            axis_x = nextNode.axis_x;
            axis_y = nextNode.axis_y;
            break;
          }
        }
      }
      if (!correct) handleWrongAnswer();
    });
  }

  void answer4Handler() {
    setState(() {
      bool correct = false;
      for (Node nextNode in decisionMap) {
        if (nextNode.iD == iD + 1) {
          if (solution4 == 2) {
            correct = true;
            iD = nextNode.iD;
            solution1 = nextNode.solution1;
            solution2 = nextNode.solution2;
            solution3 = nextNode.solution3;
            solution4 = nextNode.solution4;
            question = nextNode.question;
            answer1 = nextNode.answer1;
            answer2 = nextNode.answer2;
            answer3 = nextNode.answer3;
            answer4 = nextNode.answer4;
            axis_x = nextNode.axis_x;
            axis_y = nextNode.axis_y;
            break;
          }
        }
      }
      if (!correct) handleWrongAnswer();
    });
  }

  // difficulty pop-up screen
  void showdifficultyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text("Settings"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: const Text("Difficulty"),
                  trailing: DropdownButton<String>(
                    value: difficulty,
                    items: <String>['Easy', 'Medium', 'Hard']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        difficulty = newValue!;
                        // Set max attempts based on difficulty
                        if (difficulty == 'Easy') {
                          maxAttempts = 3;
                        } else if (difficulty == 'Medium') {
                          maxAttempts = 2;
                        } else if (difficulty == 'Hard') {
                          maxAttempts = 1;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Display the remaining lives as heart icons
  Widget livesDisplay() {
    return Row(
      children: List.generate(
        maxAttempts,
            (index) =>
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Image.asset(
                'heart.png', // Make sure you have this image
                width: 60,
                height: 60,
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              AudioPlayerWidget(audioPlayer: audioPlayer, audioUrl: audioUrl),
              // Set the background to the galaxy image using BoxDecoration
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('dungeon.jpg'),
                    // Path to your galaxy image
                    fit: BoxFit
                        .cover, // Ensures the image covers the entire background
                  ),
                ),
              ),
              if (isGameStarted)
                AudioPlayerWidget(audioPlayer: audioPlayer, audioUrl: audioUrl),

              // Show the "Start Game" button if the game has not started
              if (!isGameStarted)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'logo.png',
                        height: 600,
                        width: 600,
                        fit: BoxFit.contain,
                      ),
                      //children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            isGameStarted = true; // Start the game
                          });
                        },
                        color: Colors.green,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: const Text(
                          "Start Game",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // difficulty Button
                      MaterialButton(
                        onPressed: showdifficultyDialog,
                        color: Colors.blue,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: const Text(
                          "Difficulty",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Show the game content after the game starts
              if (isGameStarted)
                Align(
                  alignment: const Alignment(1.0, 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Maze Image on the left (only visible after the game starts)
                      Image.asset(
                        'maze2.png',
                        height: 610,
                        width: 600,
                        fit: BoxFit.contain,
                      ),
                      Align(
                        alignment: const Alignment(0.0, -0.8),
                        child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.5,
                          child: Text(
                            question,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 56,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Display remaining lives at the bottom-left corner
              if (isGameStarted)
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: livesDisplay(),
                ),

              if (showTryAgain)
                const Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.close, color: Colors.red, size: 100),
                      Text(
                        'Try Again',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              // Hero Image that moves inside the maze
              if (isGameStarted) // Only show the hero image if the game has started
                Positioned(
                  left: axis_x,
                  top: axis_y,
                  child: Image.asset(
                    'hero1.png',
                    height: 100, // Adjust size of the hero image
                    width: 100,
                  ),
                ),

              // Answer buttons
              if (isGameStarted && iD !=
                  13) // Only show the answer buttons if the game has started
                ...[
                  Align(
                    alignment: const Alignment(0.58, -0.2),
                    child: MaterialButton(
                      onPressed: () {
                        answer1Handler();
                      },
                      color: const Color(0xf0019fa1),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      textColor: const Color(0xfffffdfd),
                      height: 100,
                      minWidth: 380,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        answer1,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.58, 0.1),
                    child: MaterialButton(
                      onPressed: () {
                        answer2Handler();
                      },
                      color: const Color(0xf0019fa1),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      textColor: const Color(0xfffffdfd),
                      height: 100,
                      minWidth: 380,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        answer2,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.58, 0.4),
                    child: MaterialButton(
                      onPressed: () {
                        answer3Handler();
                      },
                      color: const Color(0xf0019fa1),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      textColor: const Color(0xfffffdfd),
                      height: 100,
                      minWidth: 380,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        answer3,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.58, 0.7),
                    child: MaterialButton(
                      onPressed: () {
                        answer4Handler();
                      },
                      color: const Color(0xF0019FA1),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      textColor: const Color(0xfffffdfd),
                      height: 100,
                      minWidth: 380,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        answer4,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ],

              // Display stars as a score based on remaining lives
              if (iD == 13) ...[
                Positioned(
                  bottom: 250,
                  right: 280,
                  child: Row(
                    children: List.generate(
                      3 - currentAttempts, // Show 3 stars minus the number of lives lost
                          (index) =>
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Image.asset(
                              'star.png',
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                    ),
                  ),
                ),
              ],

              // Display "you_win.jpg" and "star.png" when iD == 13
              if (iD == 13) ...[
                Positioned(
                  right: 150,
                  top: -70,
                  child: Column(
                    children: [
                      Image.asset(
                        'you_win.png', // Display you_win.jpg on the right
                        height: 800, // Adjust size of you_win.jpg
                        width: 600,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final String audioUrl;

  AudioPlayerWidget({required this.audioPlayer, required this.audioUrl});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}
class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  bool isPlaying = false; // Track whether audio is playing
  double volume = 1.0; // Volume range from 0.0 to 1.0

  void toggleAudio(bool value) async {
    setState(() {
      isPlaying = value;
    });

    if (isPlaying) {
      String localFilePath = 'assets/maintheme.mp3';
      await widget.audioPlayer.play(localFilePath, isLocal: true);
    } else {
      await widget.audioPlayer.pause();
    }
  }

  // Function to update the volume
  void setVolume(double value) {
    setState(() {
      volume = value;
    });
    widget.audioPlayer.setVolume(volume);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          // PopupMenuButton for both play/pause and volume control
          PopupMenuButton<int>(
            icon: Icon(Icons.settings, size: 50, color: Colors.blue),
            onSelected: (value) {
              if (value == 0) {
                // Toggle Play/Pause
                toggleAudio(!isPlaying);
              }
            },
            itemBuilder: (context) =>
            [
              // Play/Pause Menu Item
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    SizedBox(width: 10),
                    Text(isPlaying ? 'Pause Music' : 'Play Music'),
                  ],
                ),
              ),
              // Volume Control Menu Item
              PopupMenuItem<int>(
                value: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Adjust Volume'),
                    Slider(
                      value: volume,
                      min: 0.0,
                      max: 1.0,
                      onChanged: setVolume,
                    ),
                    Text('${(volume * 100).toStringAsFixed(0)}%'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}