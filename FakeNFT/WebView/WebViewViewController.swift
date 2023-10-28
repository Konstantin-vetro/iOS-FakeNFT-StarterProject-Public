//
//  WebViewViewController.swift
//  FakeNFT
//

import WebKit
import ProgressHUD

final class WebViewViewController: UIViewController {
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    private var webSite: URL

    init(webSite: URL) {
        self.webSite = webSite
        super.init(nibName: nil, bundle: nil)
        loadWebsite(webSite: webSite)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }
// MARK: - LoadWebsite
    private func loadWebsite(webSite: URL) {
        let request = URLRequest(url: webSite)
        ProgressHUD.show()
        webView.load(request)
    }
// MARK: - Setup UI
    private func setupNavigationBar() {
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                        style: .plain,
                                                        target: nil,
                                                        action: nil)
        }
        navigationItem.leftBarButtonItem = nil
        navigationController?.navigationBar.tintColor = .nftBlack
    }

    private func setupUI() {
        view.addSubview(webView)
        view?.backgroundColor = .nftWhite

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
// MARK: - WKNavigationDelegate
extension WebViewViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        ProgressHUD.show()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ProgressHUD.dismiss()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        ProgressHUD.dismiss()
        print(error)
    }
}
