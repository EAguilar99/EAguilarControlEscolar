//
//  FormController.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 09/06/23.
//

import UIKit

class FormController: UIViewController {
    var IdAlumno : Int  = 0
    var result = Result<Alumno>()
    
    @IBOutlet weak var txtIdAlumnoOutlet: UITextField!
    @IBOutlet weak var txtNombreOutlet: UITextField!
    @IBOutlet weak var txtApellidoPaternoOutlet: UITextField!
    @IBOutlet weak var txtApeliidoMaternoOutlet: UITextField!
    @IBOutlet weak var DatePickerOutlet: UIDatePicker!
    @IBOutlet weak var txtGeneroOutlet: UITextField!
    @IBOutlet weak var txtTelefonoOutlet: UITextField!
    
    @IBOutlet weak var btnactionOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(IdAlumno)
        
        if IdAlumno != 0
        {
            //txtIdAlumnoOutlet.isHidden = true
            RecuperarDatos(IdAlumno: IdAlumno)
            btnactionOutlet.backgroundColor = UIColor.yellow
            btnactionOutlet.setTitle("Actualizar", for: .normal)
        }
        else
        {
            txtIdAlumnoOutlet.isHidden = true
            btnactionOutlet.backgroundColor = UIColor.green
            btnactionOutlet.setTitle("Agregar", for: .normal)
        }
    }
    
    @IBAction func btnAcrion(_ sender: UIButton) {
    
        let botonseleccionado = sender.titleLabel?.text
        
        
        
        
        var alumno = Alumno()
        
        var date = self.DatePickerOutlet.date
        var dateFormat = DateFormatter()
        dateFormat.dateFormat  = "dd-MM-YYYY"
        
        alumno.IdAlumno = Int(txtIdAlumnoOutlet.text!)!
        alumno.Nombre = txtNombreOutlet.text!
        alumno.ApellidoPaterno = txtApellidoPaternoOutlet.text!
        alumno.ApellidoMaterno = txtApeliidoMaternoOutlet.text!
        alumno.FechaNacimiento = "02/09/1999"//dateFormat.string(from: date)
        alumno.Genero = txtGeneroOutlet.text!
        alumno.Telefono = txtTelefonoOutlet.text!
        
        //var result = AlumnoViewModel.Add(alumno: alumno)
        
        let opcion = btnactionOutlet.titleLabel?.text
        
        if(botonseleccionado == "Actualizar")
        {
            AlumnoViewModel.Update(alumno: alumno)
            print("Actualizado")
        }
        if(botonseleccionado == "Agregar")
        {
            AlumnoViewModel.Add(alumno: alumno)
        }
    }
    
    
    func RecuperarDatos(IdAlumno : Int)
    {
        var result = AlumnoViewModel.GetById(idAlumno: IdAlumno) { [self] result, error in
            
            if let resultSource = result {
                if result!.Correct == true
                {
                    
                    let alumno = result!.Object! as! Alumno
                    
                    DispatchQueue.main.async {
                        self.txtIdAlumnoOutlet.text = String (alumno.IdAlumno!)
                        self.txtNombreOutlet.text = (alumno.Nombre)
                        self.txtApellidoPaternoOutlet.text = (alumno.ApellidoPaterno)
                        self.txtApeliidoMaternoOutlet.text = (alumno.ApellidoMaterno)
                        //dpFechaNacimientoOutlet.date = date.dateFormat
                        //DatePickerOutlet.tex
                        self.txtGeneroOutlet.text = alumno.Genero
                        self.txtTelefonoOutlet.text = alumno.Telefono
                    }
                }
                
            }
        }
    }
}
