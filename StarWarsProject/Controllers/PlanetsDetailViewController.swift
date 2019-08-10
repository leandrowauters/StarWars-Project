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

    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var gravityLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet var terrainImages: [UIImageView]!
    @IBOutlet weak var climateImage: UIImageView!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var planet: Planet.ResultWrapper!
    var savedPlanets = [Planet.ResultWrapper]()
    let imageHelper = ImageHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
        savedPlanets = DataPersistanceModel.getPlanets()
        setup()
        
    }
    
    private func setup() {
        if savedPlanets.contains(planet) {
            favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        }
        imageHelper.setupTerrainImages(imagesViews: terrainImages, terrain: planet.terrain)
        imageHelper.setupClimateImage(climate: planet.climate, imageView: climateImage)
        nameLabel.text = planet.name
        diameterLabel.text = "Diameter:\n\(planet.diameter)"
        gravityLabel.text = "Gravity:\n\(planet.gravity)"
        populationLabel.text = "Population:\n\(planet.population)"
        climateLabel.text = "Climate:\n\(planet.climate.capitalized)"
        dateCreatedLabel.text = "Date Created:\n\(planet.created.changeDateFormat(dateFormat: "MMM d, yyyy"))"
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func favoritePressed(_ sender: UIButton) {
        let savedPlanets = DataPersistanceModel.getPlanets()
        if savedPlanets.contains(planet) {
            DataPersistanceModel.deletePlanet(planet: planet)
            favoriteButton.setImage(UIImage(named: "favoriteEmpty"), for: .normal)
        } else {
            DataPersistanceModel.addPlanet(planet: planet)
            favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        }
    }
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, planet: Planet.ResultWrapper) {
        self.planet = planet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
