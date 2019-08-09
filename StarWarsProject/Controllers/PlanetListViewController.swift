//
//  PlanetListViewController.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit

class PlanetListViewController: UIViewController {

    @IBOutlet weak var planetsTableView: UITableView!
    
    let planetClient = PlanetClient()
    
    var planets: [Planet.ResultWrapper] = [] {
        didSet {
            DispatchQueue.main.async {
                self.planetsTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPlanets()
        setupTableView()
        // Do any additional setup after loading the view.
    }

    private func setupTableView() {
        planetsTableView.delegate = self
        planetsTableView.dataSource = self
        planetsTableView.prefetchDataSource = self
        planetsTableView.separatorStyle = .none
        planetsTableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
    }
    private func fetchPlanets() {
        planetClient.fetchPlanets { (appError, planets) in
            if let appError = appError {
                print(appError.errorMessage())
            }
            if let planets = planets {
                self.planets.append(contentsOf: planets)
            }
        }
    }
    
    @IBAction func sortByPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
       navigationController?.popViewController(animated: true)
    }
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= planets.count - 1
    }

}

extension PlanetListViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let planet = planets[indexPath.row]
        cell.nameLabel.text = planet.name
        cell.backgroundColor = #colorLiteral(red: 0.0001123440088, green: 0.04907912016, blue: 0.08748734742, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            fetchPlanets()
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
}
