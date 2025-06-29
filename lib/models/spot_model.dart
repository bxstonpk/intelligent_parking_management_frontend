// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class SpotModel {
  String? sId;
  String? timestamp;
  String? imgPath;
  String? cameraId;
  List<ParkingSpots>? parkingSpots;
  Summary? summary;

  SpotModel(
      {this.sId,
      this.timestamp,
      this.imgPath,
      this.cameraId,
      this.parkingSpots,
      this.summary});

  SpotModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    timestamp = json['timestamp'];
    imgPath = json['img_path'];
    cameraId = json['camera_id'];
    if (json['parking_spots'] != null) {
      parkingSpots = <ParkingSpots>[];
      json['parking_spots'].forEach((v) {
        parkingSpots!.add(new ParkingSpots.fromJson(v));
      });
    }
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['timestamp'] = this.timestamp;
    data['img_path'] = this.imgPath;
    data['camera_id'] = this.cameraId;
    if (this.parkingSpots != null) {
      data['parking_spots'] =
          this.parkingSpots!.map((v) => v.toJson()).toList();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class ParkingSpots {
  String? spotName;
  bool? isOccupied;
  List<int>? bbox;

  ParkingSpots({this.spotName, this.isOccupied, this.bbox});

  ParkingSpots.fromJson(Map<String, dynamic> json) {
    spotName = json['spot_name'];
    isOccupied = json['is_occupied'];
    bbox = json['bbox'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spot_name'] = this.spotName;
    data['is_occupied'] = this.isOccupied;
    data['bbox'] = this.bbox;
    return data;
  }
}

class Summary {
  int? totalSpots;
  int? occupiedCount;
  int? availableCount;

  Summary({this.totalSpots, this.occupiedCount, this.availableCount});

  Summary.fromJson(Map<String, dynamic> json) {
    totalSpots = json['total_spots'];
    occupiedCount = json['occupied_count'];
    availableCount = json['available_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_spots'] = this.totalSpots;
    data['occupied_count'] = this.occupiedCount;
    data['available_count'] = this.availableCount;
    return data;
  }
}
