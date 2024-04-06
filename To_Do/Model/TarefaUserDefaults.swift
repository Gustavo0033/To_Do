//
//  TarefaUserDefaults.swift
//  To_Do
//
//  Created by Gustavo Mendonca on 07/04/24.
//

import UIKit

class TarefaUserDefaults{
    
    var timePicker: UIDatePicker!
    
    
    let chave = "tarefas"
    var tarefas: [String] = []
    
    func salvar(tarefa: String){
        tarefas = listar()
        
        tarefas.append(tarefa)
        
        
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
    
    func listar() -> Array<String>{
        let dados = UserDefaults.standard.object(forKey: chave)
        
        if dados != nil{
            return dados as! Array<String>
        }else{
            return []
        }
    }
    
    
    func remover(indice: Int){
        
        tarefas = listar()
        tarefas.remove(at: indice)
        
        UserDefaults.standard.set(tarefas, forKey: chave)
        
    }
    
    func salvarHorariosLembrete(hour: Int, minute: Int){
       

    }
    

}
