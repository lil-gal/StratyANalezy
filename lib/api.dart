library api;

import 'dart:convert';
import 'dart:io';

enum StatusCode{
  success,
  error,
  notImplemented,
}
class ApiResponse<T>{
  final StatusCode statusCode;
  final T? data;
  final String message;

  ApiResponse(this.statusCode, this.data, this.message);

  static final ApiResponse NotImplemented = ApiResponse(StatusCode.notImplemented, null, "Call not implemented yet");

  @override
  String toString() {
    return "${statusCode.name} - ${data == null ? "" : jsonEncode(data)} - $message";
  }
}

// ::    ::    :: :: ::    :: :: ::    :: :: ::
// ::    ::    ::          ::          ::    ::
// ::    ::    :: :: ::    :: :: ::    :: ::   
// ::    ::          ::    ::          ::    ::
// :: :: ::    :: :: ::    :: :: ::    ::    ::

class User{

}

//  :: :: ::    :: :: ::    :: :: ::    :: :: ::
//  ::    ::    ::    ::    ::             ::   
//  :: :: ::    ::    ::    :: :: ::       ::   
//  ::          ::    ::          ::       ::   
//  ::          :: :: ::    :: :: ::       ::   

class Place{
  final double x;
  final double y;
  final double areaSize; //meters

  Place(this.x, this.y, this.areaSize);
  
  Map<String, dynamic> toJson() => {
    'x': x,
    'y': y,
    'areaSize': areaSize,
  };

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

  Map<String, dynamic> toJson() => {
    'found': found,
    'name': name,
    'description': description,
    'dateTime': dateTime.toIso8601String(), // DateTime -> String
    'places': places.map((p) => p.toJson()).toList(),
  };
}


//    :: :: ::    ::    ::    :: :: ::    :: :: ::
//    ::          ::    ::    ::    ::       ::   
//    ::          :: :: ::    :: :: ::       ::   
//    ::          ::    ::    ::    ::       ::   
//    :: :: ::    ::    ::    ::    ::       ::   

class Message{
  final User sender;
  final String content;
  final DateTime time;

  Message(this.sender, this.content, this.time);
}

class Chat{
  final User lostUser;
  final User foundUser;
  final List<Message> messages;

  Chat(this.lostUser, this.foundUser, this.messages);
}



//    :: :: ::    :: :: ::    :: :: :: 
//    ::    ::    ::    ::       ::   
//    :: :: ::    :: :: ::       ::   
//    ::    ::    ::             ::   
//    ::    ::    ::          :: :: ::



void test(){
  print(createPost(PostData(true, "Batoh", "cierny batoh", DateTime.now(), [Place(1,1, 10)])));

}

//USER

ApiResponse getUser(){
  return ApiResponse.NotImplemented;
}

ApiResponse createUser(){
  return ApiResponse.NotImplemented;
}


//POST

ApiResponse createPost(PostData data){
  //File("../temp_db/posts.json").create(recursive: true);
  //File f = File("../temp_db/posts.json");
  //f.writeAsString(jsonEncode(data));
  return ApiResponse(StatusCode.success, data, "Post was created succesfully");
}

ApiResponse getPost(){
  return ApiResponse.NotImplemented;
}

ApiResponse getPosts(){
  return ApiResponse.NotImplemented;
}



//CHAT

ApiResponse createMessage(){
 return ApiResponse.NotImplemented; 
}

ApiResponse getMessage(){
  return ApiResponse.NotImplemented;
}

ApiResponse getMessages(){
  return ApiResponse.NotImplemented;
}