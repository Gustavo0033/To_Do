//
//  AddTaskViewController.swift
//  To_Do
//
//  Created by Gustavo Mendonca on 06/04/24.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var textFieldNewtask: UITextField!
    @IBOutlet weak var labelNeedWrite: UILabel!
    @IBOutlet weak var labelSucess: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func btnAddTask(_ sender: Any) {
        
        if let tarefaDigitada = textFieldNewtask.text{
            if tarefaDigitada == ""{
                labelNeedWrite.isHidden = false
            }else{
                let tarefa = TarefaUserDefaults()
                tarefa.salvar(tarefa: tarefaDigitada)
                textFieldNewtask.text = ""
                
                labelSucess.isHidden = false
                
                let dados = tarefa.listar()
            }
        }
    }
}
