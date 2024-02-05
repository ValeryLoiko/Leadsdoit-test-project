//
//  HistoryViewController.swift
//  Leadsdoit-Test-Project
//
//  Created by Diana on 04/02/2024.
//

import UIKit
import SnapKit
import UIColorHexSwift

class HistoryViewController: UIViewController {
    
    var historyData: [MarsPhotoCellModel] = [MarsPhotoCellModel(roverName: "asdads", cameraName: "asdads", earthDate: "asdad", imageUrl: "asdada"), MarsPhotoCellModel(roverName: "1111111", cameraName: "22222222", earthDate: "12.12.2312", imageUrl: "a")]
    
    private lazy var containerView = UIView()
    private lazy var backButton: UIButton = {
        var button = UIButton(type: .custom)
        button = UIButton.setupAction(type: .left)
        button.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
        return button
    }()
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "History"
        title.font = UIFont.largeTitle
        title.textAlignment = .center
        return title
    }()
    
    private lazy var emptyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "historyEmpty")
        return imageView
    }()
    
    private lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    private func configureView() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        containerView.backgroundColor = UIColor("#FF692C")
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        containerView.addSubview(backButton)
        containerView.addSubview(titleLabel)
        
//        if historyData.isEmpty {
//            view.addSubview(emptyImage)
//
//            emptyImage.snp.makeConstraints {
//                $0.width.equalTo(193)
//                $0.height.equalTo(186)
//                $0.center.equalToSuperview()
//            }
//        } else {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)

            view.addSubview(tableView)
            tableView.snp.makeConstraints {
                $0.leading.trailing.bottom.equalToSuperview()
                $0.top.equalTo(containerView.snp.bottom)
            }
//        }
        
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(132)
        }
        
        backButton.snp.makeConstraints {
            $0.width.height.equalTo(44)
            $0.top.equalToSuperview().inset(68)
            $0.leading.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(42)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(69)
        }
    }
    
    @objc private func backButtonTap() {
        navigationController?.popViewController(animated: true)
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier) as? HistoryTableViewCell else {
            return UITableViewCell()
        }
        
        let historyModel = historyData[indexPath.row]
        cell.configure(roverText: historyModel.roverName, cameraText: historyModel.cameraName, dateText: historyModel.earthDate)
    return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    
}


