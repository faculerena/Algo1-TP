module Main where
main = undefined
-- Completar con los datos del grupo
--
-- Nombre de Grupo: xx
-- Integrante 1: Nombre Apellido, email, LU
-- Integrante 2: Nombre Apellido, email, LU
-- Integrante 3: Nombre Apellido, email, LU
-- Integrante 4: Nombre Apellido, email, LU


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

-- Dada una red social devolver los nombres de los usuarios.
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios rs = proyectarNombres (usuarios rs) 




-- toma una lista de usuarios y devuelve una lista de sus nombres sin ids ni nada
proyectarNombres :: [Usuario] -> [String]
proyectarNombres [] = []
proyectarNombres (u:us) = nombreDeUsuario u : proyectarNombres us




-- dada una red social y un usuario, devuelve los amigos del usuario
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe rs user = relacionesAAmigosDe (relaciones rs) user



-- toma una lista de relaciones y un usuario y devuelve una lista de usuarios que son amigos del usuario
relacionesAAmigosDe :: [Relacion] -> Usuario -> [Usuario]
relacionesAAmigosDe [] _ = []
relacionesAAmigosDe (r:rs) user | idDeUsuario (fst r) == idDeUsuario user = (snd r) : relacionesAAmigosDe rs user
                              | idDeUsuario (snd r) == idDeUsuario user = (fst r) : relacionesAAmigosDe rs user
                              | otherwise = relacionesAAmigosDe rs user





-- dada una red social y un usuario, devuelve la cantidad de amigos del usuario
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos rs user = length (amigosDe rs user)






-- describir qué hace la función: dada una red social, devuelve el usuario con más amigos
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos rs = encontrarUsuarioConMasAmigos rs (usuarios rs)






-- esto lo hace comparando la cantidad de amigos de un usuario con el hipotetico usuario con mas amigos (llamada recursiva), funcion que 
-- termina "colapsando" cuando se queda sin comparaciones y `x > todo el resto` 
encontrarUsuarioConMasAmigos :: RedSocial -> [Usuario] -> Usuario
encontrarUsuarioConMasAmigos rs (x:[]) = x 
encontrarUsuarioConMasAmigos rs (x:xs) | (cantidadDeAmigos rs x) > (cantidadDeAmigos rs (encontrarUsuarioConMasAmigos rs xs)) = x
                                       | otherwise = encontrarUsuarioConMasAmigos rs xs






-- describir qué hace la función: busca al usuario con mas amigos, si este usuario tiene mas de un millon de amigos, cumplio el sueño de roberto carlos
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos rs = cantidadDeAmigos rs (usuarioConMasAmigos rs) >= 1000000







-- describir qué hace la función: dada una red social y un usuario, devuelve todas las publicaciones de ese usuario
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe rs user = filtrarPublicaciones (publicaciones rs) user




-- toma la lista de publicaciones y el usuario, y chequea si la primera es del usuario, si es, la agrega a la respuesta, sino, llama recursivamente a la 
-- funcion con la cola de la lista de publicaciones
filtrarPublicaciones :: [Publicacion] -> Usuario -> [Publicacion]
filtrarPublicaciones [] _ = []
filtrarPublicaciones (p:ps) user | idDeUsuario (usuarioDePublicacion p) == idDeUsuario user = p : filtrarPublicaciones ps user
                                 | otherwise = filtrarPublicaciones ps user





-- describir qué hace la función: .....
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA rs user = filtrarPublicacionesQueLeGustanA (publicaciones rs) user




filtrarPublicacionesQueLeGustanA :: [Publicacion] -> Usuario -> [Publicacion]
filtrarPublicacionesQueLeGustanA [] _ = []
filtrarPublicacionesQueLeGustanA (p:ps) user | leGustaA user p = p : filtrarPublicacionesQueLeGustanA ps user
                                             | otherwise = filtrarPublicacionesQueLeGustanA ps user



leGustaA :: Usuario -> Publicacion -> Bool
leGustaA user p = elem user (likesDePublicacion p)




