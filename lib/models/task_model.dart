class TaskModel {
  String? id;
  String? title;
  bool? isCompleted;

  TaskModel({this.title, this.isCompleted});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['id'] = id;
    data['title'] = title;
    data['isCompleted'] = isCompleted;
    return data;
  }
}
