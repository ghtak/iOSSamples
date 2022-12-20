//
//  UIImageViewViewController.swift
//  iOSSamples
//
//  Created by codex on 2022/12/20.
//

import UIKit
import Kingfisher

class UIImageViewViewController: BasicViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = URL(string: "https://picsum.photos/200/300")
        imageView.kf.setImage(with: url,
                              options: [.transition(.fade(1))])

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
