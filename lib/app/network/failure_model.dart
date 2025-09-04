class Failure {
  final String title;
  final int status;

  Failure(this.title, {this.status = 0});

  @override
  String toString() {
    if (status != null) {
      return 'Error $status: $title';
    }
    return 'Error: $title';
  }
}
