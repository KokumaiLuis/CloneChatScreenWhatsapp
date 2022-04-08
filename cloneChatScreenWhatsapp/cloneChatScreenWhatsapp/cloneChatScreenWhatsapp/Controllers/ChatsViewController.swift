//
//  ChatsViewController.swift
//  cloneChatScreenWhatsapp
//
//  Created by Student on 08/04/22.
//

import Foundation
import UIKit

class ChatsViewController: UIViewController {
    
    
    // MARK: - Public Variables
    
    lazy var contactList = [Contacts]() {
        didSet {
            DispatchQueue.main.async {
                self.chatsTableView.reloadData()
            }
        }
    }
    
    var contactSearch: [Contacts] = []
    
    var safeArea: UILayoutGuide!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var chatsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Private Variables
    
    private let titleScreen = "Chats"
    
    private var filterActive = false
    
    
    //MARK: - Life Cycles
    
    override func viewWillAppear(_ animated: Bool) {
        navigationControllerConfig()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        viewConfig()
        addSubViews()
        componentsConfigure()
        delegates()
        registerCell()
        registerHeader()
        getContacts()
        navigationControllerSetup()
    }
    
    
    // MARK: - Private Methods
    
    private func viewConfig() {
        title = titleScreen
        view.backgroundColor = UIColor.defaultBackgroundColor
    }
    
    private func navigationControllerConfig() {
        navigationControllerAppearance()
    }
    
    private func addSubViews() {
        view.addSubViews(chatsTableView)
    }
    
    private func componentsConfigure() {
        chatsTableViewConfig()
    }
    
    private func navigationControllerAppearance() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.defaultBackgroundColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.defaultTitleColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.defaultTitleColor]
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = UIColor.defatultSecondaryColor
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let newChatButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(callSecondViewController))
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
        
        navigationItem.rightBarButtonItem = newChatButton
        navigationItem.leftBarButtonItem = editButton
        
    }
    
    @objc func callSecondViewController() {
        let secondViewController = SecondViewController()
        navigationController?.present(secondViewController, animated: true)
    }
    
    private func chatsTableViewConfig() {
        NSLayoutConstraint.activate([
            chatsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            chatsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    private func delegates() {
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
    }
    
    private func registerCell() {
        chatsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func registerHeader() {
        chatsTableView.register(CustomTableViewHeader.self, forHeaderFooterViewReuseIdentifier: CustomTableViewHeader.identifier)
    }
    
    private func getContacts() {
        ApiService.shared.getContacts() { result in
            
            switch result {
            case .success(let res):
                self.contactList = res
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    private func searchBarControllerSetup() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.searchBar.searchTextField.tintColor = UIColor.defatultSecondaryColor
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.searchTextField.clearButtonMode = .never
        
        searchController.searchBar.delegate = self
        
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        
    }
    
    private func navigationControllerSetup() {
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = true
        self.searchBarControllerSetup()
    }
    
    
}

extension ChatsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomTableViewHeader.identifier) as? CustomTableViewHeader else { return UIView()}
        
        return header
    }
    
}

extension ChatsViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterActive ? contactSearch.count : contactList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let contact = filterActive ?  contactSearch[indexPath.row] : contactList[indexPath.row]
        
        cell.setup(name: contact.name, picture: contact.picture, lastChat: contact.lastChat, lastChatTimestamp: contact.latestTimestamp)
        cell.backgroundColor = UIColor.systemBackground
        
        return cell
    }
    
    
}

extension ChatsViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)  {
        filterItems(text: searchController.searchBar.text)
    }
    
    func filterItems(text: String?) {
        guard let text = text else {
            filterActive = false
            self.chatsTableView.reloadData()
            return
        }
        
        self.contactSearch = self.contactList.filter({ (contact) -> Bool in
            return contact.name.lowercased().contains(text.lowercased())
        })
        filterActive = true
        self.chatsTableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filterActive = false
        self.chatsTableView.reloadData()
        return
    }
    
}
