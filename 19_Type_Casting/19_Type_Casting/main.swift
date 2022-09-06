//
//  main.swift
//  19_Type_Casting
//
//  Created by Hamo on 2022/09/06.
//

class MediaItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

var library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

//func changeMoviewDirector(_ director: String) {
//    guard let movie = library[0] as? Movie else {
//        return
//    }
//
//    movie.director = director
//    library[0] = movie
//}
//
//changeMoviewDirector("aaa")
//
//if let movie = library[0] as? Movie {
//    print(movie.director)
//}

//print(type(of: library))
// Array<MediaItem>

//var movieCount = 0
//var songCount = 0
//
//for item in library {
//    switch item {
//    case is Movie:
//        movieCount += 1
//    case is Song:
//        songCount += 1
//    default:
//        break
//    }
//}
//
//for item in library {
//    if item is Movie {
//        movieCount += 1
//    } else if item is Song {
//        songCount += 1
//    }
//}
//
//print("movies: \(movieCount), songs: \(songCount)")

//for item in library {
//    if let movie = item as? Movie {
//        print("Movie: \(movie.name), director: \(movie.director)")
//    } else if let song = item as? Song {
//        print("Song: \(song.name), by \(song.artist)")
//    }
//}
////Movie: Casablanca, director: Michael Curtiz
////Song: Blue Suede Shoes, by Elvis Presley
////Movie: Citizen Kane, director: Orson Welles
////Song: The One And Only, by Chesney Hawkes
////Song: Never Gonna Give You Up, by Rick Astley
//
//var things: [Any] = []
//
//things.append(0)
//things.append(0.0)
//things.append(42)
//things.append(3.14159)
//things.append("hello")
//things.append((3.0, 5.0))
//things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
//things.append({ (name: String) -> String in "Hello, \(name)" })
//
//for thing in things {
//    switch thing {
//    case 0 as Int:
//        print("zero as an Int")
//    case 0 as Double:
//        print("zero as a Double")
//    case let someInt as Int:
//        print("an integer value of \(someInt)")
//    case let someDouble as Double where someDouble > 0:
//        print("a positive double value of \(someDouble)")
//    case is Double:
//        print("some other double value that I don't want to print")
//    case let someString as String:
//        print("a string value of \"\(someString)\"")
//    case let (x, y) as (Double, Double):
//        print("an (x, y) point at \(x), \(y)")
//    case let movie as Movie:
//        print("a movie called \(movie.name), dir. \(movie.director)")
//    case let stringConverter as (String) -> String:
//        print(stringConverter("Michael"))
//    default:
//        print("something else")
//    }
//}

//zero as an Int
//zero as a Double
//an integer value of 42
//a positive double value of 3.14159
//a string value of "hello"
//an (x, y) point at 3.0, 5.0
//a movie called Ghostbusters, dir. Ivan Reitman
//Hello, Michael


//func f(_ any: Any) {
//    print("Function for Any")
//}
//
//func f(_ int: Int) {
//    print("Function for Int")
//}
//
//let x = 10
//f(x)
//// Function for Int
//
//let y: Any = x
//f(y)
//// Function for Any
//
//f(x as Any)
//// Function for Any
//
class FloatRef {
    let value: Float
    init(_ value: Float) {
        self.value = value
    }
}

let x = FloatRef(2.3)
let y: Any = x
let z: Any = FloatRef.self

if let y = y as? FloatRef {
    print(y.value)
}

if let z = z as? FloatRef {
    print(z.value)
}

AnyObject.Type
