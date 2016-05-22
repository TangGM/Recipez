//
//  Recipe.swift
//  recipez
//
//  Created by Tang on 2016/5/22.
//  Copyright © 2016年 Tang. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {

    func setImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.images = data
    }
    
    func getRecipeImg() -> UIImage {
        let img = UIImage(data: self.images!)!
        return img
    }

}
