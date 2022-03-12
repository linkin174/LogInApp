//
//  MoreInfoViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 11.03.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    var photo: String!
    
    @IBOutlet weak var personImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        personImage.image = UIImage(named: photo)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
