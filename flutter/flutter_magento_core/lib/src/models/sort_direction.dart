/// Sort direction for queries.
enum SortDirection {
  /// Ascending order (A-Z, 0-9, oldest first).
  asc,

  /// Descending order (Z-A, 9-0, newest first).
  desc;

  /// Returns the GraphQL string representation.
  String toGraphQl() => name.toUpperCase();

  /// Creates from string value.
  static SortDirection fromString(String value) {
    return SortDirection.values.firstWhere(
      (dir) => dir.name == value.toLowerCase(),
      orElse: () => SortDirection.asc,
    );
  }
}
