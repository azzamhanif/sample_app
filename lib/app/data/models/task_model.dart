class Task {
  String? task;
  String? type;
  String? priority;
  String? timeframe;
  String? description;

  Task({this.task, this.type, this.priority, this.timeframe, this.description});

  Task.fromJson(Map<String, dynamic> json) {
    task = json['task'];
    type = json['type'];
    priority = json['priority'];
    timeframe = json['timeframe'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['task'] = task;
    data['type'] = type;
    data['priority'] = priority;
    data['timeframe'] = timeframe;
    data['description'] = description;
    return data;
  }
}
