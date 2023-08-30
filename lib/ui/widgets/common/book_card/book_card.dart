import 'package:bookshelf/models/book.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final void Function()? onTap;
  const BookCard({super.key, required this.book, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: book.imageLinks == null
            ? Image.asset(
                'assets/images/no-image.jpeg',
                fit: BoxFit.fill,
              )
            : Image.network(
                book.imageLinks!.smallThumbnail,
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
