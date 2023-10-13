//
//  StatisticsViewModel.swift
//  FakeNFT
//

import Foundation

enum SortType: String {
    case name
    case rating
    case none
}

protocol StatisticsViewModelProtocol: AnyObject {
    var dataChanged: (() -> Void)? { get set }
    var isDataLoading: ((Bool) -> Void)? { get set }
    var users: [User] { get set }
    func usersCount() -> Int
    func loadData()
    func sortUsersByName()
    func sortUsersByRating()
}

final class StatisticsViewModel: StatisticsViewModelProtocol {
    private let sortTypeKey = "sortTypeKey"
    
    var isDataLoading: ((Bool) -> Void)?
    
    var dataChanged: (() -> Void)?
    
    var users: [User] = [] {
        didSet {
            dataChanged?()
        }
    }
    
    func usersCount() -> Int {
        return users.count
    }
    
    func loadData() {
        isDataLoading?(true)
        guard let url = URL(string: "https://651ff0d9906e276284c3c20a.mockapi.io/api/v1/users") else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let users = try decoder.decode([User].self, from: data)

                    DispatchQueue.main.async {
                        self?.users = users
                        self?.loadPreviousSortingState()
                        self?.isDataLoading?(false)
                    }
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        task.resume()
    }
    
    func sortUsersByName() {
        users.sort { $0.name < $1.name }
        UserDefaults.standard.setValue(SortType.name.rawValue, forKey: sortTypeKey)
    }
    
    func sortUsersByRating() {
        users.sort {  Int($0.rating) ?? 0 < Int($1.rating) ?? 0 }
        UserDefaults.standard.setValue(SortType.rating.rawValue, forKey: sortTypeKey)
    }
    
    private func loadPreviousSortingState() {
        guard let sortTypeValue = UserDefaults.standard.value(forKey: sortTypeKey) as? String else { return }
        
        let sortType = SortType(rawValue: sortTypeValue) ?? .none
        
        switch sortType {
        case .name:
            sortUsersByName()
        case .rating:
            sortUsersByRating()
        case .none:
            break
        }
    }
}
