import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PhoneCard extends StatelessWidget {
  PhoneCard({Key? key, required this.image, this.isLiked,required this.price, required this.name})
      : super(key: key);
  String image;
  bool? isLiked;
  String name;
  String price;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                height: size / 2.5,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: isLiked!
                      ? const Icon(Icons.favorite, color: Colors.blue)
                      : const Icon(Icons.favorite_border_outlined,
                          color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.w800),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text('\$$price',
              style: const TextStyle(fontSize: 32, fontFamily: 'avenir')),
        ]),
      ),
    );
  }
}
