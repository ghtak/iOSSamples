//
//  UIButtonViewController.swift
//  iOSSamples
//
//  Created by codex on 2022/12/18.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class UIButtonViewController: BasicViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UIButton"

        var top_constraint_view: UIView?

        let btn_types = [UIButton.ButtonType.system,
                         UIButton.ButtonType.close,
                         UIButton.ButtonType.contactAdd,
                         UIButton.ButtonType.custom,
                         UIButton.ButtonType.detailDisclosure,
                         UIButton.ButtonType.infoDark,
                         UIButton.ButtonType.infoLight]
        let btn_type_names = ["system",
                              "close",
                              "contactAdd",
                              "custom",
                              "detailDisclosure",
                              "infoDark",
                              "infoLight"]

        for (buttonType, name) in zip(btn_types, btn_type_names) {
            let button = UIButton(type: buttonType)
            self.view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .gray
            button.setTitle(name, for: .normal)
            button.setTitleColor(.black, for: .normal)
            //button.layer.masksToBounds = true
            //button.layer.cornerRadius = 5.0
            button.snp.makeConstraints { make in
                if top_constraint_view == nil{
                    make.top.equalTo(self.view!).inset(100)
                } else{
                    make.top.equalTo(top_constraint_view!).inset(50)
                }
                make.left.right.equalTo(self.view).inset(100)
            }
            button.rx.tap.subscribe { event in
                print(name);
            }.disposed(by: disposeBag)
            top_constraint_view = button
        }
        /*
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
         */
        // self.button.addTarget(self, action: #selector(onTapButton(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    @objc internal func onTapButton(_ sender: Any) {
        if let _ = sender as? UIButton {
            print("onTapButton")
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
