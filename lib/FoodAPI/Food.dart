class Food {
  String? productName;
  DateTime? expiryDate;

Food();

Map<String, dynamic> toJson() => {'productName':productName,'expiryDate':expiryDate};

Food.fromSnapshot(snapshot)
  : productName = snapshot.data()['productName'],
    expiryDate = snapshot.data()['expiryDate'].toDate();
}