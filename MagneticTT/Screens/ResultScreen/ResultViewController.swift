//
//  ResultViewController.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 01.04.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 8
        tableView.register(TableViewCustomCell.self, forCellReuseIdentifier: String(describing: TableViewCustomCell.self))
        return tableView
    }()
    
    private lazy var customView = CustomResultView()
    private var viewModel = ResultViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        setupNavBar()
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
        view.addSubview(customView)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        customView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Constraints.Calculated.customViewTopOffset)
            make.height.equalTo(customView.snp.width).dividedBy(Constraints.Fixed.customResultViewDividerHeight)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(Constraints.Fixed.baseOffset20)
        }
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constraints.Fixed.baseOffset20)
            make.top.equalTo(customView.snp.bottom).offset(Constraints.Calculated.tableViewTopOffset)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupNavBar() {
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    private func setupViewModel() {
        viewModel.onItemsUpdated = { [weak self] in
            guard let self = self else {
                return
            }
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
        return Value.resultTableViewRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDevice = viewModel.devices[indexPath.row]
        let detailedVC = DetailedViewController()
        detailedVC.deviceInfo = selectedDevice
        navigationController?.pushViewController(detailedVC, animated: true)
    }
}
