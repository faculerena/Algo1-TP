import Test.HUnit
main = runTestTT testsPersonales


tests = test [
    " nombresDeUsuarios 1" ~: (nombresDeUsuarios redA) ~?= ["Juan","Natalia","Pedro","Mariela"],

    " amigosDe 1" ~: (amigosDe redA usuario1) ~?= [usuario2, usuario4],

    " cantidadDeAmigos 1" ~: (cantidadDeAmigos redA usuario1) ~?= 2,

    " usuarioConMasAmigos 1" ~: expectAny (usuarioConMasAmigos redA) [usuario2, usuario4],

    " estaRobertoCarlos 1" ~: (estaRobertoCarlos redA) ~?= False,

    " publicacionesDe 1" ~: (publicacionesDe redA usuario2) ~?= [publicacion2_1, publicacion2_2],

    " publicacionesQueLeGustanA 1" ~: (publicacionesQueLeGustanA redA usuario1) ~?= [publicacion2_2, publicacion4_1],

    " lesGustanLasMismasPublicaciones 2" ~: (lesGustanLasMismasPublicaciones redB usuario1 usuario3) ~?= True,

    " tieneUnSeguidorFiel 1" ~: (tieneUnSeguidorFiel redA usuario1) ~?= True,

    " existeSecuenciaDeAmigos 1" ~: (existeSecuenciaDeAmigos redA usuario1 usuario3) ~?= True
 ]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


testsPersonales = test [
--relacionesD = [relacion1_2, relacion2_3, relacion3_4, relacion4_5, relacion6_7]

    " existeSecuenciaDeAmigos 1" ~: (existeSecuenciaDeAmigos redD usuario1 usuario2) ~?= True,

    " existeSecuenciaDeAmigos 1" ~: (existeSecuenciaDeAmigos redD usuario1 usuario5) ~?= True,

   -- " existeSecuenciaDeAmigos 1" ~: (existeSecuenciaDeAmigos redD usuario6 usuario1) ~?= False,

    " existeSecuenciaDeAmigos 1" ~: (existeSecuenciaDeAmigos redD usuario1 usuario6) ~?= False,

    " existeSecuenciaDeAmigos 1" ~: (existeSecuenciaDeAmigos redD usuario7 usuario6) ~?= True,


    " nombresDeUsuarios 1" ~: (nombresDeUsuarios redB) ~?=  ["Juan", "Natalia", "Pedro", "Natalia"],

    " nombresDeUsuarios 2"  ~: (nombresDeUsuarios redC) ~?= ["Juan", "Natalia", "Pedro", "Mariela", "Natalia", "Santiago", "Laura", "Miguel", "Florencia", "José", "Camila", "Facundo", "Valentina", "Gabriel", "Marina"],

    " nombresDeUsuarios 3" ~: (nombresDeUsuarios ([],[],[])) ~?= [], --red vacia

    " amigosDe 1" ~: (amigosDe redB usuario1) ~?= [usuario2],

    " amigosDe 2" ~: (amigosDe redB usuario2) ~?= [usuario1, usuario3],

    " amigosDe 3" ~: (amigosDe redB usuario5) ~?= [], --usuario que no tiene ammigos

    " cantidadDeAmigos 1" ~: (cantidadDeAmigos redB usuario5) ~?= 0, 

    " cantidadDeAmigos 2" ~: (cantidadDeAmigos redB usuario4) ~?= 0, --testea a alguien que no esta en la red

    " cantidadDeAmigos 3" ~: (cantidadDeAmigos redC usuario1) ~?= 4,

    " tieneUnSeguidorFiel 1" ~: (tieneUnSeguidorFiel redB usuario5) ~?= False,

    " tieneUnSeguidorFiel 2" ~: (tieneUnSeguidorFiel redA usuario2) ~?= True,

    " tieneUnSeguidorFiel 3" ~: (tieneUnSeguidorFiel redB usuario3) ~?= False

    

    ]

