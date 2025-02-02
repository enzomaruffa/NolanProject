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
    var segmentedControlOption = -1
    var data: [Session]!
    var firstLoad = true
    
    var feedbacks = [RKFeedbackSession]()
    
    func loadDataTrainView(id:Int){
        switch id {
        case 0:
            print("Focus")
            data = sessions.filter({$0.category == "Focus"})
            
        case 1:
            print("Concentration")
             data = sessions.filter({$0.category == "Concentration"})
        case 2:
            print("Balance")
            data = sessions.filter({$0.category == "Balance"})
        default:
            return
        }
    }
    let sessions: [Session] = [
        Session(name: "Yang TaiChiChuan", difficulty: "Beginner", photo: UIImage(named: "image1")!, pose: [
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
                imageName: "1 - YE-MA-FEN-ZONG",
                jsonFilename: "s1p1"
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
                imageName: "2 - BAI HE LIANG CHI",
                jsonFilename: "s1p2"
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
                imageName: "3- SHOU HUI PIPA",
                jsonFilename: "s1p3"
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
                imageName: "4- DAO-NIAN-HOU",
                jsonFilename: "s1p4"
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
                imageName: "5- LAN QUE WEI",
                jsonFilename: "s1p5"
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
                imageName: "6- YUN SHOU",
                jsonFilename: "s1p6"
            )
            ],
                category: "Focus",
                length: "5'"
        ),
        Session(name: "大自然", difficulty: "Expert", photo: UIImage(named: "image2")!, pose: [
            Pose(
                name: "Parting the Horse's Mane",
                difficulty: "Medium",
                types: "Concentration",
                steps: [
                "Concentre seu peso na perna direita",
                "Transpondo o peso da perna esquerda levemente",
                "Repita o processo até que seu peso esteja equilibrado"
                ],
                favorite: false,
                imageName: "7- Parting the Horse's Mane",
                jsonFilename: "s2p1"
            ),
            Pose(
                name: "Part the Wild Horse's Mane (左右野马分鬃)",
                difficulty: "Hard",
                types: "Concentration",
                steps: [
                "Mantenha a mão direita na altura dos ombros",
                "Posicione a mão esquerda na altura da cintura",
                "Respire calmamente e tenha claro em sua mente o valor do contato com a natureza"],
                favorite: true,
                imageName: "8- PART the Wild Horse's Mane",
                jsonFilename: "s2p2"
            ),
            Pose(
                name: "Gong Bu",
                difficulty: "Easy",
                types: "Concentration",
                steps: [
                    "Mantenha a mão direita não altura da testa",
                    "Posicione a mão esquerda no nivel da cintura ",
                    "Imagine seu corpo se alinhando de acordo com cada posição adotada"],
                favorite: false,
                imageName: "9- Gong Bu",
                jsonFilename: "s2p3"
            ),
            Pose(
                name: "左右摟膝拗步",
                difficulty: "Easy",
                types: "Concentration",
                steps: [
                "Mude seu peso para trás, leve sua mão direita junto",
                "Recue o corpo levemente e continue",
                "Continue a recuar à medida que a mão esquerda se move na frente do rosto, como se acenasse sobre o ombro direito."
                ],
                favorite: true,
                imageName: "10- 左右摟膝拗步",
                jsonFilename: "s2p4"
            )
            ],
                category: "Concentration",
                length: "5'"
        ),
        Session(name: "Pínghéng", difficulty: "Medium", photo: UIImage(named: "image3")!, pose: [
            Pose(
                name: "Zuo Xia Shi Duli",
                difficulty: "Medium",
                types: "Balance",
                steps: [
                "Imagine que sua perna esquerda está fixa, como um peso no chão",
                "Uma cobra a rastejar, esse movimento sua perna direita deve realizar",
                "Entre em sintonia com a mãe natureza"
                ],
                favorite: true,
                imageName: "11- Zuo Xia Shi Duli",
                jsonFilename: "s3p1"
            ),
            Pose(
                name: "You Suo Yu Nu Chuan Suo",
                difficulty: "Medium",
                types: "Balance",
                steps: [
                "A pé esquerdo deve apontar para o céu, e a perna esticar-se",
                "Posicione a perna direita reflixonada em relação ao corpo",
                "Posicine o braço na frente da cabeça e realize movimentos suaves e calmos"],
                favorite: true,
                imageName: "12- You Suo Yu Nu Chuan Suo",
                jsonFilename: "s3p2"
            ),
            Pose(
               name: "左右摟膝拗步",
                difficulty: "Easy",
                types: "Balance",
                steps: [
                "Mude seu peso para trás, leve sua mão direita junto",
                "Recue o corpo levemente e continue",
                "Continue a recuar à medida que a mão esquerda se move na frente do rosto, como se acenasse sobre o ombro direito."
                ],
                favorite: true,
                imageName: "13- 左右摟膝拗步",
                jsonFilename: "s3p3"
            ),
            Pose(
                name: "Shan Tong Bei",
                difficulty: "Medium",
                types: "Balance",
                steps: [
                "Traga sua mão direita a frente do seu corpo",
                "Vire seu corpo para a direira levemente e dê um passo a frente com seu pé esquerdo",
                "Coloque seu peso no pé esquerdo e repita o processo com o outro pé"
                ],
                favorite: true,
                imageName: "14- Shan Tong Bei",
                jsonFilename: "s3p4"
            )
            ],
                category: "Balance",
                length: "5'"
        ),
        Session(name: "魂靈", difficulty: "Beginner", photo: UIImage(named: "image4")!, pose: [
            Pose(
                name: "Zhuan Shen Ban Lan Chui",
                difficulty: "Medium",
                types: "Focus",
                steps: [
                "Seu corpo deve seguir uma curva",
                "Com os pés juntos, seu tronco de move levemente de um lado para outro",
                "Seu braços abertos e flexionados, imagine que você é uma onda "
                ],
                
                favorite: false,
                imageName: "15- Zhuan Shen Ban Lan Chui",
                jsonFilename: "s4p1"
            ),
            Pose(
                name: "Ru Feng Si Bi",
                difficulty: "Hard",
                types: "Focus",
                steps: [
                "O punho direito deve estar a frente do corpo",
                "A mão esquerda passa por baixo do punho direito ",
                "Cotovelos e ombros permanecem baixos e flexíveis, mantenha as pernas abertas, flexionadas, e fixas"],
                favorite: true,
                imageName: "16- Ru Feng Si Bi",
                jsonFilename: "s4p2"
            ),
            Pose(
                name: "Hai Di Zhen",
                difficulty: "Medium",
                types: "Focus",
                steps: [
                    "Mantenha as duas mãos a frente do joelho",
                    "Curve as duas pernas, sendo que a esquerda estará na frente da outra",
                    "Imagine-se mergulhando em um mar profundo para procurar uma agulha"],
                favorite: false,
                imageName: "17- Hai Di Zhen",
                jsonFilename: "s4p3"
            ),
           Pose(
               name: "Parting the Horse's Mane",
               difficulty: "Medium",
               types: "Focus",
               steps: [
               "Concentre seu peso na perna direita",
               "Transpondo o peso da perna esquerda levemente",
               "Repita o processo até que seu peso esteja equilibrado"
               ],
               favorite: false,
               imageName: "18- Parting the Horse's Mane",
               jsonFilename: "s4p4"
           )
            ],
                category: "Focus",
                length: "5'"
        )
    ]
    private init(){}
    
    func requestForLocation(){
        
    }
    
    func getPosePosition(pose: Pose) -> (Int, Int) {
        for i in 0..<sessions.count {
            for j in 0..<sessions[i].pose.count {
                if sessions[i].pose[j].jsonFilename == pose.jsonFilename {
                    return (i, j)
                }
            }
        }
        return (-1, -1)
    }
}


