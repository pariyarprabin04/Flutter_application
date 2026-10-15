import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceGameScreen(),
    );
  }
}

class DiceGameScreen extends StatefulWidget {
  const DiceGameScreen({super.key});

  @override
  State<DiceGameScreen> createState() => _DiceGameScreenState();
}

class _DiceGameScreenState extends State<DiceGameScreen> {
  // Initial dice numbers for Player 1 and Player 2
  int player1Dice = 1;
  int player2Dice = 2;

  // Function to randomize dice values
  void rollDice() {
    setState(() {
      player1Dice = Random().nextInt(6) + 1;
      player2Dice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine the winner text dynamically
    String winnerText;
    if (player1Dice > player2Dice) {
      winnerText = 'Winner: Player 1';
    } else if (player2Dice > player1Dice) {
      winnerText = 'Winner: Player 2';
    } else {
      winnerText = 'It\'s a Draw!';
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0D6B50),
        appBar: AppBar(
        title: const Text(
          'Dice Game',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor:   const Color(0xFF0D6B50),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Winner Display
            Text(
              winnerText,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            
            // Player Columns with Image.asset referencing the 'images/' folder
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Player 1 Section
                Column(
                  children: [
                    const Text(
                      'Player 1',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: Image.asset(
                        'images/dice$player1Dice.png', // Loads image dynamically
                        width: 120,
                        height: 120,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$player1Dice',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                
                // Player 2 Section
                Column(
                  children: [
                    const Text(
                      'Player 2',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: Image.asset(
                        'images/dice$player2Dice.png', // Loads image dynamically
                        width: 120,
                        height: 120,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$player2Dice',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            
            // Roll Button
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
              child: const Text(
                'Start your roll',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}