// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "YourCartIsEmptyMessage": MessageLookupByLibrary.simpleMessage(
      " Your Cart is Empty",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Mini Cart"),
    "buttonAddToCart": MessageLookupByLibrary.simpleMessage("Add To Cart"),
    "deleteItemConfirmationMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to remove this item from the cart?",
    ),
    "deleteItemMessage": MessageLookupByLibrary.simpleMessage(
      "Item Removed Successfully",
    ),
    "errorGeneric": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "itemAddedMessage": MessageLookupByLibrary.simpleMessage("Added to cart"),
    "noMessage": MessageLookupByLibrary.simpleMessage("No"),
    "productTitle": MessageLookupByLibrary.simpleMessage("Product List"),
    "removeItemTitle": MessageLookupByLibrary.simpleMessage("Remove Item"),
    "version": MessageLookupByLibrary.simpleMessage("1.0"),
    "yesMessage": MessageLookupByLibrary.simpleMessage("Yes"),
    "yourCartTitle": MessageLookupByLibrary.simpleMessage("Your Cart"),
  };
}
