# remoti

# En la prueba tecnica se va a escoger clean architechture para la estructura de carpetas por los siguientes motivos:
1. Facilidad para separar la logica de negocio, la UI, los contratos del dominio.
2. Facilidad de testear logica de negocio y UI. 
3. Familiaridad con clean arcitecture.

# Se implemento Riverpod como gestor de estados, teniendo en cuenta:
1. Gestor con suporte y gran comunidad
2. Familirialidad trabajando con riverpod
3. Curva corta de aprendizaje
4. Permite gestionar estado complejos

# El proyecto se separo en features, donde cada feature tiene una separacion clara en las clases que definen el contrato de la feature:
1. domain se encarga unicamente de la definicion de contratos
2. data se encarga de la implementacion de repositorios, modelo de datos con base a las entidades definidas.
3. Prentation se encarga unicamente del manejo de estados y el renderizado de la UI.

# Por falta de tiempo la capa de presentation queda inconclusa, falta la vista de detalle y la vista en desktop.

# Faltaria Manjear los errores al cargar y el reintento al fallar.

# Si tuviese mas tiempo corregiria errores, refinaria las vistas
