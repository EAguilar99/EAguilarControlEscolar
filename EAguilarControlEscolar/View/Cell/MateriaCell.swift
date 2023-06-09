//
//  MateriaCell.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 08/06/23.
//

import UIKit

class MateriaCell: UITableViewCell {

    @IBOutlet weak var lblNombreOutlet: UILabel!
    @IBOutlet weak var lblCostoOultet: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
