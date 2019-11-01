//
//  Singleton.swift
//  Nolan
//
//  Created by Mateus Nunes on 22/10/19.
//  Copyright © 2019 Mateus Nunes. All rights reserved.
//

import Foundation
import UIKit

class Singleton {
    
    static let shared = Singleton()
    var segmentedControlOption: Int!
    
    let sessions: [Session] =
    [
        Session(name: "Yang TaiChiChuan", difficulty: "Begginer", photo: UIImage(named: "image1")!, pose: [
            Pose(
                name: "YE-MA-FEN-ZONG",
                difficulty: "Easy",
                types: "Focus",
                steps: [
                "Dobrar levemente os joelhos e levantar os braços",
                "Dobrar os braços e esticar a palma das mãos",
                "Imagine-se acariciando a crina de um cavalo"
                ],
                favorite: true,
                jsonFilename: ""
            ),
            Pose(
                name: "BAI HE LIANG CHI",
                difficulty: "Easy",
                types: "Focus",
                steps: [
                "Flexionar os joelhos e se imaginar na mata",
                "Abrir e fechar seus braços, encostando uma mão na outra",
                "Repetir esse movimento delicadamente, imitando uma garça abrindo e fechando suas asas"],
                favorite: false,
                jsonFilename: ""
            ),
            Pose(
                name: "SHOU HUI PIPA",
                difficulty: "Easy",
                types: "Focus",
                steps: [
                    "Flexionar os joelhos e deixar as costas eretas",
                    "Respirar levemente e se imaginar em contato com a natureza",
                    "Se imaginar tocando harpa em um local bem silencioso"],
                favorite: false,
                jsonFilename: ""
            ),
            Pose(
                name: "DAO-NIAN-HOU",
                difficulty: "Easy",
                types: "Focus",
                steps: [
                "Dobrar levemente os joelhos e levantar os braços",
                "Repetir esses movimento calmamente",
                "Imagine-se empurrando e puxando um macaco"
                ],
                favorite: true,
                jsonFilename: ""
            ),
            Pose(
                name: "LAN QUE WEI",
                difficulty: "Easy",
                types: "Focus",
                steps: [
                "Respirar levemente, imaginando-se estar um um lugar deserto",
                "Imagine-se alisando a calda de um pardal",
                "Flexione os joelhos e os braços e repita"
                ],
                favorite: true,
                jsonFilename: ""
            ),
            Pose(
                name: "YUN SHOU",
                difficulty: "Easy",
                types: "Focus",
                steps: [
                "Respire calmamente, como se estivesse nas nuvens",
                "Siga as nuvens com suas mão, realizando movimentos delicados",
                "Realize movimentos laterais com calma e se imagine no meio das nuvens"
                ],
                favorite: true,
                jsonFilename: ""
            )
            ],
                category: "Focus",
                length: "5'"
        )
    ]
    private init(){}
    
    func requestForLocation(){
        
    }
    
}


