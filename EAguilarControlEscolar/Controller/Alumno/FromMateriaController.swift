//
//  FromMateriaController.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 12/06/23.
//

import UIKit

class FromMateriaController: UIViewController {
    
    var IdMateria : Int = 0
    var result = Result<Materia>()
    
    @IBOutlet weak var btnActionOutlet: UIButton!
    @IBOutlet weak var txtIdMateriaOutlet: UITextField!
    @IBOutlet weak var txtNombreOutlet: UITextField!
    @IBOutlet weak var txtCostoOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(IdMateria)
        
        if IdMateria != 0
        {
            RecuperarDatos(IdMateria : IdMateria)
            btnActionOutlet.backgroundColor = UIColor.yellow
            btnActionOutlet.setTitle("Actualizar", for: .normal)
        }
        else
        {
            //txtIdMateriaOutlet.isHidden = true
            btnActionOutlet.backgroundColor = UIColor.green
            btnActionOutlet.setTitle("Agregar", for: .normal)
        }
        
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        let botonSeleccionado = sender.titleLabel?.text
        
        var materia = Materia()
        
        //materia.IdMateria = Int(txtIdMateriaOutlet.text!)!
        materia.Nombre = txtNombreOutlet.text!
        materia.Costo = Double(txtCostoOutlet.text!)
        
        //var result = MateriaViewModel.Add(materia: materia)
        
        let opcion = btnActionOutlet.titleLabel?.text
        
        
        
        if botonSeleccionado == "Actualizar"
        {
            materia.IdMateria = IdMateria

            MateriaViewModel.Update(materia: materia)
            print("Actualizar")
        }
        if botonSeleccionado == "Agregar"
        {
            MateriaViewModel.Add(materia: materia)
        }
        
    }
    
    
    func RecuperarDatos(IdMateria : Int)
    {
        var result = MateriaViewModel.GetById(idMateria: IdMateria){ [self] result, error in
            
            if let resultSource = result {
                if result!.Correct == true
                {
                    
                    let materia = result!.Object! as! Materia
                    
                    DispatchQueue.main.async {
                        self.txtIdMateriaOutlet.text = String (materia.IdMateria!)
                        self.txtNombreOutlet.text = (materia.Nombre!)
                        self.txtCostoOutlet.text = String(materia.Costo! ?? 0.0)
                    }
                }
                
            }
        }
    }
}
    


