//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by Antonio Mennillo on 02/04/2020.
//  Copyright © 2020 Antonio Mennillo. All rights reserved.
//

import UIKit

struct Toast {
    var name: String
    var imagecode: String
    var description: String 
}

class ToastTableViewCell: UITableViewCell {
    @IBOutlet weak var ToastImage: UIImageView!
    @IBOutlet weak var ToastName: UILabel!
}

  let toasts = [
             Toast(name:"Avocado Toast", imagecode: "avocadotoast", description: "Ingredients:\n •1 slice of bread   toasted\n •1/2 ripe medium avocado\n • Small squeeze fresh lemon juice\n •1 hard-boiled egg\n •Favorite pepper blend\n •Drizzle extra-virgin olive oil\n •Salt"),
              Toast(name: "Club Sandwich", imagecode: "clubsandwich", description: "Ingredients:\n•4 rashers streaky bacon\n•3 slices white bread\n•1 tbsp mayonnaise\n•1 hard-boiled egg\n •1 tomato, sliced\n•Few thick slices chicken or turkey breast\n•Small handful salad leaves"),
              Toast(name: "Croque Madame", imagecode: "croquemadame", description: "Ingredients:\n•5 tablespoons butter\n•1 tablespoon flour\n•⅔ cup milk\n•Sea salt\n•Freshly grated nutmeg\n• 1/3-inch-thick slices country bread\n•4 thin slices French ham\n•2 thin slices Gruyere cheese\n•2 eggs"),
              Toast(name: "Croque Monsieur", imagecode: "croquemonsieur",description: "Ingredients:\nBéchamel:\n•¼ cup (½ stick) unsalted butter\n•¼ cup all-purpose flour\n•1½ cups whole milk\n•2 tablespoons whole grain mustard\n•½ teaspoon freshly grated nutmeg or ¼ ground nutmeg\n•Kosher salt\nAssembly:\n•8 slices ½”-thick country-style bread\n•6 oz. ham, preferably Paris ham (about 8 slices)\n•3 oz. Gruyère, grated (about 1½ cups)\n•1 teaspoon herbes de Provence"),
              Toast(name: "French Toast", imagecode: "frenchtoast",description: "Ingredients:\n •6 thick slices bread\n •2 eggs\n •2/3 cup milk\n •1/4 teaspoon ground cinnamon(optional)\n •1 teaspoon vanilla extract (optional)")
     ]


class CustomTableViewController:UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return toasts.count
       }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)as! ToastTableViewCell
        
        let toast = toasts[indexPath.row]
        cell.ToastName?.text = toast.name
        cell.ToastImage?.image = UIImage(named:toast.imagecode)
        cell.ToastImage?.layer.cornerRadius = 20
        cell.ToastImage?.layer.shadowRadius = 20
         return cell
     }
    
    
   override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailVC = storyboard.instantiateViewController(identifier: "DetailVC") as! DetailViewController
            
            detailVC.toastSelected = indexPath.row
            self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

