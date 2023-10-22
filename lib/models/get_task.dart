// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  int id;
  int warehouse_id;
  int forklift_id;
  int path_id;
  Task({
    required this.id,
    required this.warehouse_id,
    required this.forklift_id,
    required this.path_id,
  });
  

  Task copyWith({
    int? id,
    int? warehouse_id,
    int? forklift_id,
    int? path_id,
  }) {
    return Task(
      id: id ?? this.id,
      warehouse_id: warehouse_id ?? this.warehouse_id,
      forklift_id: forklift_id ?? this.forklift_id,
      path_id: path_id ?? this.path_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'warehouse_id': warehouse_id,
      'forklift_id': forklift_id,
      'path_id': path_id,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int,
      warehouse_id: map['warehouse_id'] as int,
      forklift_id: map['forklift_id'] as int,
      path_id: map['path_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(id: $id, warehouse_id: $warehouse_id, forklift_id: $forklift_id, path_id: $path_id)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.warehouse_id == warehouse_id &&
      other.forklift_id == forklift_id &&
      other.path_id == path_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      warehouse_id.hashCode ^
      forklift_id.hashCode ^
      path_id.hashCode;
  }
}
