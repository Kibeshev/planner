//
//  TaskListController.swift
//  Planner
//
//  Created by Кирилл Кибешев on 21.02.2019.
//  Copyright © 2019 Кирилл Кибешев. All rights reserved.
//

import UIKit
import CoreData

class TaskListController: UITableViewController {
   
    var context:NSManagedObjectContext! // контекст для связи объеков  с БД

    
    
    //    // временный массив для тестовых данных
//    private var taskList:[Task] = [
//        Task(name: "задача 1 ", category: "категория 1"),
//        Task(name: "задача 2 ", category: "категория 2"),
//        Task(name: "задача 3 gghgjjjjhkjhhghffgccvgcgchghghg", category: "категория 3 sdmksdnvjbs ih aijsd  uhad n aquh d a", deadline: Date()),
//        Task(name: "задача 4", category: "категория 4")
//    ]
//

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        // используем аппделегейт для получения доступа к контексту
        guard let  appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("appDelegate error")
        }
        
        // получаем контекст из persistentContainer
        context = appDelegate.persistentContainer.viewContext
        
        // добавляем категорию 
        let cat1 = addCategory(name: "Спорт")
        
        let task1 = addTask(name: "сходить в бассейн", completed: false, deadline: Date(), info: "доп.инфо", category: cat1, priority: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func addCategory(name:String) -> Category {
        let category = Category(context: context) // указываем контекст для объекта
        
        category.name = name
        
        
        do {
            try context.save() // сохраняем каждый новый объект
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        return category //возвращаем созданную категорию
    }
    
    
    func addTask(name:String, completed:Bool, deadline:Date?, info:String?, category:Category?, priority:Priority?) -> Task {
        let task = Task(context: context)
        
        task.name = name
        task.completed = completed
        task.deadline = deadline
        task.info = info
        task.category = category
        task.priority = priority
    
        
        do {
            try context.save() // сохраняем каждый новый объект
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
        return task //возвращаем созданную задачу
    }
    // MARK: - TableView
    // методы вызываются автоматтически компонентом tableView

    // сколько секций нужно отображать в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
 
       
        return 1
        
    }
    // сколько будет записей в каждой секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return 1
    }
    
    let dateFormatter = DateFormatter()

    

    // отображение данных в строке
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as? TaskListCell else {
            fatalError("cell type")
        }
        
//        let task = taskList[indexPath.row]
//
//      //получить значение из массива по индексу
//
//        
//
//        cell.labelTaskName.text = task.name // получить значение из массива по индексу и поле name
//
//        cell.labelTaskCategory.text = (task.category ?? "")
//
//        if let deadline = task.deadline {
//            cell.labelTaskDeadline.text = dateFormatter.string(from: deadline)
//        } else {
//            cell.labelTaskDeadline?.text = ""
//        }
        
        // получить значение из массива по индексу и поле category
        
     
        return cell
       
    }

    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


