//
//  UILabelViewController.swift
//  iOSSamples
//
//  Created by codex on 2022/12/18.
//

import SnapKit
import UIKit

class UILabelViewController: BasicViewController {
    lazy var label: UILabel = {
        // Define the size of the label.

        let label = UILabel()
        label.backgroundColor = .orange
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = "Hello UILabel"
        label.numberOfLines = 0

        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5.0
        label.shadowColor = .gray

        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UILabel"
        self.view.addSubview(self.label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.snp.makeConstraints { make in
            // 1
            // make.top.equalToSuperview().offset(100)
            // make.left.equalToSuperview().offset(100)
            // make.right.equalToSuperview().offset(-100)

            // 2
            // make.top.equalToSuperview().offset(100)
            // make.left.right.equalToSuperview().inset(100)

            // 3
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.left.right.equalToSuperview().inset(
                UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 100))
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
