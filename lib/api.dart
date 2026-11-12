library api;

class Place{
  final double x;
  final double y;
  final double areaSize;

  Place(this.x, this.y, this.areaSize);
  

}

class PostData{
  //image,
  final bool found; //true if the type is FOUND, false if its LOST
  final String name;
  final String description;
  final DateTime dateTime;
  final List<Place> places;
  //List of places ()


  PostData(this.found, this.name,this.description, this.dateTime, this.places);
}

