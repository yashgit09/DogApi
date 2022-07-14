//
//  DogViewController.swift
//  dogApiAsync
//
//  Created by user221908 on 7/13/22.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class DogViewController: UIViewController {

    @IBOutlet weak var dogImg: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    var dog: DogApi?
       
       override func viewDidLoad() {
           super.viewDidLoad()

    
           nameLbl.text = dog?.localized_name
           let imgUrl = "https://api.opendota.com" + (dog?.img)!
           print(imgUrl)
        dogImg.downloaded(from: imgUrl)
           
       }


}
