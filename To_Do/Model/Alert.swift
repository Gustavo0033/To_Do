//
//  Alert.swift
//  To_Do
//
//  Created by Gustavo Mendonca on 07/04/24.
//

import UIKit

class deleteTaskAlert{
    var titulo: String
    var mensagem : String
    init(titulo: String, mensagem: String) {
        self.titulo = titulo
        self.mensagem = mensagem
    }
    func alertDelete() -> UIAlertController{
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style:.cancel)
        
        alert.addAction(ok)
        return alert
}


}
