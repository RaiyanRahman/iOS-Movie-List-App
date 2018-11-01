//
//  ViewController.swift
//  My Movie List
//
//  Created by Raiyan Rahman on 2018-10-22.
//  Copyright © 2018 Raiyan Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favouriteMovies: [Movie] = []
    @IBOutlet var mainTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchMoviesSegue" {
            let controller = segue.destination as! SearchViewController
            controller.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let idx: Int = indexPath.row
        movieCell.movieTitle?.text = favouriteMovies[idx].title
        movieCell.movieYear?.text = favouriteMovies[idx].year
        displayMovieImage(idx, movieCell: movieCell)
        return movieCell
    }
    
    func displayMovieImage(_ row: Int, movieCell: CustomTableViewCell)  {
        let url: String = (URL(string: favouriteMovies[row].imageURL)?.absoluteString)!
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
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
        if self.favouriteMovies.count == 0   {
            favouriteMovies.append(Movie(id: "tt0372784", title: "Batman Begins", year: "2005", imageURL: "https://images-na.ssl-images-amazon.com/images/M/MV5BNTM3OTc0MzM2OV5BMl5BanBnXkFtZTYwNzUwMTI3._V1_SX300.jpg"))
        }
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

