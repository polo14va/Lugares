//
//  DetailViewController.swift
//  Mis Recetas 2
//
//  Created by Pedro Martinez on 20/9/16.
//  Copyright © 2016 Pedro Martinez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var placeImageView: UIImageView!

    @IBOutlet var tableView: UITableView!
    var place: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = place.name
        
        self.placeImageView.image = self.place.image
        
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func close(segue: UIStoryboardSegue){

        }
    


    func prepare(for segue:UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            let destinationViewController = segue.destination as! MapViewController
            destinationViewController.place = self.place
       
        }
    }
}


extension DetailViewController : UITableViewDataSource{
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPlaceCell", for: indexPath) as! PlaceDetailViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Nombre: "
                cell.valueLabel.text = self.place.name
            case 1:
                cell.keyLabel.text = "Tipo: "
                cell.valueLabel.text = self.place.type
            case 2:
                cell.keyLabel.text = "Localizacion: "
                cell.valueLabel.text = self.place.location
            case 3:
                cell.keyLabel.text = "Telefono: "
                cell.valueLabel.text = self.place.telephone
            
            case 4:
                cell.keyLabel.text = "Web: "
                cell.valueLabel.text = self.place.website
            default:
                break
            }
        
        
        return cell
    }
    
    
}





extension DetailViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        switch indexPath.row {
        case 2:
            // Opcion de geolocalizacion
            self.performSegue(withIdentifier: "showMap", sender: nil)
        default:
            break
        }
    }
    
}


