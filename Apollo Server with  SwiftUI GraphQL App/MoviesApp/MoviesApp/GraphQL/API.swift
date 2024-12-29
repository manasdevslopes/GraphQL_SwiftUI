// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct MovieInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - title
  ///   - year
  ///   - genre
  ///   - poster
  public init(id: Swift.Optional<GraphQLID?> = nil, title: String, year: String, genre: String, poster: String) {
    graphQLMap = ["id": id, "title": title, "year": year, "genre": genre, "poster": poster]
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var year: String {
    get {
      return graphQLMap["year"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "year")
    }
  }

  public var genre: String {
    get {
      return graphQLMap["genre"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "genre")
    }
  }

  public var poster: String {
    get {
      return graphQLMap["poster"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "poster")
    }
  }
}

public final class GetAllMoviesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllMovies($genre: String) {
      movies(filter: {genre: $genre}) {
        __typename
        id
        title
        year
        genre
        poster
      }
    }
    """

  public let operationName: String = "GetAllMovies"

  public var genre: String?

  public init(genre: String? = nil) {
    self.genre = genre
  }

  public var variables: GraphQLMap? {
    return ["genre": genre]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("movies", arguments: ["filter": ["genre": GraphQLVariable("genre")]], type: .list(.object(Movie.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(movies: [Movie?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "movies": movies.flatMap { (value: [Movie?]) -> [ResultMap?] in value.map { (value: Movie?) -> ResultMap? in value.flatMap { (value: Movie) -> ResultMap in value.resultMap } } }])
    }

    public var movies: [Movie?]? {
      get {
        return (resultMap["movies"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Movie?] in value.map { (value: ResultMap?) -> Movie? in value.flatMap { (value: ResultMap) -> Movie in Movie(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Movie?]) -> [ResultMap?] in value.map { (value: Movie?) -> ResultMap? in value.flatMap { (value: Movie) -> ResultMap in value.resultMap } } }, forKey: "movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movie"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("year", type: .nonNull(.scalar(String.self))),
          GraphQLField("genre", type: .nonNull(.scalar(String.self))),
          GraphQLField("poster", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, year: String, genre: String, poster: String) {
        self.init(unsafeResultMap: ["__typename": "Movie", "id": id, "title": title, "year": year, "genre": genre, "poster": poster])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var year: String {
        get {
          return resultMap["year"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "year")
        }
      }

      public var genre: String {
        get {
          return resultMap["genre"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "genre")
        }
      }

      public var poster: String {
        get {
          return resultMap["poster"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "poster")
        }
      }
    }
  }
}

public final class GetAllGenresQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllGenres {
      genres {
        __typename
        name
      }
    }
    """

  public let operationName: String = "GetAllGenres"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("genres", type: .list(.object(Genre.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(genres: [Genre?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "genres": genres.flatMap { (value: [Genre?]) -> [ResultMap?] in value.map { (value: Genre?) -> ResultMap? in value.flatMap { (value: Genre) -> ResultMap in value.resultMap } } }])
    }

    public var genres: [Genre?]? {
      get {
        return (resultMap["genres"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Genre?] in value.map { (value: ResultMap?) -> Genre? in value.flatMap { (value: ResultMap) -> Genre in Genre(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Genre?]) -> [ResultMap?] in value.map { (value: Genre?) -> ResultMap? in value.flatMap { (value: Genre) -> ResultMap in value.resultMap } } }, forKey: "genres")
      }
    }

    public struct Genre: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Genre"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String) {
        self.init(unsafeResultMap: ["__typename": "Genre", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class CreateMovieMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateMovie($movie: MovieInput) {
      addMovie(movie: $movie) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "CreateMovie"

  public var movie: MovieInput?

  public init(movie: MovieInput? = nil) {
    self.movie = movie
  }

  public var variables: GraphQLMap? {
    return ["movie": movie]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addMovie", arguments: ["movie": GraphQLVariable("movie")], type: .object(AddMovie.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addMovie: AddMovie? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addMovie": addMovie.flatMap { (value: AddMovie) -> ResultMap in value.resultMap }])
    }

    public var addMovie: AddMovie? {
      get {
        return (resultMap["addMovie"] as? ResultMap).flatMap { AddMovie(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addMovie")
      }
    }

    public struct AddMovie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movie"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Movie", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class DeleteMovieMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteMovie($movieId: ID!) {
      deleteMovie(id: $movieId) {
        __typename
        id
        title
        poster
        genre
        year
      }
    }
    """

  public let operationName: String = "DeleteMovie"

  public var movieId: GraphQLID

  public init(movieId: GraphQLID) {
    self.movieId = movieId
  }

  public var variables: GraphQLMap? {
    return ["movieId": movieId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteMovie", arguments: ["id": GraphQLVariable("movieId")], type: .object(DeleteMovie.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteMovie: DeleteMovie? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteMovie": deleteMovie.flatMap { (value: DeleteMovie) -> ResultMap in value.resultMap }])
    }

    public var deleteMovie: DeleteMovie? {
      get {
        return (resultMap["deleteMovie"] as? ResultMap).flatMap { DeleteMovie(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteMovie")
      }
    }

    public struct DeleteMovie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movie"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("poster", type: .nonNull(.scalar(String.self))),
          GraphQLField("genre", type: .nonNull(.scalar(String.self))),
          GraphQLField("year", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, poster: String, genre: String, year: String) {
        self.init(unsafeResultMap: ["__typename": "Movie", "id": id, "title": title, "poster": poster, "genre": genre, "year": year])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var poster: String {
        get {
          return resultMap["poster"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "poster")
        }
      }

      public var genre: String {
        get {
          return resultMap["genre"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "genre")
        }
      }

      public var year: String {
        get {
          return resultMap["year"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "year")
        }
      }
    }
  }
}
