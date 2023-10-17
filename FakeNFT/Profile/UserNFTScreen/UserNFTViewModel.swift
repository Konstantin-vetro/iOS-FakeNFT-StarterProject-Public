import Foundation

protocol UserNFTViewModelProtocol {
    var userNFT: [NFT]? { get }
    var authors: [String: Author] { get }
    func observeUserNFT(_ handler: @escaping ([NFT]?) -> Void)
    
    func fetchNFT(nftList: [String])
    func fetchAuthor(authorID: String, completion: @escaping (Result<Author, Error>) -> Void)
    
    func sortData(by option: SortOption)
}

final class UserNFTViewModel: UserNFTViewModelProtocol {
    @Observable
    private (set) var userNFT: [NFT]?
    
    private (set) var authors: [String: Author] = [:]
    private let model: UserNFTModel
    
    init(model: UserNFTModel) {
        self.model = model
    }
    
    func observeUserNFT(_ handler: @escaping ([NFT]?) -> Void) {
        $userNFT.observe(handler)
    }
    
    func fetchNFT(nftList: [String]) {
        
        var fetchedNFTs: [NFT] = []
        let group = DispatchGroup()
        
        for element in nftList {
            group.enter()
            
            model.fetchNFT(nftID: element) { (result) in
                switch result {
                case .success(let nft):
                    fetchedNFTs.append(nft)
                case .failure(let error):
                    print("Failed to fetch NFT with ID \(element): \(error)")
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
                let authorGroup = DispatchGroup()
                for nft in fetchedNFTs {
                    authorGroup.enter()
                    self.fetchAuthor(authorID: nft.author) { result in
                        switch result {
                        case .success(let author):
                            self.authors[nft.author] = author
                        case .failure(let error):
                            print("Failed to fetch author with ID \(nft.author): \(error)")
                        }
                        authorGroup.leave()
                    }
                }
                authorGroup.notify(queue: .main) {
                    self.userNFT = fetchedNFTs
                }
            }
    }
    
    func fetchAuthor(authorID: String, completion: @escaping (Result<Author, Error>) -> Void) {
        model.fetchAuthor(authorID: authorID) { result in
            switch result {
            case .success(let author):
                completion(.success(author))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func sortData(by option: SortOption) {
        guard var nfts = userNFT else {
            print("No NFTs available to sort")
            return
        }

        switch option {
        case .price:
            nfts.sort(by: { $0.price < $1.price })
        case .rating:
            nfts.sort(by: { $0.rating < $1.rating })
        case .title:
            nfts.sort(by: { $0.name.lowercased() < $1.name.lowercased() })
        }
        self.userNFT = nfts
    }
}
