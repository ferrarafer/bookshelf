import 'package:bookshelf/ui/common/ui_helpers.dart';
import 'package:bookshelf/ui/widgets/common/book_card/book_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'books_list_validator.dart';
import 'books_list_view.form.dart';
import 'books_list_viewmodel.dart';

@FormView(
  autoTextFieldValidation: false,
  fields: [
    FormTextField(name: 'searchTerm', validator: BooksListValidator.validate),
  ],
)
class BooksListView extends StackedView<BooksListViewModel>
    with $BooksListView {
  const BooksListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BooksListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Books'), centerTitle: true),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : viewModel.dataReady
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: searchTermController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'search term',
                            ),
                            onFieldSubmitted: (_) => viewModel.submit(),
                          ),
                          if (viewModel.hasSearchTermValidationMessage) ...[
                            verticalSpaceTiny,
                            Text(
                              viewModel.searchTermValidationMessage!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                          verticalSpaceSmall,
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: viewModel.hasAnyValidationMessage
                                  ? null
                                  : viewModel.submit,
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFF514DC3),
                                foregroundColor: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                'Search',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ),
                          verticalSpaceLarge,
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: viewModel.busy(kBooksListKey)
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 30,
                                      mainAxisSpacing: 20,
                                      childAspectRatio: 0.7,
                                    ),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: viewModel.data?.length,
                                    itemBuilder: (context, index) => BookCard(
                                      book: viewModel.data![index],
                                      onTap: () {
                                        viewModel.onTap(viewModel.data![index]);
                                      },
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(BooksListViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(BooksListViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  BooksListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BooksListViewModel();
}
