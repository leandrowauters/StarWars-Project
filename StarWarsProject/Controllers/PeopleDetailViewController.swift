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
    
    var person: People.ResultWrapper! {
        didSet {
            setupUI()
        }
    }
    private let colorHelper = ColorHelper()
    private var favoritePressed = true
    private var savedPeople = [People.ResultWrapper]()
    private var allPeople = [People.ResultWrapper]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedPeople = DataPersistenceModel.getPeople()
        setupUI()
        // Do any additional setup after loading the view.
    }

    private func setupUI() {
        if savedPeople.contains(person) {
            favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        }
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
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        person = allPeople.randomElement()
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, person: People.ResultWrapper, allPeople: [People.ResultWrapper]) {
        self.person = person
        self.allPeople = allPeople
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBAction func favoritePressed(_ sender: Any) {
        let savedPeople = DataPersistenceModel.getPeople()
        if savedPeople.contains(person) {
            DataPersistenceModel.deletePeople(person: person)
            favoriteButton.setImage(UIImage(named: "favoriteEmpty"), for: .normal)
        } else {
            DataPersistenceModel.addPerson(person: person)
            favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)
        }
    }
    
    @IBAction func backWasPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
