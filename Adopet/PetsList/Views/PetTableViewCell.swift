//
//  PetTableViewCell.swift
//  Adopet
//
//  Created by Giovanna Moeller on 14/02/24.
//

import UIKit

class PetTableViewCell: UITableViewCell {

    @IBOutlet weak var dogImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dogDescription: UILabel!
    @IBOutlet weak var location: UILabel!
    
    private var imageDowloader = ImageDownloader()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(pet: Pet) {
        imageDowloader.downloadImage(from: pet.imageUrl) { data in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    self.dogImg.image = image
                }
            }
        }
        name.text = pet.name
        dogDescription.text = "\(pet.age)\n\(pet.size)\n\(pet.behavior)"
        location.text = pet.location
    }
    
}
