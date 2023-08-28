import 'package:bookshelf/app/app.locator.dart';
import 'package:bookshelf/app/app.logger.dart';
import 'package:bookshelf/app/app.router.dart';
import 'package:bookshelf/models/book.dart';
import 'package:bookshelf/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BooksListViewModel extends FutureViewModel<List<Book>> {
  final _logger = getLogger('BooksListViewModel');
  final _api = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  @override
  Future<List<Book>> futureToRun() => getBooks();

  Future<List<Book>> getBooks({String genreType = 'computers'}) async {
    _logger.i('');

    return (await _api.getBooks(genreType: genreType)).toList();
  }

  void onTap(Book book) {
    _logger.wtf(book.title);

    _navigationService.navigateToBookDetailsView(book: book);
  }
}