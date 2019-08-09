//
//  WelcomeScreeenViewController.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit

class WelcomeScreeenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func peopleButtonPressed(_ sender: UIButton) {
        let peopleListVC = PeopleListViewController()
        navigationController?.pushViewController(peopleListVC, animated: true)
    }
    
    @IBAction func planetsButtonPressed(_ sender: UIButton) {
        let planetsListVC = PlanetListViewController()
        navigationController?.pushViewController(planetsListVC, animated: true)
    }
    

}
