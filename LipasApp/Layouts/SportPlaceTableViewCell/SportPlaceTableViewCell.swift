//
//  SportPlaceTableViewCell.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import UIKit

class SportPlaceTableViewCell: UITableViewCell {
    static let identifier = "SportPlaceTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var sportPlace : SportPlaceSimple? {
        didSet {
            guard let sportPlace = sportPlace else {return}
            nameLabel.text = sportPlace.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
