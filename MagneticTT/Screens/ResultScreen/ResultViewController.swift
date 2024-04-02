//
//  ResultViewController.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 01.04.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.separatorColor = .customDarkGrey
        tableView.separatorInset = .zero
        tableView.separatorStyle = .singleLine
        tableView.layer.cornerRadius = 8
        tableView.register(TableViewCustomCell.self)
        return tableView
    }()
    
    private lazy var customView = CustomResultView()
    
    // MARK: - ViewModel
    
    private var viewModel = ResultViewModel()
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        setupNavBar()
        setupConstraints()
        setupViewModel()
        viewModel.fetchData()
    }
    
    // MARK: - ViewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
        title = Text.resultViewTilte
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

// MARK: - Extension UITableViewDataSource

extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(TableViewCustomCell.self)
        let device = viewModel.devices[indexPath.row]
        cell.configure(device: device)
        cell.layoutMargins = .zero
        return cell
    }
}

// MARK: - Extension UITableViewDelegate

extension ResultViewController: UITableViewDelegate {
    
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
