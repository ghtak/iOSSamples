//
//  ViewController.swift
//  iOSSamples
//
//  Created by codex on 2022/12/16.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

extension Samples {
    func connectedViewController() -> UIViewController {
        switch self {
        case .UILabel: return UILabelViewController()
        case .UIButton: return UIButtonViewController()
        default: return UIViewController()
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }

        Observable.just(Samples.allCases)
            .bind(to: tableView.rx.items) { tableView, _, element in
                let cell = tableView.dequeueReusableCell(withIdentifier: "sampleTableCell")!
                cell.textLabel?.text = String(describing: element)
                return cell
            }.disposed(by: disposeBag)

        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
                self?.navigationController?.pushViewController(
                    Samples.allCases[indexPath.row].connectedViewController(),
                    animated: true)
                // print(Samples.allCases[indexPath.row])
            }).disposed(by: disposeBag)
    }
}
