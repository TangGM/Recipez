//
//  ViewController.swift
//  recipez
//
//  Created by Tang on 2016/5/22.
//  Copyright © 2016年 Tang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var recipes = [Recipe]()
    
    // 要從coredata拿資料要有這個controller
    var fetchedResultsController = NSFetchedResultsController!()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchAndSetResults() {
        // UIApplication.sharedApplication().delegate 是 main delegate
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        // maybe fail
        do {
            let results = try context.executeRequest(fetchRequest)
            self.recipes = results as! [Recipe]
        } catch {
            
        }
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeCell {
            let recipe = recipes[indexPath.row]
            cell.configureCell(recipe)
            return cell
        } else {
            return RecipeCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
}

