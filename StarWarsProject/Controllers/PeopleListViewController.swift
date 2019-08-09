//
//  PeopleListViewController.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit

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
        fetchPeople()
    }

    private func fetchPeople() {
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
        peopleTableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
    }
    @IBAction func sortByPressed(_ sender: UIButton) {
        
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            fetchPeople()

        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
