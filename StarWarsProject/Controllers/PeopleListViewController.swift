//
//  PeopleListViewController.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit

enum SortByButtons: String {
    case Name, Height, Weight
}
class PeopleListViewController: UIViewController {
    @IBOutlet weak var tableViewTitle: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    private var favoritePressed = true
    private let networkClient = NetworkClient()
    private var allPeople = [People.ResultWrapper]()
    private var people: [People.ResultWrapper] = [] {
        didSet {
            DispatchQueue.main.async {
                self.peopleTableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }

    @IBOutlet weak var peopleTableView: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchPeople()
    }

    private func fetchPeople() {
        networkClient.fetchData(resource: .People) { [weak self] peopleResult, planetResult in
            if let peopleResult = peopleResult {
                switch peopleResult {
                case .failure(let error):
                    self?.showAlert(title: "Failure", message: error.localizedDescription)
                case .success(let people):
                    self?.people.append(contentsOf: people)
                    self?.allPeople.append(contentsOf: people)
                }
            }
        }
    }
    private func setupTableView() {
        peopleTableView.dataSource = self
        peopleTableView.delegate = self
        peopleTableView.prefetchDataSource = self
        peopleTableView.separatorStyle = .none
        peopleTableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
    }

    @IBAction func favoriteButtonPressed(_ sender: Any) {
        if favoritePressed {
            UIView.animate(withDuration: 0.3, animations: {
                self.peopleTableView.frame.origin.x += self.view.bounds.width
            }) { [weak self] done in
                UIView.animate(withDuration: 0.3, animations: {
                    self?.people = DataPersistenceModel.getPeople()
                    self?.tableViewTitle.text = "Favorites"
                    self?.favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
                    self?.favoritePressed = false
                    self?.peopleTableView.frame.origin.x -= self!.view.bounds.width
                })
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.peopleTableView.frame.origin.x += self.view.bounds.width
            }) { [weak self] done in
                UIView.animate(withDuration: 0.3, animations: {
                    self?.people = self!.allPeople
                    self?.favoritePressed = true
                    self?.tableViewTitle.text = "People"
                    self?.favoriteButton.setImage(UIImage(named: "favoriteEmpty"), for: .normal)
                    self?.peopleTableView.frame.origin.x -= self!.view.bounds.width
                })

            }

        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
       navigationController?.popViewController(animated: true)
    }
    private func isLoadingCell(for indexPath: IndexPath) -> Bool { // is it the last cell?
        return indexPath.row >= people.count - 1
        // If so load more data
    }
}

extension PeopleListViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell else {
            fatalError()
        }
        let person = people[indexPath.row] // Current Person
        cell.nameLabel.text = person.name
        cell.selectionStyle = .none
        cell.backgroundColor = #colorLiteral(red: 0.0005744225346, green: 0.1626783907, blue: 0.2327522039, alpha: 1)
        cell.cellSubView.backgroundColor = #colorLiteral(red: 0.0001123440088, green: 0.04907912016, blue: 0.08748734742, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            fetchPeople() // ONLY Fetch if is the last cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personSelected = people[indexPath.row]
        let peopleDetailVc = PeopleDetailViewController(nibName: nil, bundle: nil, person: personSelected, allPeople: allPeople) // INIT PEOPLE VC TO TAKE THE SELECTED PERSON
        navigationController?.pushViewController(peopleDetailVc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}


