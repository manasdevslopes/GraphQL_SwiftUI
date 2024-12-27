// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAllCountriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllCountries {
      countries {
        __typename
        ...CountryInfo
      }
    }
    """

  public let operationName: String = "GetAllCountries"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CountryInfo.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("countries", type: .nonNull(.list(.nonNull(.object(Country.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(countries: [Country]) {
      self.init(unsafeResultMap: ["__typename": "Query", "countries": countries.map { (value: Country) -> ResultMap in value.resultMap }])
    }

    public var countries: [Country] {
      get {
        return (resultMap["countries"] as! [ResultMap]).map { (value: ResultMap) -> Country in Country(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Country) -> ResultMap in value.resultMap }, forKey: "countries")
      }
    }

    public struct Country: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Country"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(CountryInfo.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, code: GraphQLID, emoji: String, capital: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Country", "name": name, "code": code, "emoji": emoji, "capital": capital])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var countryInfo: CountryInfo {
          get {
            return CountryInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetCountrytInfoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetCountrytInfo($code: ID!) {
      country(code: $code) {
        __typename
        ...CountryInfo
        states {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "GetCountrytInfo"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CountryInfo.fragmentDefinition)
    return document
  }

  public var code: GraphQLID

  public init(code: GraphQLID) {
    self.code = code
  }

  public var variables: GraphQLMap? {
    return ["code": code]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("country", arguments: ["code": GraphQLVariable("code")], type: .object(Country.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(country: Country? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "country": country.flatMap { (value: Country) -> ResultMap in value.resultMap }])
    }

    public var country: Country? {
      get {
        return (resultMap["country"] as? ResultMap).flatMap { Country(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "country")
      }
    }

    public struct Country: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Country"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(CountryInfo.self),
          GraphQLField("states", type: .nonNull(.list(.nonNull(.object(State.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var states: [State] {
        get {
          return (resultMap["states"] as! [ResultMap]).map { (value: ResultMap) -> State in State(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: State) -> ResultMap in value.resultMap }, forKey: "states")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var countryInfo: CountryInfo {
          get {
            return CountryInfo(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct State: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["State"]

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
          self.init(unsafeResultMap: ["__typename": "State", "name": name])
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
}

public struct CountryInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CountryInfo on Country {
      __typename
      name
      code
      emoji
      capital
    }
    """

  public static let possibleTypes: [String] = ["Country"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("code", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("emoji", type: .nonNull(.scalar(String.self))),
      GraphQLField("capital", type: .scalar(String.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(name: String, code: GraphQLID, emoji: String, capital: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Country", "name": name, "code": code, "emoji": emoji, "capital": capital])
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

  public var code: GraphQLID {
    get {
      return resultMap["code"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "code")
    }
  }

  public var emoji: String {
    get {
      return resultMap["emoji"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "emoji")
    }
  }

  public var capital: String? {
    get {
      return resultMap["capital"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "capital")
    }
  }
}
