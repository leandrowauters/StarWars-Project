//
//  TableViewCell.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import UIKit


class ListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellSubView: RoundedView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with planet: Planet.ResultWrapper?, with people: People.ResultWrapper?) {
        selectionStyle = .none
        if let planet = planet {
           nameLabel.text = planet.name
            backgroundColor = #colorLiteral(red: 0.0001123440088, green: 0.04907912016, blue: 0.08748734742, alpha: 1)
        }
        if let people = people {
            nameLabel.text = people.name
            backgroundColor = #colorLiteral(red: 0.0005744225346, green: 0.1626783907, blue: 0.2327522039, alpha: 1)
            cellSubView.backgroundColor = #colorLiteral(red: 0.0001123440088, green: 0.04907912016, blue: 0.08748734742, alpha: 1)
        }
    }
}
