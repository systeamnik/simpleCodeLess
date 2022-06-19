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
        "auth": MessageLookupByLibrary.simpleMessage("Authorization"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "counterValue": MessageLookupByLibrary.simpleMessage("Counter value"),
        "dead": MessageLookupByLibrary.simpleMessage("Dead"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "findPerson": MessageLookupByLibrary.simpleMessage("Find a character"),
        "inputErrorLoginInShort": MessageLookupByLibrary.simpleMessage(
            "Login must provide at least 3 characters"),
        "inputErrorPasswordInShort": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 8 characters"),
        "inputLoginAndPassword": MessageLookupByLibrary.simpleMessage(
            "Enter your login and password"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "live": MessageLookupByLibrary.simpleMessage("Live"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "mainScreenTitle": MessageLookupByLibrary.simpleMessage("Main screen"),
        "man": MessageLookupByLibrary.simpleMessage("Male"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "people": MessageLookupByLibrary.simpleMessage("People"),
        "personCount": MessageLookupByLibrary.simpleMessage("Total characters"),
        "personScreenTitle":
            MessageLookupByLibrary.simpleMessage("List of characters"),
        "russian": MessageLookupByLibrary.simpleMessage("Russian"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "woman": MessageLookupByLibrary.simpleMessage("Female")
      };
}
