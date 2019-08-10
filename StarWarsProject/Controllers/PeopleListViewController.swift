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

    
    let peopleClient = PeopleClient()
    var people: [People.ResultPeopleWrapper] = [] {
        didSet {
            DispatchQueue.main.async {
                self.peopleTableView.reloadData()
            }
        }
    }

    @IBOutlet weak var peopleTableView: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchPeople {
            return
        }
        
    }

    private func fetchPeople(done:() -> Void
        ) {
        peopleClient.fetchPeople { (appError, people) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let people = people {
                self.people.append(contentsOf: people)
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

    
    @IBAction func backPressed(_ sender: Any) {
       navigationController?.popViewController(animated: true)
    }
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= people.count - 1
    }
}

extension PeopleListViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell else {
            return UITableViewCell()
        }
        let person = people[indexPath.row]
        cell.nameLabel.text = person.name
        cell.selectionStyle = .none
        cell.backgroundColor = #colorLiteral(red: 0.0005744225346, green: 0.1626783907, blue: 0.2327522039, alpha: 1)
        cell.cellSubView.backgroundColor = #colorLiteral(red: 0.0001123440088, green: 0.04907912016, blue: 0.08748734742, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            fetchPeople {
                <#code#>
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personSelected = people[indexPath.row]
        let peopleDetailVc = PeopleDetailViewController(nibName: nil, bundle: nil, person: personSelected)
        navigationController?.pushViewController(peopleDetailVc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

