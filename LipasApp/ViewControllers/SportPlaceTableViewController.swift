//
//  SportPlaceListViewController.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class SportPlaceTableViewController : UITableViewController {
    
    let viewModel = SportPlaceTableViewModel()
    private let disboseBag = DisposeBag()
    let indicatorView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sport Places"
        
        //set nil to prevent duplicate datasources
        tableView.dataSource = nil
        
        registerCell()
        bindSportPlaceTable()
        
        //add background view to table for activity indicator
        addBackGroundViewToTable()
        bindActivityIndicator()
        
        bindAlerts()
        
        viewModel.getSimpleSportPlaces()
    }
    
    private func addBackGroundViewToTable() {
        tableView.backgroundView = indicatorView
    }
    
    private func registerCell() {
        let nib = UINib(nibName: SportPlaceTableViewCell.identifier, bundle:nil)
        tableView.register(nib, forCellReuseIdentifier: SportPlaceTableViewCell.identifier)
    }
    
    private func bindSportPlaceTable() {
        viewModel.simpleSportPlaceList.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: SportPlaceTableViewCell.identifier, cellType: SportPlaceTableViewCell.self)) { row, sportPlace, cell in
                cell.sportPlace = sportPlace
            }.disposed(by: disboseBag)
    }
    
    private func bindActivityIndicator() {
        viewModel.showLoadingIcon.asObservable()
            .subscribe(onNext: { status in
                status ? self.indicatorView.showLoader() : self.indicatorView.dismissLoader()
            }).disposed(by: disboseBag)
    }
    
    private func bindAlerts() {
        viewModel.showError.asObservable()
            .filter{$0}
            .subscribe({ _ in
                self.showAlert(title: "Error", message: "Something went wrong")
            }).disposed(by: disboseBag)
    }
    
    //MARK: -- overrides    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sportPlaceTableToDetails", sender: nil)
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sportPlaceTableToDetails",
           let destinationViewContoller = segue.destination as? SportPlaceDetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            let sportPlace = viewModel.simpleSportPlaceList.value[indexPath.row]
            destinationViewContoller.viewModel = SportPlaceDetailsViewModel(sportPlaceId: sportPlace.sportsPlaceId)
        }
    }
}
