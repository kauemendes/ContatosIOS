//
//  SyncServer.swift
//  Contatos
//
//  Created by Kaue Mendes on 3/10/15.
//  Copyright (c) 2015 Fellas Group. All rights reserved.
//

import Foundation

protocol SyncServerDelegate: class{
    func infoSaved()
}


class SyncServer {
    
    weak var delegate: SyncServerDelegate?
    
    init(){}
    
    func SendToBD() {
        //.. Enviar as informacoes para o banco de dados
        
        
        //exibe mensagem do delegate
        delegate?.infoSaved()
    }
    
}