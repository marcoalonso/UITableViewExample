//
//  VistaDetalladaItemViewController.swift
//  ListaAlumnos
//
//  Created by marco rodriguez on 13/04/22.
//

import UIKit

class VistaDetalladaItemViewController: UIViewController {
    
    var recibirTitulo: String?
    var recibirImagen: UIImage?
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var imagenItemIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemLabel.text = recibirTitulo ?? ""
        imagenItemIV.image = recibirImagen ?? UIImage(systemName: "heart")

    }
    


}
