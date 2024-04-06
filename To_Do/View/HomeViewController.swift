//
//  HomeViewController.swift
//  To_Do
//
//  Created by Gustavo Mendonca on 06/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var labelDate: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        upadateDateLabel()
        checkForPermission()
        // Do any additional setup after loading the view.
    }

    func upadateDateLabel(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let currentDay = Date()
        
        let formattedDate = dateFormatter.string(from: currentDay)
        
        labelDate.text = formattedDate
    }
    
    func checkForPermission(){
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { setting in
            switch setting.authorizationStatus {
            case .authorized:
                self.dispatchNotification()
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if let error = error{
                        print("Error requesting authorization: \(error.localizedDescription)")
                        return
                    }
                    if didAllow{
                        self.dispatchNotification()
                    }
                }
            default:
                return
            }
        }
    }
    
    
    func dispatchNotification(){
        
        let identifier = "notificacao-matinal"
        let tittle = "Lembrete de tarefas"
        let body = "Não esqueça de fazer sua tarefa!"
        let hour = 15
        let minute = 35
        let idDaily = true
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = tittle
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: idDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
        
        
    }
    
    
}
