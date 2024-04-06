//
//  TaskListViewController.swift
//  To_Do
//
//  Created by Gustavo Mendonca on 06/04/24.
//

import UIKit

class TaskListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var tarefas: [String] = []
    //var tarefas: [String] = ["Lavar o cabelo", "Lavar o carro", "arrumar a cozinha", "comprar passagens"]
    
    @IBOutlet weak var tableViewTasks: UITableView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentDate()
    }
    
    
    func atualizarListaTarefa(){
        
        
        let tarefa = TarefaUserDefaults()
        
        
        var novasTarefas = tarefa.listar()
        novasTarefas = novasTarefas.map {"🔴 " + $0}
        
        
        tarefas.append(contentsOf: novasTarefas)
        tableViewTasks.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        atualizarListaTarefa()
    }
    


    
    func currentDate(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let currentDay = Date()
        
        let formattedDate = dateFormatter.string(from: currentDay)
        
        dateLabel.text = formattedDate
    }
    
    func saveTasks() {
        UserDefaults.standard.set(tarefas, forKey: "tarefas")
    }
    
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tarefas[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Aqui você pode implementar a lógica para excluir a tarefa da lista
        
        let task = tarefas[indexPath.row]
        
        if task.hasPrefix("✅") {
            //tarefas[indexPath.row] = task.replacingOccurrences(of: "✓", with: "")
            tarefas.remove(at: indexPath.row)
            saveTasks()
            
            
            let alertDeleted = deleteTaskAlert(titulo: "Tarefa concluída!", mensagem: "Você terminou está tarefa.")
            self.present(alertDeleted.alertDelete(), animated: true)
            
        }else if task.hasPrefix("🔴"){
            tarefas[indexPath.row] = "✅ " + task.replacingOccurrences(of: "🔴", with: "")
        }else{
            tarefas[indexPath.row] = "✅ " + task
        }
        tableViewTasks.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let tarefa = TarefaUserDefaults()
            tarefa.remover(indice: indexPath.row)
            tableViewTasks.reloadData()
            print(tarefa)
        }
    }
    

}

