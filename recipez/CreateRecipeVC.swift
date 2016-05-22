//
//  CreateRecipeVC.swift
//  recipez
//
//  Created by Tang on 2016/5/22.
//  Copyright © 2016年 Tang. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var addRecipeBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        recipeImg.layer.cornerRadius = 4.0
        recipeImg.clipsToBounds = true
        
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        // 關掉選擇照片的畫面
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        //                這個image是選擇的照片
        recipeImg.image = image
    }
    
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
        addRecipeBtn.hidden = true
    }
    
    @IBAction func createRecipe(sender: AnyObject!) {
        if let title = recipeTitle.text where title != "" {
            
            // 要存入coredata，所以這段程式碼都必須寫一次
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            // Recipe繼承managedobject，所以必須這樣初始化。這要自己寫！
            // 這邊要設定的都是Recipe的attribute
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            recipe.title = recipeTitle.text
            recipe.steps = recipeSteps.text
            recipe.ingredients = recipeIngredients.text
            recipe.setImage(recipeImg.image!)
            
            // 真正儲存進入coredata
            context.insertObject(recipe)
            do {
                try context.save()
            } catch {
                print ("could not save recipe")
            }
            
//            dismissViewControllerAnimated(true, completion: nil)
            
            // 要注意！！，不然無法去掉
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
    
    
}
