// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("Mini Carrito"),
    "buttonAddToCart": MessageLookupByLibrary.simpleMessage(
      "Añadir al carrito",
    ),
    "deleteItemConfirmationMessage": MessageLookupByLibrary.simpleMessage(
      "¿Está seguro de que desea eliminar este artículo del carrito?",
    ),
    "deleteItemMessage": MessageLookupByLibrary.simpleMessage(
      "Artículo eliminado con éxito",
    ),
    "errorGeneric": MessageLookupByLibrary.simpleMessage("Algo salió mal"),
    "itemAddedMessage": MessageLookupByLibrary.simpleMessage(
      "Añadido al carrito",
    ),
    "noMessage": MessageLookupByLibrary.simpleMessage("No"),
    "productTitle": MessageLookupByLibrary.simpleMessage("Lista de productos"),
    "removeItemTitle": MessageLookupByLibrary.simpleMessage(
      "Eliminar artículo",
    ),
    "version": MessageLookupByLibrary.simpleMessage("1.0"),
    "yesMessage": MessageLookupByLibrary.simpleMessage("Sí"),
    "yourCartTitle": MessageLookupByLibrary.simpleMessage("Tu carrito"),
  };
}
