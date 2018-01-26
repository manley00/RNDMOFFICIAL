//
//  ThoughtCell.swift
//  RNDM
//
//  Created by Manley  on 1/15/18.
//  Copyright © 2018 Manley Celicourt. All rights reserved.
//

import UIKit
import Firebase

class ThoughtCell: UITableViewCell {
    
//    Outlets
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var thoughtTxtLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLbl: UILabel!
    
//    variables
    private var thought: Thought!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(liketapped))
        likesImg.addGestureRecognizer(tap)
        likesImg.isUserInteractionEnabled = true
    }
    
    @objc func liketapped() {
//        method 1
//        Firestore.firestore().collection(THOUGHTS_REF).document(thought.documentId)
//            .setData([NUM_LIKES : thought.numLikes + 1], options: SetOptions.merge())
        
//        method 2
        Firestore.firestore().document("thoughts/\(thought.documentId!)")
        .updateData([NUM_LIKES : thought.numLikes + 1])
    }
    
    func configureCell(thought: Thought) {
        self.thought = thought
        usernameLbl.text = thought.username
        thoughtTxtLbl.text = thought.thouughtTxt
        likesNumLbl.text = String(thought.numLikes)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timestamp = formatter.string(from: thought.timestamp)
        timestampLbl.text = timestamp
    }

}
