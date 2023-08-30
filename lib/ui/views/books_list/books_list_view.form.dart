// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:bookshelf/ui/views/books_list/books_list_validator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String SearchTermValueKey = 'searchTerm';

final Map<String, TextEditingController> _BooksListViewTextEditingControllers =
    {};

final Map<String, FocusNode> _BooksListViewFocusNodes = {};

final Map<String, String? Function(String?)?> _BooksListViewTextValidations = {
  SearchTermValueKey: BooksListValidator.validate,
};

mixin $BooksListView {
  TextEditingController get searchTermController =>
      _getFormTextEditingController(SearchTermValueKey);

  FocusNode get searchTermFocusNode => _getFormFocusNode(SearchTermValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_BooksListViewTextEditingControllers.containsKey(key)) {
      return _BooksListViewTextEditingControllers[key]!;
    }

    _BooksListViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _BooksListViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_BooksListViewFocusNodes.containsKey(key)) {
      return _BooksListViewFocusNodes[key]!;
    }
    _BooksListViewFocusNodes[key] = FocusNode();
    return _BooksListViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    searchTermController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    searchTermController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          SearchTermValueKey: searchTermController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _BooksListViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _BooksListViewFocusNodes.values) {
      focusNode.dispose();
    }

    _BooksListViewTextEditingControllers.clear();
    _BooksListViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get searchTermValue =>
      this.formValueMap[SearchTermValueKey] as String?;

  set searchTermValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SearchTermValueKey: value}),
    );

    if (_BooksListViewTextEditingControllers.containsKey(SearchTermValueKey)) {
      _BooksListViewTextEditingControllers[SearchTermValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasSearchTerm =>
      this.formValueMap.containsKey(SearchTermValueKey) &&
      (searchTermValue?.isNotEmpty ?? false);

  bool get hasSearchTermValidationMessage =>
      this.fieldsValidationMessages[SearchTermValueKey]?.isNotEmpty ?? false;

  String? get searchTermValidationMessage =>
      this.fieldsValidationMessages[SearchTermValueKey];
}

extension Methods on FormViewModel {
  setSearchTermValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchTermValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    searchTermValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      SearchTermValueKey: getValidationMessage(SearchTermValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _BooksListViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _BooksListViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      SearchTermValueKey: getValidationMessage(SearchTermValueKey),
    });
