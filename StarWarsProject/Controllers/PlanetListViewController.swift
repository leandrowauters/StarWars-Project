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
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var tableViewTitle: UILabel!
    
    let networkClient = NetworkClient()
    var favoritePressed = true
    var allPlanets = [Planet.ResultWrapper]()
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
        planetsTableView.backgroundColor = #colorLiteral(red: 0.0001123440088, green: 0.04907912016, blue: 0.08748734742, alpha: 1)
    }
    private func fetchPlanets() {
        networkClient.fetchData(resource: .Planet) { (peopleResult, planetResult) in
            if let planetResult = planetResult {
                switch planetResult {
                case .failure(let error):
                    print("error: \(error)")
                case .success(let planets):
                    self.planets.append(contentsOf: planets)
                    self.allPlanets.append(contentsOf: planets)
                }
            }
        }
    }
    
    @IBAction func favoritePressed(_ sender: Any) {
        if favoritePressed {
            UIView.animate(withDuration: 0.3, animations: {
                self.planetsTableView.frame.origin.x += self.view.bounds.width
            }) { [weak self] done in
                UIView.animate(withDuration: 0.3, animations: {
                    self?.planets = DataPersistenceModel.getPlanets()
                    self?.tableViewTitle.text = "Favorites"
                    self?.favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
                    self?.favoritePressed = false
                    self?.planetsTableView.frame.origin.x -= self!.view.bounds.width
                })
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
               self.planetsTableView.frame.origin.x += self.view.bounds.width
            }) { [weak self] done  in
                UIView.animate(withDuration: 0.3, animations: {
                    self?.planets = self!.allPlanets
                    self?.favoritePressed = true
                    self?.tableViewTitle.text = "Planets"
                    self?.favoriteButton.setImage(UIImage(named: "favoriteEmpty"), for: .normal)
                    self?.planetsTableView.frame.origin.x -= self!.view.bounds.width
                })
            }

        }
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
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            fetchPlanets()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let selectedPlanet = planets[indexPath.row]
        let planetDetailVC = PlanetsDetailViewController(nibName: nil, bundle: nil, planet: selectedPlanet, allPlanets: allPlanets)
        navigationController?.pushViewController(planetDetailVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
}
