//
//  PlanetsDetailViewController.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/10/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit

class PlanetsDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var diameterLabel: NSLayoutConstraint!
    @IBOutlet weak var gravityLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet var terrainImages: [UIImageView]!
    @IBOutlet weak var climateImage: UIImageView!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var surfaceWaterLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
