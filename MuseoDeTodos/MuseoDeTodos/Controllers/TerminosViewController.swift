//
//  TerminosViewController.swift
//  MuseoDeTodos
//
//  Created by Abraham Cepeda Oseguera on 20/10/21.
//

import UIKit

class TerminosViewController: UIViewController {

    @IBOutlet weak var terminosTV: UITableView!
    
    let terminos = [Termino(title: " ", text: "Este sitio web es operado por MUSEO DE ARTE CONTEMPORÁNEO DE MONTERREY. En todo el sitio, los términos “nosotros”, “nos” y “nuestro” se refieren a MUSEO DE ARTE CONTEMPORÁNEO DE MONTERREY. MUSEO DE ARTE CONTEMPORÁNEO DE MONTERREY ofrece este sitio web, incluyendo toda la información, herramientas y servicios disponibles para ti en este sitio, el usuario, está condicionado a la aceptación de todos los términos, condiciones, políticas y notificaciones aquí establecidos.Al visitar nuestro sitio y/o comprar algo de nosotros, paticipas en nuestro “Servicio” y aceptas los siguientes términos y condiciones (“Términos de Servicio”, “Términos”), incluídos todos los términos y condiciones adicionales y las polítias a las que se hace referencia en el presente documento y/o disponible a través de hipervínculos. Estas Condiciones de Servicio se aplican a todos los usuarios del sitio, incluyendo si limitación a usuarios que sean navegadores, proveedores, clientes, comerciantes, y/o colaboradores de contenido.Por favor, lee estos Términos de Servicio cuidadosamente antes de acceder o utilizar nuestro sitio web. Al acceder o utilizar cualquier parte del sitio, estás aceptando los Términos de Servicio. Si no estás de acuerdo con todos los términos y condiciones de este acuerdo, entonces no deberías acceder a la página web o usar cualquiera de los servicios. Si las Términos de Servicio son considerados una oferta, la aceptación está expresamente limitada a estos Términos de Servicio. Cualquier función nueva o herramienta que se añadan a la tienda actual, tambien estarán sujetas a los Términos de Servicio. Puedes revisar la versión actualizada de los Términos de Servicio, en cualquier momento en esta página. Nos reservamos el derecho de actualizar, cambiar o reemplazar cualquier parte de los Términos de Servicio mediante la publicación de actualizaciones y/o cambios en nuestro sitio web. Es tu responsabilidad chequear esta página periódicamente para verificar cambios. Tu uso contínuo o el acceso al sitio web después de la publicación de cualquier cambio constituye la aceptación de dichos cambios.Nuestra tienda se encuentra alojada en Shopify Inc. Ellos nos proporcionan la plataforma de comercio electrónico en línea, que nos permite venderte nuestros productos y servicios."),Termino(title: "SECCIÓN 1 - TÉRMINOS DE LA TIENDA EN LÍNEA", text: "Al utilizar este sitio, declaras que tienes al menos la mayoría de edad en tu estado o provincia de residencia, o que tienes la mayoría de edad en tu estado o provincia de residencia y que nos has dado tu consentimiento para permitir que cualquiera de tus dependientes menores use este sitio. No puedes usar nuestros productos con ningún propósito ilegal o no autorizado tampoco puedes, en el uso del Servicio, violar cualquier ley en tu jurisdicción (incluyendo pero no limitado a las leyes de derecho de autor). No debes transmitir gusanos, virus o cualquier código de naturaleza destructiva.El incumplimiento o violación de cualquiera de estos Términos darán lugar al cese inmediato de tus Servicios."),Termino(title: "SECCIÓN 2 - CONDICIONES GENERALES", text: "Nos reservamos el derecho de rechazar la prestación de servicio a cualquier persona, por cualquier motivo y en cualquier momento. Entiendes que tu contenido (sin incluir la información de tu tarjeta de crédito), puede ser transferida sin encriptar e involucrar (a) transmisiones a través de varias redes; y (b) cambios para ajustarse o adaptarse a los requisitos técnicosde conexión de redes o dispositivos. La información de tarjetas de crédito está siempre encriptada durante la transferencia a través de las redes.Estás de acuerdo con no reproducir, duplicar, copiar, vender, revender o explotar cualquier parte del Servicio, usp del Servicio, o acceso al Servicio o cualquier contacto en el sitio web a través del cual se presta el servicio, sin el expreso permiso por escrito de nuestra parte.Los títulos utilizados en este acuerdo se icluyen solo por conveniencia y no limita o afecta a estos Términos.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTV()
    }
    
    func setupTV(){
        terminosTV.delegate = self
        terminosTV.dataSource = self
        let nib = UINib(nibName: "TerminoTableViewCell", bundle: nil)
        terminosTV.register(nib, forCellReuseIdentifier: "TerminoCell")
    }

}

extension TerminosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        terminos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = terminosTV.dequeueReusableCell(withIdentifier: "TerminoCell", for: indexPath) as! TerminoTableViewCell
        
        cell.titleLbl.text = terminos[indexPath.row].title
        cell.textLbl.text = terminos[indexPath.row].text
        return cell
    }
    
    
}
