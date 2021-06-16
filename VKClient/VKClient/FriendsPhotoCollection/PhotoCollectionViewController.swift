//
//  PhotoCollectionViewController.swift
//  VKClient
//
//  Created by Илья Лебедев on 27.05.2021.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    
    var user: User?
    var photoArray = [UIImage]()
    
    let photoCollectionViewCellReuse = "PhotoCollectionViewCell"
    let toFriendPhoto = "toFriendPhoto"
    let reuseIdentifier = "Cell"
    var indexPath1: IndexPath!
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
        self.collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: photoCollectionViewCellReuse)
        
//        collectionView.performBatchUpdates(nil) { (result) in
//            self.collectionView.scrollToItem(at: self.indexPath1, at: .centeredHorizontally, animated: false)
//            
//        }
        guard let _ = user,
              let array = user?.photoCollection else {
            return
        }
        photoArray = array
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (user?.photoCollection.count)!
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCollectionViewCellReuse, for: indexPath) as? PhotoCollectionViewCell
        else {return UICollectionViewCell()}
        cell.configure(image: photoArray[indexPath.item], like: #imageLiteral(resourceName: "23"), comment: #imageLiteral(resourceName: "25"))
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = collectionView.bounds.width
        let insets = collectionView.contentInset.left + collectionView.contentInset.right
        width -= insets
        width -= 10
        width /= 4
        return CGSize(width: width, height: width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        photoArray = [user!.photoCollection[indexPath.item]]
        performSegue(withIdentifier: toFriendPhoto, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //вызываем подготовку к переходу
        super.prepare(for: segue, sender: sender)
        
        // проверяем что индитификатор называется "toFriendPhoto"
        if segue.identifier == toFriendPhoto {
            
            guard let detailVC = segue.destination as? FriendPhotoViewController,
                  let indexPath = self.collectionView.indexPathsForSelectedItems?.first else { return }
            photoArray = [user!.photoCollection[indexPath.item]]
            detailVC.photos = photoArray
        }
    }
}

        
   
    