-- Ejemplos


usuario1 = (1, "Juan")
usuario2 = (2, "Natalia")
usuario3 = (3, "Pedro")
usuario4 = (4, "Mariela")
usuario5 = (5, "Natalia")
usuario6 = (6, "Santiago")
usuario7 = (7, "Laura")
usuario8 = (8, "Miguel")
usuario9 = (9, "Florencia")
usuario10 = (10, "José")
usuario11 = (11, "Camila")
usuario12 = (12, "Facundo")
usuario13 = (13, "Valentina")
usuario14 = (14, "Gabriel")
usuario15 = (15, "Marina")


relacion1_2 = (usuario1, usuario2)
relacion1_3 = (usuario1, usuario3)
relacion1_4 = (usuario4, usuario1) -- Notar que el orden en el que aparecen los usuarios es indistinto
relacion2_3 = (usuario3, usuario2)
relacion2_4 = (usuario2, usuario4)
relacion3_4 = (usuario4, usuario3)
relacion2_5 = (usuario5, usuario2)
relacion3_5 = (usuario5, usuario3)
relacion4_5 = (usuario5, usuario4)
relacion5_6 = (usuario5, usuario6)
relacion6_7 = (usuario6, usuario7)
relacion8_9 = (usuario8, usuario9)
relacion10_11 = (usuario10, usuario11)
relacion12_13 = (usuario12, usuario13)
relacion14_15 = (usuario14, usuario15)
relacion12_1 = (usuario12, usuario1)
relacion12_2 = (usuario12, usuario2)
relacion12_3 = (usuario12, usuario3)
relacion12_4 = (usuario12, usuario4)
relacion12_5 = (usuario12, usuario5)


publicacion1_1 = (usuario1, "Este es mi primer post", [usuario2, usuario4])
publicacion1_2 = (usuario1, "Este es mi segundo post", [usuario4])
publicacion1_3 = (usuario1, "Este es mi tercer post", [usuario2, usuario5])
publicacion1_4 = (usuario1, "Este es mi cuarto post", [])
publicacion1_5 = (usuario1, "Este es como mi quinto post", [usuario5])

publicacion2_1 = (usuario2, "Hello World", [usuario4])
publicacion2_2 = (usuario2, "Good Bye World", [usuario1, usuario4])

publicacion3_1 = (usuario3, "Lorem Ipsum", [])
publicacion3_2 = (usuario3, "dolor sit amet", [usuario2])
publicacion3_3 = (usuario3, "consectetur adipiscing elit", [usuario2, usuario5])

publicacion4_1 = (usuario4, "I am Alice. Not", [usuario1, usuario2])
publicacion4_2 = (usuario4, "I am Bob", [])
publicacion4_3 = (usuario4, "Just kidding, i am Mariela", [usuario1, usuario3])

publicacion2_3 = (usuario2, "I love Haskell", [usuario3, usuario5])
publicacion2_4 = (usuario2, "Lorem ipsum dolor sit amet,", [usuario1, usuario4, usuario5])

publicacion3_4 = (usuario3, "consectetur adipiscing", [usuario1])
publicacion3_5 = (usuario3, "Proin lacinia erat", [usuario2, usuario4])
publicacion3_6 = (usuario3, "viverra sit amet.", [usuario5])

publicacion4_4 = (usuario4, "Cras ac dolor sapien", [usuario2, usuario3])
publicacion4_5 = (usuario4, "Sed in tristique dolor?", [usuario1, usuario5])
publicacion4_6 = (usuario4, "egestas pharetra odio. Integer", [usuario2])

publicacion5_1 = (usuario5, "bibendum neque tortor quis magna!", [usuario1, usuario2, usuario3, usuario4])
publicacion5_2 = (usuario5, "Pellentesque quis massa", [usuario3])
publicacion5_3 = (usuario5, "sed elit ultrices blandit", [usuario1, usuario2, usuario4])

