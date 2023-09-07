import 'package:bookshelf/fake_data/fake_model.dart';
import 'package:bookshelf/models/book.dart';
import 'package:bookshelf/models/image_links.dart';

class FakeBook extends FakeModel<Book> {
  @override
  Book generateFake() {
    final thumbnailImage = faker.image.image();
    return Book(
      authors: [
        faker.person.name(),
        faker.person.name(),
      ],
      title: faker.company.name(),
      imageLinks: ImageLinks(
        smallThumbnail: thumbnailImage,
        thumbnail: thumbnailImage,
      ),
      description: faker.lorem.sentences(5).join(''),
    );
  }
}
