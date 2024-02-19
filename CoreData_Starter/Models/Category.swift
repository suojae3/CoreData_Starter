//
//  Category.swift
//  CoreData_Starter
//

enum Category: Int16 {
    case catchphrase = 0
    case dadJoke
    
    var cellIdentifier: String {
        switch self {
        case .catchphrase: "CatchphraseCell"
        case .dadJoke: "DadJokeCell"
        }
    }
}
