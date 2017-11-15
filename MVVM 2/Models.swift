//
//  Models.swift
//  MVVM 2
//
//  Created by Varun Rathi on 15/11/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

struct Photo {
    let id: Int
    let name: String
    let description: String?
    let created_at: Date
    let image_url: String
    let for_sale: Bool
    let camera: String?
}
