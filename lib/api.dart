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

  static final ApiResponse NotImplemented = ApiResponse(StatusCode.notImplemented, null, "Call not implemented yet"); //temporary

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

class User {
  final String name;
  final String surname;
  final String email;
  final String? password; //optional, only for creating user

  User(this.name, this.surname, this.email, [this.password]);
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

// :: :: ::    :: :: ::    :: :: ::    :: :: ::
//    ::       ::          ::             ::   
//    ::       :: :: ::    :: :: ::       ::   
//    ::       ::                ::       ::   
//    ::       :: :: ::    :: :: ::       ::   


// test data

User sash = User("Sasha", "Dummass", "Hey@gmai.com", "HASHHASH");
User sam = User("Same", "Dummier", "tenony@gmail.com");
User third = User("Hacker", "H", "mail@mail.com");

User alex = User("Alex", "Johnson", "alex@gmail.com", "ALEXHASH");
User maria = User("Maria", "Smith", "maria@gmail.com");
User peter = User("Peter", "Brown", "peter@gmail.com");
User lucia = User("Lucia", "Novak", "lucia@gmail.com");
User tom = User("Tom", "Wilson", "tom@gmail.com");
User nina = User("Nina", "Miller", "nina@gmail.com");

// Chats

Chat sashSamChat = Chat(
    sash,
    sam,
    List.filled(3, Message(sash, "Heyyyyyyyyyy", DateTime.now()))
);

Chat alexMariaChat = Chat(
    alex,
    maria,
    [
      Message(alex, "Hey, did you find my backpack?", DateTime.now()),
      Message(maria, "Not yet, sorry!", DateTime.now()),
      Message(alex, "No worries, thanks!", DateTime.now()),
    ]
);

Chat peterLuciaChat = Chat(
    peter,
    lucia,
    [
      Message(peter, "Hi! I think I found your keys.", DateTime.now()),
      Message(lucia, "Really? Where?", DateTime.now()),
      Message(peter, "Near the main entrance.", DateTime.now()),
    ]
);

Chat tomNinaChat = Chat(
    tom,
    nina,
    [
      Message(tom, "Hello!", DateTime.now()),
      Message(nina, "Hey, what's up?", DateTime.now()),
    ]
);

// Locations

Place zz = Place(0, 0, 5);
Place bratislava = Place(48.1486, 17.1077, 5);
Place kosice = Place(48.7164, 21.2611, 5);
Place prague = Place(50.0755, 14.4378, 5);
Place trnava = Place(48.3774, 17.5872, 5);
Place zilina = Place(49.2231, 18.7394, 5);
Place nitra = Place(48.3064, 18.0764, 5);
Place banskaBystrica = Place(48.7363, 19.1462, 5);

// Posts

PostData sashLost = PostData(
    false,
    "Batoh",
    "Batohovy",
    DateTime.now(),
    List.filled(1, zz)
);

PostData samoFound = PostData(
    true,
    "Batoh",
    "Batohovy",
    DateTime.now(),
    List.filled(1, zz)
);

PostData alexLost = PostData(
    false,
    "Black wallet",
    "Black leather wallet with some cards inside",
    DateTime.now(),
    [bratislava]
);

PostData mariaFound = PostData(
    true,
    "Keys",
    "Set of 3 keys with a small red keychain",
    DateTime.now(),
    [kosice]
);

PostData peterLost = PostData(
    false,
    "Phone",
    "Black Samsung phone with a cracked screen",
    DateTime.now(),
    [prague]
);

PostData luciaFound = PostData(
    true,
    "Headphones",
    "White wireless headphones in a small case",
    DateTime.now(),
    [trnava]
);

PostData tomLost = PostData(
    false,
    "Watch",
    "Silver wristwatch with a brown leather strap",
    DateTime.now(),
    [zilina]
);

PostData ninaFound = PostData(
    true,
    "Umbrella",
    "Blue folding umbrella left on a bus",
    DateTime.now(),
    [nitra]
);

PostData alexFound = PostData(
    true,
    "Laptop",
    "Grey laptop found in the university library",
    DateTime.now(),
    [banskaBystrica]
);

PostData peterLost2 = PostData(
    false,
    "Sunglasses",
    "Black sunglasses in a hard case",
    DateTime.now(),
    [bratislava]
);

// All posts

List posts = List.from([
  sashLost,
  samoFound,
  alexLost,
  mariaFound,
  peterLost,
  luciaFound,
  tomLost,
  ninaFound,
  alexFound,
  peterLost2
]);

// All users

List users = List.from([
  sash,
  sam,
  third,
  alex,
  maria,
  peter,
  lucia,
  tom,
  nina
]);

// All chats

List chats = List.from([
  sashSamChat,
  alexMariaChat,
  peterLuciaChat,
  tomNinaChat
]);

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