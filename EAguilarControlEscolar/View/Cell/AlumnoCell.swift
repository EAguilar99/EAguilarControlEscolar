//
//  AlumnoCell.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 06/06/23.
//

import UIKit

class AlumnoCell: UITableViewCell {

    @IBOutlet weak var lblNombreOutlet: UILabel!
    @IBOutlet weak var lblApellidoPaternoOutlet: UILabel!
    @IBOutlet weak var lblApellidoMaternoOutlet: UILabel!
    @IBOutlet weak var lblFechaNacimientoOutlet: UILabel!
    @IBOutlet weak var lblGeneroOutlet: UILabel!
    @IBOutlet weak var lblTelefonoOutlet: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
