module Solution where
-- Completar con los datos del grupo
--
-- Nombre de Grupo: Gophers
-- Integrante 1: Facundo Lerena, faculerena@gmail.com, 591/19
-- Integrante 2: Tobias Causevic, tobiacause@gmail.com, 413/22 
-- Integrante 3: Tomas Bruni, tomasbruni3@gmail.com, 894/22
-- Integrante 4: Sofia Juarez Guillen, sjuarezlc@gmail.com, 152/19


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

-- 1) Dada una red social devolver los nombres de los usuarios que pertenecen a la red.
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios rs = proyectarNombres (usuarios rs) 

proyectarNombres :: [Usuario] -> [String]
proyectarNombres [] = []
proyectarNombres (u:us) = nombreDeUsuario u : proyectarNombres us


-- 2) Dada una red social y un usuario, devuelve los amigos del usuario dentro de esa red social
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe rs user = relacionesAAmigosDe (relaciones rs) user

relacionesAAmigosDe :: [Relacion] -> Usuario -> [Usuario]
relacionesAAmigosDe [] _ = []
relacionesAAmigosDe (r:rs) user | (fst r) == user = (snd r) : relacionesAAmigosDe rs user
                                | (snd r) == user = (fst r) : relacionesAAmigosDe rs user
                                | otherwise = relacionesAAmigosDe rs user


-- 3) Dada una red social y un usuario, devuelve la cantidad de amigos del usuario
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos rs user = length (amigosDe rs user)


-- 4) Dada una red social, devuelve el usuario con más amigos
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos ([],_,_) = undefined
usuarioConMasAmigos rs = encontrarUsuarioConMasAmigos rs (usuarios rs)

encontrarUsuarioConMasAmigos :: RedSocial -> [Usuario] -> Usuario
encontrarUsuarioConMasAmigos rs (x:[]) = x 
encontrarUsuarioConMasAmigos rs (x:xs) | (cantidadDeAmigos rs x) > (cantidadDeAmigos rs (encontrarUsuarioConMasAmigos rs xs)) = x
                                       | otherwise = encontrarUsuarioConMasAmigos rs xs



-- 5) Dada una red social, devuelve true si esta roberto carlos (o sea, hay alguien con mas de "un millon" de amigos)
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos rs = cantidadDeAmigos rs (usuarioConMasAmigos rs) >= 10



-- 6) Dada una red social y un usuario, devuelve todas las publicaciones escritas por ese usuario
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe rs user = filtrarPublicaciones (publicaciones rs) user

filtrarPublicaciones :: [Publicacion] -> Usuario -> [Publicacion]
filtrarPublicaciones [] _ = []
filtrarPublicaciones (p:ps) user | usuarioDePublicacion p == user = p : filtrarPublicaciones ps user
                                 | otherwise = filtrarPublicaciones ps user



-- 7) Dada una red social y un usuario, devuelve todas las publicaciones que le gustan a un usuario
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA rs user = filtrarPublicacionesQueLeGustanA (publicaciones rs) user

filtrarPublicacionesQueLeGustanA :: [Publicacion] -> Usuario -> [Publicacion]
filtrarPublicacionesQueLeGustanA [] _ = []
filtrarPublicacionesQueLeGustanA (p:ps) user | leGustaA user p = p : filtrarPublicacionesQueLeGustanA ps user
                                             | otherwise = filtrarPublicacionesQueLeGustanA ps user

leGustaA :: Usuario -> Publicacion -> Bool
leGustaA user p = elem user (likesDePublicacion p)



-- 8) Dada una red social y dos usuarios, indica si les gustan exactamente las mismas publicaciones 
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones rs user1 user2 = (publicacionesQueLeGustanA rs user1) == (publicacionesQueLeGustanA rs user2) 

-- 9)
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel rs user = tieneUnSeguidorFielAux2 user (head (listaDeLikesDePub rs user)) (listaDeLikesDePub rs user)

tieneUnSeguidorFielAux2 :: Usuario -> [Usuario] -> [[Usuario]] -> Bool
tieneUnSeguidorFielAux2 _ _ [] = False
tieneUnSeguidorFielAux2 _ [] _ = False
tieneUnSeguidorFielAux2 user (x:xs) listaDeLikesDePub | tieneUnSeguidorFielAux1 user (x:xs) listaDeLikesDePub == False = tieneUnSeguidorFielAux2 user (xs) listaDeLikesDePub 
                                                      | otherwise = True

tieneUnSeguidorFielAux1 :: Usuario -> [Usuario] -> [[Usuario]] -> Bool
tieneUnSeguidorFielAux1 _ _ [] = True
tieneUnSeguidorFielAux1 user (x:xs) (y:ys) | elem x y && x /= user = tieneUnSeguidorFielAux1 user (x:xs) ys
                                           | otherwise = False


listaDeLikesDePub :: RedSocial -> Usuario -> [[Usuario]]
listaDeLikesDePub rs user = filtrarLikesDePublicacionesDe (publicacionesDe rs user)

filtrarLikesDePublicacionesDe :: [Publicacion] -> [[Usuario]]
filtrarLikesDePublicacionesDe [] = []
filtrarLikesDePublicacionesDe (x:xs) = (likesDePublicacion x ): (filtrarLikesDePublicacionesDe xs)



-- 10) Dada una red social y 2 usuarios, devuelve true sii existe una manera de unir a esas dos personas con amigos entre medio (A amigo de B, B amigo de C, entonces A y C estan unidos por amigos)
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos (_, rel, _) user1 user2 = secAmigosAux rel user1 user2 []

secAmigosAux :: [Relacion] -> Usuario -> Usuario -> [Usuario] -> Bool
secAmigosAux rel user1 user2 vistos | user1 == user2 = True
                                    | otherwise = secAmigosAux2 rel user1 user2 vistos amigos
                                     where amigos = amigosDe ([],rel,[]) user1

secAmigosAux2 :: [Relacion] -> Usuario -> Usuario -> [Usuario] -> [Usuario] -> Bool
secAmigosAux2 _ _ _ _ [] = False
secAmigosAux2 rel user1 user2 vistos (amigo:resto) | amigo `elem` vistos = secAmigosAux2 rel user1 user2 vistos resto
                                                   | amigo == user2 = True
                                                   | otherwise = secAmigosAux2 rel amigo user2 (user1:vistos) (amigosDe ([],rel,[]) amigo ++ resto)
