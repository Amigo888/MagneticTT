//
//  ResultViewController.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 01.04.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    private lazy var scanWiFiLabel = UILabel(
        text: "Scanning Your Wi-Fi",
        textColor: .white,
        font: Resources.Font.robotoRegular(15)
    )
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.register(TableViewCustomCell.self, forCellReuseIdentifier: String(describing: TableViewCustomCell.self))
        return tableView
    }()
    
    private var viewModel = ResultViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
        addViews()
        setupConstraints()
        setupViewModel()
        viewModel.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
        title = "Result"
    }
    
    private func addViews() {
        view.addSubview(tableView)
        view.addSubview(scanWiFiLabel)
    }
    
    private func setupConstraints() {
        
        scanWiFiLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(scanWiFiLabel.snp.bottom).offset(40)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: -0.41
        ]
        let backButton = UIBarButtonItem()
        backButton.tintColor = .customPurpleLight
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setupViewModel() {
        viewModel.onItemsUpdated = { [weak self] in
            guard let self = self else { return }
            self.reloadTableViewData()
        }
    }
    
    private func reloadTableViewData() {
        DispatchQueue.main.async {
            UIView.performWithoutAnimation {
                self.tableView.reloadData()
            }
        }
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: TableViewCustomCell.self),
            for: indexPath
        ) as? TableViewCustomCell else {
            return UITableViewCell()
        }
        let device = viewModel.devices[indexPath.row]
        cell.configure(device: device)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
}
