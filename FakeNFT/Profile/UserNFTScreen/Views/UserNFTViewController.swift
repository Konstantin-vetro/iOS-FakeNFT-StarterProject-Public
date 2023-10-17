import UIKit
import ProgressHUD

final class UserNFTViewController: UIViewController {
    private let nftList: [String]
    private let viewModel: UserNFTViewModelProtocol
    
    private lazy var nftTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NFTCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var sortButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "sort"), for: .normal)
        button.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
        return button
    }()
    
    init(nftList: [String], viewModel: UserNFTViewModelProtocol) {
        self.nftList = nftList
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchNFT(nftList: nftList)
        setupViews()
        configNavigationBar()
    }
    
    @objc private func sortButtonTapped() {
        print("sortButtonTapped")
    }
    
    private func startLoading() {
        ProgressHUD.show(NSLocalizedString("ProgressHUD.loading", comment: ""))
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }

    private func stopLoading() {
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        ProgressHUD.dismiss()
    }
    
    private func bind() {
        viewModel.observeUserNFT { [weak self] _ in
            guard let self = self else { return }
            stopLoading()
            self.nftTableView.reloadData()
        }
    }
    
    private func configNavigationBar() {
        let barButtonItem = UIBarButtonItem(customView: sortButton)
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = NSLocalizedString("ProfileViewController.myNFT", comment: "")
        setupCustomBackButton()
        startLoading()
    }
    
    private func setupViews() {
        view.backgroundColor = .white

        [nftTableView].forEach { view.addViewWithNoTAMIC($0) }
        
        NSLayoutConstraint.activate([
            nftTableView .topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nftTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nftTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nftTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension UserNFTViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userNFT?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NFTCell = tableView.dequeueReusableCell()
        cell.selectionStyle = .none
        
        guard let nft = viewModel.userNFT?[indexPath.row] else {
            print("error to get NFT")
            return cell
        }
        
        if let author = viewModel.authors[nft.author] {
                cell.configure(nft: nft, authorName: author.name)
            } else {
                print("error to get author ID")
                cell.configure(nft: nft, authorName: "Unknown author")
            }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension UserNFTViewController: UITableViewDelegate {
    
}
