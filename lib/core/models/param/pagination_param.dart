class PaginationParam {
  final int page;
  final int limit;

  const PaginationParam({
    this.page = 1,
    this.limit = 50,
  });

  static const empty = PaginationParam();
}
