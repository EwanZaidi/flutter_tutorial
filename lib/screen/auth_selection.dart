import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screen_1.dart';

// ignore: use_key_in_widget_constructors
class AuthSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            SelectionImage(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Discover your Pokemon here !",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Explore all the pokemons here",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      color: Colors.white,
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenOne(counter: 1),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class SelectionImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: Colors.purple,
        image: const DecorationImage(
          image: NetworkImage(
            "https://legends.pokemon.com/assets/pokemon/pokemon_rowlet.png",
          ),
          scale: 3,
        ),
      ),
    );
  }
}
