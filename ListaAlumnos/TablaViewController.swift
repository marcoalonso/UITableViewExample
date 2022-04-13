//
//  ViewController.swift
//  ListaAlumnos
//
//  Created by marco rodriguez on 13/04/22.
//

import UIKit

class TablaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tituloSeleccionado: String?
    var imagenSeleccionada: UIImage?
    
    var contactos = ["Alonso", "Carlos", "Daniel"]
    
    var calificaciones = [100, 95, 98]
    
    var equiposFutbol = ["America", "Chivas", "Cruz Azul", "Tigres"]
    var banderasEquipos = [UIImage(named: "america"),UIImage(named: "chivas"),UIImage(named: "cz"),UIImage(named: "tigres")]

    @IBOutlet weak var tablaAlumnos: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaAlumnos.delegate = self
        tablaAlumnos.dataSource = self
    }
    
    // MARK: - cuantos renglones habra en la tabla dependiendo si hay mas de 1 seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return contactos.count
        case 1:
            return calificaciones.count
        case 2:
            return equiposFutbol.count
        default:
            return 0
        }
        
    }
    
    // MARK: - Vamos a crear la celda para cada objeto, en caso de la primer seccion se le asignan valores diferentes
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            celda.textLabel?.text = contactos[indexPath.row]
            celda.imageView?.image = UIImage(named: "contactos")
        case 1:
            celda.textLabel?.text =  "\(calificaciones[indexPath.row])"
            celda.imageView?.image = UIImage(systemName: "note")
        case 2:
            celda.textLabel?.text = equiposFutbol[indexPath.row]
            celda.imageView?.image = banderasEquipos[indexPath.row]
            
        default:
            celda.textLabel?.text = "Seccion no valida"
        }
        return celda
    }
    
    // MARK: - Numero de Secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    

    // MARK: - Encabezados a la tabla
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Alumnos"
        }else if  section == 1 {
            return "Calificaciones"
        }else if  section == 2 {
            return "Equipos de Futbol"
        } else {
            return "Items"
        }
    }
    
    // MARK: - identificar que item fue seleccionado
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print(contactos[indexPath.row])
            tituloSeleccionado = contactos[indexPath.row]
            
            performSegue(withIdentifier: "verDetalles", sender: self)
        case 1:
            print(calificaciones[indexPath.row])
            tituloSeleccionado = "\(calificaciones[indexPath.row])"
            performSegue(withIdentifier: "verDetalles", sender: self)
        case 2:
            print(equiposFutbol[indexPath.row])
            tituloSeleccionado = equiposFutbol[indexPath.row]
            imagenSeleccionada = banderasEquipos[indexPath.row]
            performSegue(withIdentifier: "verDetalles", sender: self)
        default:
            return
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verDetalles" {
            let objDestino = segue.destination as! VistaDetalladaItemViewController
            objDestino.recibirTitulo = tituloSeleccionado
            objDestino.recibirImagen = imagenSeleccionada ?? UIImage(systemName: "questionmark.circle")
        }
    }

}

