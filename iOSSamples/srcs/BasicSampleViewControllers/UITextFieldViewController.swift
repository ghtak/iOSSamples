//
//  UITextFieldViewController.swift
//  iOSSamples
//
//  Created by codex on 2022/12/19.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class UITextFieldViewController: BasicViewController,
    UITextFieldDelegate
{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UITextField"
        self.setupUI()
        self.dismissKeyboard()
    }

    func setupUI() {
        let textfield = UITextField()
        self.view.addSubview(textfield)
        textfield.backgroundColor = .gray
        textfield.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.left.right.equalToSuperview().inset(50)
        }
        // textfield.delegate = self

        textfield.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(
                onNext: { text in
                    print(text)
                }
            )
            .disposed(by: disposeBag)

        let button = UIButton(type: UIButton.ButtonType.system)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("SetAttrText", for: .normal)
        button.snp.makeConstraints { make in
            make.top.equalTo(textfield).offset(50)
            make.left.right.equalTo(textfield)
        }

        button.rx.tap
            .subscribe(onNext: { [weak self, weak textfield] in
                self?.configureTextField(textfield)
            }).disposed(by: disposeBag)
    }

    func configureTextField(_ textField: UITextField?) {
        let google = "google"
        let github = "github"
        let generalText = String(
            format: "고정된 링크로 이동하는 예제로 \n%@링크와 %@링크로 이동해봅시다",
            google,
            github
        )

        let italicFont = UIFont.italicSystemFont(ofSize: 18)
        let boldFont = UIFont.boldSystemFont(ofSize: 18)

        let green = UIColor.systemGreen
        let darkGray = UIColor.darkGray

        // NSAttributedString.Key, Value 속성 정의
        let generalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: darkGray,
            .font: boldFont
        ]
        let linkAttributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: green,
            .font: italicFont
        ]

        let mutableString = NSMutableAttributedString()

        // generalAttributes(기본 스타일) 적용
        mutableString.append(
            NSAttributedString(string: generalText, attributes: generalAttributes)
        )

        // 각 문자열의 range에 linkAttributes 적용
        mutableString.setAttributes(
            linkAttributes,
            range: (generalText as NSString).range(of: google)
        )
        mutableString.setAttributes(
            linkAttributes,
            range: (generalText as NSString).range(of: github)
        )

        textField?.attributedText = mutableString
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Begin = \(textField.text ?? "Empty")")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("End = \(textField.text ?? "Empty")")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return = \(textField.text ?? "Empty")")
        textField.resignFirstResponder()
        return true
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
