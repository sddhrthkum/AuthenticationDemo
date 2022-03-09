//
//  EmployeeDetailsViewController.swift
//  AuthenticationDemo
//
//  Created by Siddharth Kumar on 10/03/22.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var empIDLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    let viewModel: EmployeeViewModelType = EmployeeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Emplyee Details"
        setUpUI()
    }
    
    private func setUpUI() {
        nameLabel.text = viewModel.name
        companyNameLabel.text = viewModel.company
        empIDLabel.text = viewModel.employeeId
        addressLabel.text = viewModel.address
    }
}
