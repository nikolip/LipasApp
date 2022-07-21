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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = nil //set nil to prevent duplicate datasources
        registerCell()
        bindViewModel()
        viewModel.getSimpleSportPlaces()
        
    }
    
    private func registerCell() {
        let nib = UINib(nibName: SportPlaceTableViewCell.identifier, bundle:nil)
        tableView.register(nib, forCellReuseIdentifier: SportPlaceTableViewCell.identifier)
    }
    
    private func bindViewModel() {
        viewModel.simpleSportPlaceList.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: SportPlaceTableViewCell.identifier, cellType: SportPlaceTableViewCell.self)) { row, sportPlace, cell in
                cell.sportPlace = sportPlace
            }.disposed(by: disboseBag)
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
