module Solution where
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
relacionesAAmigosDe (r:rs) user | (fst r) == user = (snd r) : relacionesAAmigosDe rs user
                              | (snd r) == user = (fst r) : relacionesAAmigosDe rs user
                              | otherwise = relacionesAAmigosDe rs user





-- dada una red social y un usuario, devuelve la cantidad de amigos del usuario
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos rs user = length (amigosDe rs user)






-- describir qué hace la función: dada una red social, devuelve el usuario con más amigos
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ([],_,_) = undefined
usuarioConMasAmigos rs = encontrarUsuarioConMasAmigos rs (usuarios rs)






-- esto lo hace comparando la cantidad de amigos de un usuario con el hipotetico usuario con mas amigos (llamada recursiva), funcion que 
-- termina "colapsando" cuando se queda sin comparaciones y `x > todo el resto` 
encontrarUsuarioConMasAmigos :: RedSocial -> [Usuario] -> Usuario
encontrarUsuarioConMasAmigos rs (x:[]) = x 
encontrarUsuarioConMasAmigos rs (x:xs) | (cantidadDeAmigos rs x) > (cantidadDeAmigos rs (encontrarUsuarioConMasAmigos rs xs)) = x
                                       | otherwise = encontrarUsuarioConMasAmigos rs xs






-- describir qué hace la función: busca al usuario con mas amigos, si este usuario tiene mas de un millon de amigos, cumplio el sueño de roberto carlos
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos rs = cantidadDeAmigos rs (usuarioConMasAmigos rs) >= 10







-- describir qué hace la función: dada una red social y un usuario, devuelve todas las publicaciones de ese usuario
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe rs user = filtrarPublicaciones (publicaciones rs) user




-- toma la lista de publicaciones y el usuario, y chequea si la primera es del usuario, si es, la agrega a la respuesta, sino, llama recursivamente a la 
-- funcion con la cola de la lista de publicaciones
filtrarPublicaciones :: [Publicacion] -> Usuario -> [Publicacion]
filtrarPublicaciones [] _ = []
filtrarPublicaciones (p:ps) user | usuarioDePublicacion p == user = p : filtrarPublicaciones ps user
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
existeSecuenciaDeAmigos (_, rel, _) user1 user2 = secAmigosAux rel user1 user2 []

secAmigosAux :: [Relacion] -> Usuario -> Usuario -> [Usuario] -> Bool
secAmigosAux rel user1 user2 vistos | user1 == user2 = True
                                   | otherwise = secAmigosAux2 rel user1 user2 vistos amigos
                                     where amigos = amigosDeUsuario rel user1

secAmigosAux2 :: [Relacion] -> Usuario -> Usuario -> [Usuario] -> [Usuario] -> Bool
secAmigosAux2 _ _ _ _ [] = False
secAmigosAux2 rel user1 user2 vistos (amigo:resto) | elem amigo vistos = secAmigosAux2 rel user1 user2 vistos resto
                                                  | amigo == user2 = True
                                                  | otherwise = secAmigosAux2 rel amigo user2 (user1:vistos) (amigosDeUsuario rel amigo ++ resto)

amigosDeUsuario :: [Relacion] -> Usuario -> [Usuario]
amigosDeUsuario rel usuario = relacionesAAmigosDe rel usuario

