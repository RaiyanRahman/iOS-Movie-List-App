//
//  SearchViewController.swift
//  My Movie List
//
//  Created by Raiyan Rahman on 2018-10-24.
//  Copyright © 2018 Raiyan Rahman. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var searchText: UITextField!
    @IBOutlet var searchResultsTable: UITableView!
    
    var searchResults: [Movie] = []
    
    @IBAction func search(sender: UIButton) {
        print("Searching...")
        var searchTerm = searchText.text!
        if searchTerm.characters.count > 2 {
            retrieveMoviesByTerm(searchTerm: searchTerm)
        }
    }
    
    func retrieveMoviesByTerm(searchTerm: String) {
        let url = "http://www.omdbapi.com/?apikey=7ec9eda1&s=\(searchTerm)&type=movie&r=json"
        HTTPHandler.getJson(urlString: url, completionHandler: parseDataIntoMovies)
    }
    
    func parseDataIntoMovies(data: Data?) -> Void {
        if let data = data {
            let object = JSONParser.parse(data: data)
            if let object = object {
                self.searchResults = MovieDataProcessor.mapJsonToMovies(object: object, moviesKey: "Search")
                DispatchQueue.main.async {
                    self.searchResultsTable.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Search Results"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // grouped vertical sections of the table
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let idx: Int = indexPath.row
        movieCell.addFavButton.tag = idx
        movieCell.movieTitle?.text = searchResults[idx].title
        movieCell.movieYear?.text = searchResults[idx].year
        displayMovieImage(idx, movieCell: movieCell)
        return movieCell
    }
    
    func displayMovieImage(_ row: Int, movieCell: CustomTableViewCell) {
        let url: String = (URL(string: searchResults[row].imageURL)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {(data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute:{
                let image = UIImage(data: data!)
                movieCell.movieImageView?.image = image
            })
        }).resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