usuariosA = [usuario1, usuario2, usuario3, usuario4]
relacionesA = [relacion1_2, relacion1_4, relacion2_3, relacion2_4, relacion3_4]
publicacionesA = [publicacion1_1, publicacion1_2, publicacion2_1, publicacion2_2, publicacion3_1, publicacion3_2, publicacion4_1, publicacion4_2]
redA = (usuariosA, relacionesA, publicacionesA)

usuariosB = [usuario1, usuario2, usuario3, usuario5]
relacionesB = [relacion1_2, relacion2_3]
publicacionesB = [publicacion1_3, publicacion1_4, publicacion1_5, publicacion3_1, publicacion3_2, publicacion3_3]
redB = (usuariosB, relacionesB, publicacionesB)

usuariosC = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12, usuario13, usuario14, usuario15]
relacionesC = [relacion12_1, relacion12_2, relacion12_3, relacion12_4, relacion12_5, relacion1_2, relacion1_3, relacion1_4, relacion2_3, relacion2_4, relacion2_5, relacion3_4, relacion3_5, relacion4_5, relacion6_7, relacion8_9, relacion10_11, relacion12_13, relacion14_15]
publicacionesC = [publicacion1_1, publicacion1_2, publicacion1_3, publicacion2_3, publicacion2_4, publicacion3_4, publicacion3_5, publicacion3_6, publicacion4_4, publicacion4_5, publicacion4_6, publicacion5_1, publicacion5_2, publicacion5_3]
redC = (usuariosC, relacionesC, [])

usuariosD = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7]
relacionesD = [relacion1_2, relacion2_3, relacion3_4, relacion4_5, relacion6_7]
redD = (usuariosD, relacionesD, [])



type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- Funciones basicas

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-- Ejercicios


-- ej 1
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios rs = proyectarNombres (usuarios rs) 

proyectarNombres :: [Usuario] -> [String]
proyectarNombres [] = []
proyectarNombres (u:us) = nombreDeUsuario u : proyectarNombres us

-- ej 2
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe rs user = relacionesAAmigosDe (relaciones rs) user

relacionesAAmigosDe :: [Relacion] -> Usuario -> [Usuario]
relacionesAAmigosDe [] _ = []
relacionesAAmigosDe (r:rs) user | idDeUsuario (fst r) == idDeUsuario user = (snd r) : relacionesAAmigosDe rs user
                              | idDeUsuario (snd r) == idDeUsuario user = (fst r) : relacionesAAmigosDe rs user
                              | otherwise = relacionesAAmigosDe rs user

-- ej 3
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos rs user = length (amigosDe rs user)

-- ej 4
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos rs = encontrarUsuarioConMasAmigos rs (usuarios rs)
 
encontrarUsuarioConMasAmigos :: RedSocial -> [Usuario] -> Usuario
encontrarUsuarioConMasAmigos rs (x:[]) = x 
encontrarUsuarioConMasAmigos rs (x:xs) | (cantidadDeAmigos rs x) > (cantidadDeAmigos rs (encontrarUsuarioConMasAmigos rs xs)) = x
                                       | otherwise = encontrarUsuarioConMasAmigos rs xs

--ej 5
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos rs = cantidadDeAmigos rs (usuarioConMasAmigos rs) >= 1000000

--ej 6
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe rs user = filtrarPublicaciones (publicaciones rs) user

filtrarPublicaciones :: [Publicacion] -> Usuario -> [Publicacion]
filtrarPublicaciones [] _ = []
filtrarPublicaciones (p:ps) user | idDeUsuario (usuarioDePublicacion p) == idDeUsuario user = p : filtrarPublicaciones ps user
                                 | otherwise = filtrarPublicaciones ps user


-- ej 7
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA rs user = filtrarPublicacionesQueLeGustanA (publicaciones rs) user

