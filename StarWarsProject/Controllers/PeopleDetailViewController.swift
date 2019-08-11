//
//  PeopleDetailViewController.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit

class PeopleDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var hairColorView: RoundedView!
    @IBOutlet weak var eyeColorView: RoundedView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    let person: People.ResultWrapper!
    let colorHelper = ColorHelper()
    var favoritePressed = true
    var savedPeople = [People.ResultWrapper]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        savedPeople = DataPersistanceModel.getPeople()
        // Do any additional setup after loading the view.
    }

    private func setupUI() {
        nameLabel.text = person.name
        hairColorLabel.text = "Hair Color: \(person.hairColor)"
        eyeColorLabel.text = "Eye Color: \(person.eyeColor)"
        birthYearLabel.text = "Birth Year: \(person.birthYear)"
        dateCreatedLabel.text = "Date Created: \(person.created.changeDateFormat(dateFormat: "MMM d, yyyy"))"
        if let color = colorHelper.getHairColor(hairColor: person.hairColor) {
            hairColorView.backgroundColor = color
        } else {
            hairColorView.isHidden = true
        }
        
        if let eyeColor = colorHelper.getEyeColor(eyeColor: person.eyeColor) {
            eyeColorView.backgroundColor = eyeColor
        } else {
            eyeColorView.isHidden = true
        }
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, person: People.ResultWrapper) {
        self.person = person
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBAction func favoritePressed(_ sender: Any) {
        let savedPeople = DataPersistanceModel.getPeople()
        if savedPeople.contains(person) {
            DataPersistanceModel.deletePeople(person: person)
            favoriteButton.setImage(UIImage(named: "favoriteEmpty"), for: .normal)
        } else {
            DataPersistanceModel.addPerson(person: person)
            favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        }
    }
    
    @IBAction func backWasPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
