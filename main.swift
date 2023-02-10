import Foundation
var movies: [[String: Any]] = []
func addMovie() {
    print("Enter movie information:")
    print("Name:", terminator: " ")
    let title = readLine(strippingNewline: true) ?? ""
    print("Category:", terminator: " ")
    let category = readLine(strippingNewline: true) ?? ""
    print("Rating:", terminator: " ")
    let rating = Double(readLine(strippingNewline: true) ?? "0.0") ?? 0.0
    movies.append([
        "title": title,
        "category": category,
        "rating": rating
    ])
    print("Movie added!")
}

func editMovie() {
    print("Enter movie title:", terminator: " ")
    let title = readLine(strippingNewline: true) ?? ""
    var found = false
    for i in 0..<movies.count {
        if let movieTitle = movies[i]["title"] as? String, movieTitle == title {
            found = true
            print("Enter new movie information:")
            print("Name:", terminator: " ")
            movies[i]["title"] = readLine(strippingNewline: true) ?? ""
            print("Category:", terminator: " ")
            movies[i]["category"] = readLine(strippingNewline: true) ?? ""
            print("Rating:", terminator: " ")
            movies[i]["rating"] = Double(readLine(strippingNewline: true) ?? "0.0") ?? 0.0
            print("Movie edited!")
            break
        }
    }
    if !found {
        print("Movie not found.")
    }
}

func deleteMovie() {
    print("Enter movie title:", terminator: " ")
    let title = readLine(strippingNewline: true) ?? ""
    var found = false
    for i in 0..<movies.count {
        if let movieTitle = movies[i]["title"] as? String, movieTitle == title {
            found = true
            movies.remove(at: i)
            print("Movie deleted!")
            break
        }
    }
    if !found {
        print("Movie not found.")
    }
}

func listMovies() {
    for movie in movies {
        if let title = movie["title"] as? String, let category = movie["category"] as? String, let rating = movie["rating"] as? Double {
            print("Title: \(title)")
            print("Category: \(category)")
            print("Rating: \(rating)")
        }
    }
}

func findMovie() {
    print("Enter movie title:", terminator: " ")
    let title = readLine(strippingNewline: true) ?? ""
    var found = false
    for movie in movies {
        if let movieTitle = movie["title"] as? String, movieTitle == title, let category = movie["category"] as? String, let rating = movie["rating"] as? Double {
            found = true
            print("Title: \(movieTitle)")
            print("Category: \(category)")
            print("Rating: \(rating)")
            break
        }
    }
    if !found {
        print("Movie not found.")
    }
}

func findMoviesByCategory() {
    print("Enter movie category:", terminator: " ")
    let category = readLine(strippingNewline: true) ?? ""
    var found = false
    for movie in movies {
        if let movieCategory = movie["category"] as? String, movieCategory == category {
            found = true
            if let title = movie["title"] as? String, let rating = movie["rating"] as? Double {
                print("Title: \(title)")
                print("Rating: \(rating)")
            }
        }
    }
    if !found {
        print("No movies found in this category.")
    }
}

func findMoviesByRating() {
    print("Enter minimum rating:", terminator: " ")
    let minRating = Double(readLine(strippingNewline: true) ?? "0.0") ?? 0.0
    print("Enter maximum rating:", terminator: " ")
    let maxRating = Double(readLine(strippingNewline: true) ?? "5.0") ?? 5.0
    var found = false
    for movie in movies {
        if let rating = movie["rating"] as? Double, rating >= minRating, rating <= maxRating {
            found = true
            if let title = movie["title"] as? String, let category = movie["category"] as? String {
                print("Title: \(title)")
                print("Category: \(category)")
                print("Rating: \(rating)")
            }
        }
    }
    if !found {
        print("No movies found in this rating range.")
    }
}

func menu() {
    print("Enter 'a' to add a movie")
    print("Enter 'e' to edit a movie")
    print("Enter 'd' to delete a movie")
    print("Enter 'l' to list all movies")
    print("Enter 'f' to find a movie by title")
    print("Enter 'c' to find movies by category")
    print("Enter 'r' to find movies by rating range")
    print("Enter 'q' to quit")
    var selection = readLine(strippingNewline: true) ?? ""
    while selection != "q" {
        switch selection {
        case "a":
            addMovie()
        case "e":
            editMovie()
        case "d":
            deleteMovie()
        case "l":
            listMovies()
        case "f":
            findMovie()
        case "c":
            findMoviesByCategory()
        case "r":
            findMoviesByRating()
        default:
            print("Unknown command. Please choose within available options.")
        }
        print("Enter 'a' to add a movie")
        print("Enter 'e' to edit a movie")
        print("Enter 'd' to delete a movie")
        print("Enter 'l' to list all movies")
        print("Enter 'f' to find a movie by title")
        print("Enter 'c' to find movies by category")
        print("Enter 'r' to find movies by rating range")
        print("Enter 'q' to quit")
        selection = readLine(strippingNewline: true) ?? ""
    }
    print("Thank you for using the app. See you next time!")
}

if CommandLine.argc > 1 {
    print("This is a command-line application, no need for arguments.")
} else {
    menu()
}

