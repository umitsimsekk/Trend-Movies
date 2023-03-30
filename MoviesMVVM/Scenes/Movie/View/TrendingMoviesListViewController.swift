//
//  TrendingMoviesListViewController.swift
//  tryMovies
//
//  Created by Ümit Şimşek on 27.03.2023.
//

import UIKit

class TrendingMoviesListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var trendingMoviesViewModel = TrendingMoviesViewModel()
    
    var detailsModel : DetailsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}
extension TrendingMoviesListViewController {
    func configuration(){
        initMovieModel()
        tableViewConfiguration()
        observeEvent()
    }
    func initMovieModel(){
        trendingMoviesViewModel.fetchAllMovies()
    }
    func tableViewConfiguration(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemBackground
    }
    func observeEvent() {
            trendingMoviesViewModel.eventHandler = { [weak self] event in
                guard let self else { return }
                
                switch event {
                case .loading :
                    print("Product loading...")
                case .stopLoading:
                    print("Stop loading...")
                case .dataLoaded :
                    print("Data loaded...")
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                        print("data reloaded")
                    }
                case .error(let error):
                    print(error)
                }
                
            }
        }
}

extension TrendingMoviesListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMoviesViewModel.numberOfRows(in: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MovieCell else {
            return UITableViewCell()
        }
        let result = trendingMoviesViewModel.trendingMovies?.results[indexPath.row]
        if result != nil{
            let movieCellModel = MovieCellModel(movie: result!)
            cell.selectionStyle = .none
            cell.movie = movieCellModel
        }
        return  cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = trendingMoviesViewModel.trendingMovies?.results[indexPath.row]
        
        detailsModel = DetailsModel(movie: result!)
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            DispatchQueue.main.async {
                destinationVC.movie = self.detailsModel
            }
        }
    }
}