filtrarPublicacionesQueLeGustanA :: [Publicacion] -> Usuario -> [Publicacion]
filtrarPublicacionesQueLeGustanA [] _ = []
filtrarPublicacionesQueLeGustanA (p:ps) user | leGustaA user p = p : filtrarPublicacionesQueLeGustanA ps user
                                             | otherwise = filtrarPublicacionesQueLeGustanA ps user

leGustaA :: Usuario -> Publicacion -> Bool
leGustaA user p = elem user (likesDePublicacion p)




-- ej 8 
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones rs user1 user2 = (publicacionesQueLeGustanA rs user1) == (publicacionesQueLeGustanA rs user2) 


--ej 9
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel rs user = tieneUnSeguidorFielAux2 (head (listaDeLikesDePub rs user)) (listaDeLikesDePub rs user)

tieneUnSeguidorFielAux2 :: [Usuario] -> [[Usuario]] -> Bool
tieneUnSeguidorFielAux2 primerLista [] = False
tieneUnSeguidorFielAux2 primerLista listaDeLikesDePub | primerLista == [] = False
                                           | tieneUnSeguidorFielAux1 primerLista listaDeLikesDePub == False = tieneUnSeguidorFielAux2 (tail (primerLista)) listaDeLikesDePub 
                                           | otherwise = True

tieneUnSeguidorFielAux1 :: [Usuario] -> [[Usuario]] -> Bool
tieneUnSeguidorFielAux1 primerLista [] = True
tieneUnSeguidorFielAux1 primerLista listaDeLikesDePub | elem (head primerLista) (head listaDeLikesDePub) = tieneUnSeguidorFielAux1 primerLista (tail listaDeLikesDePub)
                                           | otherwise = False

listaDeLikesDePub :: RedSocial -> Usuario -> [[Usuario]]
listaDeLikesDePub rs user = filtrarLikesDePublicacionesDe (publicacionesDe rs user)

filtrarLikesDePublicacionesDe :: [Publicacion] -> [[Usuario]]
filtrarLikesDePublicacionesDe [] = []
filtrarLikesDePublicacionesDe pubDe = likesDePublicacion (head (pubDe)) : filtrarLikesDePublicacionesDe (tail pubDe)



-- ej 10
-- describir qué hace la función: DFS lol no se me ocurrio nada mejor y es RECONTRA overkill    

existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos (_, rs, _) user1 user2 = secAmigosAux rs user1 user2 []

secAmigosAux :: [Relacion] -> Usuario -> Usuario -> [Usuario] -> Bool
secAmigosAux rs user1 user2 vistos | user1 == user2 = True
                                   | otherwise = secAmigosAux2 rs user1 user2 vistos amigos
                                     where amigos = amigosDeUsuario rs user1

secAmigosAux2 :: [Relacion] -> Usuario -> Usuario -> [Usuario] -> [Usuario] -> Bool
secAmigosAux2 _ _ _ _ [] = False
secAmigosAux2 rs user1 user2 vistos (amigo:resto) | elem amigo vistos = secAmigosAux2 rs user1 user2 vistos resto
                                                  | amigo == user2 = True
                                                  | otherwise = secAmigosAux2 rs amigo user2 (user1:vistos) (amigosDeUsuario rs amigo ++ resto)

amigosDeUsuario :: [Relacion] -> Usuario -> [Usuario]
amigosDeUsuario rs usuario = amigosDeUsuarioAux rs usuario []

amigosDeUsuarioAux :: [Relacion] -> Usuario -> [Usuario] -> [Usuario]
amigosDeUsuarioAux [] _ amigos = amigos
amigosDeUsuarioAux ((user1, user2):rs) usuario amigos | user1 == usuario && not (elem user2 amigos) = amigosDeUsuarioAux rs usuario (user2:amigos)
                                                      | user2 == usuario && not (elem user1 amigos) = amigosDeUsuarioAux rs usuario (user1:amigos)
                                                      | otherwise = amigosDeUsuarioAux rs usuario amigos
