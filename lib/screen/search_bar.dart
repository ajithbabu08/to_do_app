// // import 'package:flutter/material.dart';
// //
// // class SearchBarDelegate extends SearchDelegate<String> {
// //   List tasks=[];
// //
// //   SearchBarDelegate(this.tasks);
// //
// //   @override
// //   List<Widget> buildActions(BuildContext context) {
// //     // Actions for the search bar (e.g., clear the search query).
// //     return [
// //       IconButton(
// //         icon: Icon(Icons.clear),
// //         onPressed: () {
// //           query = '';
// //         },
// //       ),
// //     ];
// //   }
//
//
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // Build the results based on the search query.
//     final searchResults = tasks.where((task) {
//       return task[0].toLowerCase().contains(query.toLowerCase());
//     }).toList();
//
//     return ListView.builder(
//       itemCount: searchResults.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(searchResults[index][0]),
//           onTap: () {
//             // Handle when a search result is tapped.
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // Build suggestions as the user types (optional).
//     final suggestions = tasks.where((task) {
//       return task[0].toLowerCase().contains(query.toLowerCase());
//     }).toList();
//
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(suggestions[index][0]),
//           onTap: () {
//             // Handle when a suggestion is tapped.
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     throw UnimplementedError();
//   }
// }
