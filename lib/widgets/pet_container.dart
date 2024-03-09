import 'package:adopt_me/service/colors.dart';
import 'package:adopt_me/service/constants.dart';
import 'package:flutter/material.dart';

class PetContainer extends StatelessWidget {
  final String name;
  final String age;
  final String breed;
  final String distance;
  final String imagePet;

  const PetContainer({
    super.key,
    required this.name,
    required this.age,
    required this.breed,
    required this.distance,
    required this.imagePet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: boxShadow,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePet,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(color: primaryColor),
                        ),
                        Text(age),
                      ],
                    ),
                    Row(
                      children: [
                        Text(breed),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        Text(distance),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const Positioned(
            right: 5,
            top: 1,
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
