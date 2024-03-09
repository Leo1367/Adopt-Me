import 'package:adopt_me/service/colors.dart';
import 'package:adopt_me/service/listpet.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedChipIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/userprofile.png',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'good morning!',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          Text(
                            "Shivangi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/notification.png',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.all(15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.grey)),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/search.png',
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStyledChip('All', 1),
                  _buildStyledChip('Dogs', 2),
                  _buildStyledChip('Cats', 3),
                  _buildStyledChip('Robbits', 4),
                ],
              ),
              Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  children: pets,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        enableFeedback: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? primaryColor : secondaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: currentIndex == 1 ? primaryColor : secondaryColor,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: currentIndex == 2 ? primaryColor : secondaryColor,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin,
              color: currentIndex == 3 ? primaryColor : secondaryColor,
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }

  Widget _buildStyledChip(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedChipIndex = index; // Atualiza o índice do chip clicado
        });
      },
      child: Chip(
        avatar: Image.asset(
          'assets/images/category.png',
        ),
        label: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedChipIndex == index
                ? Colors.white
                : Colors.black, // Define a cor do texto do chip selecionado
          ),
        ),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: selectedChipIndex == index
            ? primaryColor
            : Colors.white, // Define a cor de fundo do chip selecionado
      ),
    );
  }
}
