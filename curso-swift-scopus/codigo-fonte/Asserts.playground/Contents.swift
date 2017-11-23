//: Playground - noun: a place where people can play

import UIKit

var idade = -32
//assert(idade >= 0, "Tem que ter nascido")

class Movie {
    static let defaultMovieTitle = "N/D"
    static let defaultMovieDirector = "N/D"
    var duracao: Int = 0
    
    static func printDefaultMovieTitle() {
        print(Movie.defaultMovieTitle)
    }
    
    var description : String {
        return "\(self.title) : \(self.director)"
    }
    
    var durationInHours: Int {
        get {
            return self.duracao / 60
        }
        set {
            self.duracao = newValue * 60
        }
    }
    
    var durationInMinutes: Int {
        get {
            return self.duracao * 60
        }
        set {
            self.duracao = newValue / 60
        }
    }
    
    var title: String
    let director : String
    
    convenience init (title: String) {
        self.init(title: title, director: Movie.defaultMovieDirector)
    }
    
    //Designated Initialize
    init(title:String, director:String) {
        self.title = title
        self.director = director
    }
    
    deinit {
        print("Estou sendo destruído...")
    }
}

var movie = Movie(title: "StarWars", director: "Ze Ruela")
movie.duracao = 10
movie.durationInHours
movie.durationInMinutes

var movieOptional: Movie? = Movie(title: "StarWars", director: "Ze Ruela")
movieOptional = nil


//Heranca

class FigthMovie: Movie {
    var nivel: Int
    
    init(title: String, director: String, nivel: Int) {
        self.nivel = nivel
        super.init(title: title, director: director)
    }
    
    //convenience init(nivel: Int) {
       // self.init(title: FigthMovie.defaultMovieTitle, director: FigthMovie.defaultMovieDirector)
    //}
    
    override var description : String {
        return "\(self.title) : \(self.director) -> \(self.nivel)"
    }
}
