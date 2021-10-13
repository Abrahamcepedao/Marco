//
//  Evento.swift
//  MuseoDeTodos
//
//  Created by Abraham Cepeda Oseguera on 13/10/21.
//

import Foundation

struct Evento: Codable {
    let id: String
    let events: [String]
    let date: String
}
