//
//  UIButtonViewController.swift
//  iOSSamples
//
//  Created by codex on 2022/12/18.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa


class UIButtonViewController: BasicViewController {
    
    var button : UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UIButton"
        self.view.addSubview(button)
        
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.backgroundColor = .orange
        self.button.setTitle("UIBUtton", for: .normal)
        self.button.setTitleColor(.gray, for: .normal)
        self.button.layer.masksToBounds = true
        self.button.layer.cornerRadius = 5.0

        self.button.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view).inset(100)
        }
        self.button.rx.tap.subscribe { event in
            print("onTapButton");
        }.disposed(by: disposeBag)
        
        //self.button.addTarget(self, action: #selector(onTapButton(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc internal func onTapButton(_ sender: Any) {
        if let _ = sender as? UIButton {
            print("onTapButton");
        }
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
