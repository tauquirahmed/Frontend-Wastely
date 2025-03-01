class complaintModel {
  List<Complaints>? complaints;
  String? username;

  complaintModel({this.complaints, this.username});

  complaintModel.fromJson(Map<String, dynamic> json) {
    if (json['complaints'] != null) {
      complaints = <Complaints>[];
      json['complaints'].forEach((v) {
        complaints!.add(new Complaints.fromJson(v));
      });
    }
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.complaints != null) {
      data['complaints'] = this.complaints!.map((v) => v.toJson()).toList();
    }
    data['username'] = this.username;
    return data;
  }
}

class Complaints {
  int? id;
  String? location;
  String? description;
  String? image;
  String? createdAt;
  String? status;

  Complaints(
      {this.id, this.location, this.description, this.image, this.createdAt});

  Complaints.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['location'] = location;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['status'] = status;
    return data;
  }
}
