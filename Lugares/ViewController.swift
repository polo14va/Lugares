//
//  ViewController.swift
//  Mis Recetas 2
//
//  Created by Pedro Martinez on 16/9/16.
//  Copyright © 2016 Pedro Martinez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var places : [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        var place = Place(name: "Alexander Platz", type: "Plaza", location: "Alexanderstraße 4 10178 Berlin Deutschland",telephone: "4567654345", website:"https://www.udemy.com/swift-3-ios-10/learn/v4/t/lecture/5419636", image: #imageLiteral(resourceName: "alexanderplatz"))
        places.append(place)
        
        place = Place(name: "Atomium", type: "mueusm", location: "Atomiumsquare 1 1020 Bruxelles België", telephone: "4567654345", website:"https://www.udemy.com/swift-3-ios-10/learn/v4/t/lecture/5419636", image: #imageLiteral(resourceName: "atomium"))
        places.append(place)
        
        place = Place(name: "Big Bend", type: "Monumento", location: "London SW1A 0AA England", telephone: "4567654345", website:"https://www.udemy.com/swift-3-ios-10/learn/v4/t/lecture/5419636", image: #imageLiteral(resourceName: "Big ben"))
        places.append(place)

        place = Place(name: "Cristo Redentor", type: "Monumento", location: "João Pessoa - PB Brasil", telephone: "4567654345", website:"https://www.udemy.com/swift-3-ios-10/learn/v4/t/lecture/5419636", image:#imageLiteral(resourceName: "cristo-redentor") )
        places.append(place)
        
        place = Place(name: "Torre Eifel", type: "Monumento", location: "5 Avenue Anatole France 75007 Paris France", telephone: "4567654345", website:"https://www.udemy.com/swift-3-ios-10/learn/v4/t/lecture/5419636", image: #imageLiteral(resourceName: "torre"))
        places.append(place)
        
        place = Place(name: "Gran muralla China", type: "Monumento", location: "慕田峪长城 中国北京市", telephone: "4567654345", website:"https://www.udemy.com/swift-3-ios-10/learn/v4/t/lecture/5419636", image: #imageLiteral(resourceName: "China"))
        places.append(place)
        
        place = Place(name: "Torre de Pizza", type: "Monumento", location: "Torre di Pisa 56126 Pisa Italia", telephone: "4567654345", website:"https://www.udemy.com/swift-3-ios-10/learn/v4/t/lecture/5419636", image: #imageLiteral(resourceName: "pisa"))
        places.append(place)
        
        place = Place(name: "La Seu de Mallorca", type: "Catedral", location: "La Seu Plaza de la Seu 5 07001 Palma Baleares, España", telephone: "4567654345", website:"https://www.udemy.com/swift-3-ios-10/learn/v4/t/lecture/5419636", image: #imageLiteral(resourceName: "seu"))
        places.append(place)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool { // ocultar barra de estado
        return true
    }
    
    //MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = places[indexPath.row]
        let cellID = "PlaceCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PlaceCell
        
        cell.thumbnailimageView.image = place.image
        cell.nameLabel.text = place.name
        cell.timeLabel.text = place.type
        cell.ingradientsLabel.text = place.location
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.places.remove(at: indexPath.row)
            
        }
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // COmpartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let place = self.places[indexPath.row]
            
            let shareDefaultText = "Estoy visitando \(place.name) en la app del curso"
            
            let activiyController = UIActivityViewController(activityItems: [shareDefaultText, place.image], applicationActivities: nil)
            
            self.present(activiyController, animated: true, completion: nil)
            
        }
        
        shareAction.backgroundColor = UIColor(colorLiteralRed: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        //// Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.places.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    
    // MARK: - UITableViewDelegate
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedPlace = self.places[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.place = selectedPlace
            }
        }
    }
    
    
    
}

