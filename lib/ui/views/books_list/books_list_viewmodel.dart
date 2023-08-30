import 'package:bookshelf/app/app.locator.dart';
import 'package:bookshelf/app/app.logger.dart';
import 'package:bookshelf/app/app.router.dart';
import 'package:bookshelf/models/book.dart';
import 'package:bookshelf/services/api_service.dart';
import 'package:bookshelf/ui/views/books_list/books_list_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String kBooksListKey = 'books-list';

class BooksListViewModel extends FutureViewModel<List<Book>>
    with FormStateHelper
    implements FormViewModel {
  final _logger = getLogger('BooksListViewModel');
  final _api = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  @override
  Future<List<Book>> futureToRun() => getBooks();

  Future<List<Book>> getBooks({String searchTerm = 'computers'}) async {
    _logger.i('searchTerm:$searchTerm');

    return await _api.getBooks(searchTerm: searchTerm);
  }

  Future<void> submit() async {
    _logger.i('');

    if (!isFormValid) return;

    data = await runBusyFuture(
      _api.getBooks(searchTerm: searchTermValue!),
      busyObject: kBooksListKey,
    );
  }

  void onTap(Book book) {
    _logger.i('');

    _navigationService.navigateToBookDetailsView(book: book);
  }
}