-- describir qué hace la función: .....
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones rs user1 user2 = (publicacionesQueLeGustanA rs user1) == (publicacionesQueLeGustanA rs user2) 
-- describir qué hace la función:
-- recibe una redsocialvalida red y un usuario valido u tal que u pertenece a la red social
-- devuelve true si existe un usuario u2 que pertenezca a la red social 
-- (distinto de u) tal que 
-- para toda publicacion pub que pertenece a la red, 
-- si el usuario que hizo la publicacion pub es u 
-- entonces el usuario u2 le dio like


-- agregue "tieneUnSeguidorFielAux2 primerLista [] = false" porque si el usuario no tiene publicaciones, listaDeLikesDePub rs user devuelve vacio, que en tieneunseguidorfielaux devuelve true, 
-- y si llegaba a aux2 cuando la llamaba con head de listaDeLikesDePub tira head de empty list.

tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel rs user = tieneUnSeguidorFielAux2 (head (listaDeLikesDePub rs user)) (listaDeLikesDePub rs user)

--Recursion sobre los usuarios que dieron like (posibles seguidores fieles) si el primer usuario que dio like a la primera publicacion no dio like a las demas, se fija si lo hizo el resto.
tieneUnSeguidorFielAux2 :: [Usuario] -> [[Usuario]] -> Bool
tieneUnSeguidorFielAux2 primerLista [] = False
tieneUnSeguidorFielAux2 primerLista listaDeLikesDePub | primerLista == [] = False
                                           | tieneUnSeguidorFielAux1 primerLista listaDeLikesDePub == False = tieneUnSeguidorFielAux2 (tail (primerLista)) listaDeLikesDePub 
                                           | otherwise = True

--Recursion sobre el listaDeLikesDePub (lista de listas de usuarios que dieron like) se fija si el primer usuario que dio like a la primera publicacion tambien le dio like a las demas.
tieneUnSeguidorFielAux1 :: [Usuario] -> [[Usuario]] -> Bool
tieneUnSeguidorFielAux1 primerLista [] = True
tieneUnSeguidorFielAux1 primerLista listaDeLikesDePub | elem (head primerLista) (head listaDeLikesDePub) = tieneUnSeguidorFielAux1 primerLista (tail listaDeLikesDePub)
                                           | otherwise = False



--listaDeLikesDePub = [[],[usuario1,usuario2]] : con este listaDeLikesDePub da false, como deberia dar, pero no se porque

-- si el user no tiene publicaciones , listaDeLikesDePub rs user pasa la lista vacia

--devuelve una lista con las listas de los usuarios que le dieron like a cada publicacion de un usuario : [[(1,osvaldo),(2,lucas)],[(1,osvaldo),(3,martin)],[(4,vinicius),(1,osvaldo)]]
--                                                                                         [[(1,osvaldo),(2,lucas)],[(1,osvaldo),(3,martin)],[(4,vinicius),(1,osvaldo)]]
listaDeLikesDePub :: RedSocial -> Usuario -> [[Usuario]]
listaDeLikesDePub rs user = filtrarLikesDePublicacionesDe (publicacionesDe rs user)

filtrarLikesDePublicacionesDe :: [Publicacion] -> [[Usuario]]
filtrarLikesDePublicacionesDe [] = []
filtrarLikesDePublicacionesDe pubDe = likesDePublicacion (head (pubDe)) : filtrarLikesDePublicacionesDe (tail pubDe)

--listaDeLikesDePub redA usuario4 = [[(usuario1,usuario2)],[]]




-- describir qué hace la función: .....
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos rs user userTarget = existeSecuenciaAux1 rs user userTarget 

existeSecuenciaAux1 :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaAux1 rs user userTarget | elem userTarget (amigosDe rs user) = True
                                       | otherwise = existeSecuenciaAux2 rs user userTarget (amigosDe rs user)



existeSecuenciaAux2 :: RedSocial -> Usuario -> Usuario -> [Usuario] -> Bool
existeSecuenciaAux2 rs user userTarget [] = False
existeSecuenciaAux2 rs user userTarget (x:xs) | elem userTarget (amigosDe rs x) = True
                                              | otherwise = existeSecuenciaAux2 rs user userTarget xs








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



