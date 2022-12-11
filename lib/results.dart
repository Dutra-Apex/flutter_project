import 'database_helper.dart';

class Results {
  int id;
  int hours;
  int review;

  Results(this.id, this.hours, this.review);

  Results.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    hours = map['hours'];
    review = map['review'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnHours: hours,
      DatabaseHelper.columnReview: review,
    };
  }
}