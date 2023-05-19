import Test.HUnit
import Solution

testCatedra = runTestTT tests

testGrupo = runTestTT testsPersonales

main = do runTestTT tests
          runTestTT testsPersonales


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

    " (nombresDeUsuarios) - red no vacia" ~: (nombresDeUsuarios redB) ~?=  ["Juan", "Natalia", "Pedro", "Natalia"],

    " (amigosDe) - tiene un solo amigo" ~: (amigosDe redB usuario1) ~?= [usuario2], 

    " (amigosDe) - tiene mas de un amigo" ~: (amigosDe redB usuario2) ~?= [usuario1, usuario3], 

    " (amigosDe) - no tiene amigos en la red" ~: (amigosDe redB usuario5) ~?= [], 
    
    " (cantidadDeAmigos) - no tiene amigos" ~: (cantidadDeAmigos redB usuario5) ~?= 0, 

    " (cantidadDeAmigos) - tiene amigos" ~: (cantidadDeAmigos redC usuario1) ~?= 4, 

    " (usuarioConMasAmigos) - un usuario con maximo" ~: (usuarioConMasAmigos redA ) ~?= usuario4,  

    " (usuarioConMasAmigos) - dos usuarios con maximo" ~: expectAny (usuarioConMasAmigos redA) [usuario4, usuario2],  

    " (estaRobertoCarlos) - no hay usuario con mas de 'un millon' de amigos" ~: (estaRobertoCarlos redB) ~?= False,

    " (estaRobertoCarlos) - hay usuario con mas de 'un millon' de amigos" ~: (estaRobertoCarlos redC) ~?= True, 
    
    " (publicacionesDe) - usuario con publicaciones" ~: (publicacionesDe redA usuario1) ~?= [((1,"Juan"),"Este es mi primer post",[(2,"Natalia"),(4,"Mariela")]),((1,"Juan"),"Este es mi segundo post",[(4,"Mariela")])], 

    " (publicacionesDe) - usuario sin publicaciones" ~: (publicacionesDe redA usuario5) ~?= [],

    " (publicacionesQueLeGustanA) - usuario dio likes" ~: (publicacionesQueLeGustanA redB usuario5) ~?= [((1,"Juan"),"Este es mi tercer post",[(2,"Natalia"),(5,"Natalia")]),((1,"Juan"),"Este es como mi quinto post",[(5,"Natalia")]),((3,"Pedro"),"consectetur adipiscing elit",[(2,"Natalia"),(5,"Natalia")])],

    " (publicacionesQueLeGustanA) - usuario esta en la red pero no dio likes" ~: (publicacionesQueLeGustanA redC usuario15) ~?= [],

    " (lesGustanLasMismasPublicaciones) - ambos usuarios en la red les gustan las mismas" ~: (lesGustanLasMismasPublicaciones redB usuario1 usuario3) ~?= True,

    " (lesGustanLasMismasPublicaciones) - ambos usuarios en la red no les gustan las mismas" ~: (lesGustanLasMismasPublicaciones redB usuario1 usuario2) ~?= False,
    
    " (lesGustanLasMismasPublicaciones) - al primero le gustan las mismas y más publicaciones que al segundo" ~: (lesGustanLasMismasPublicaciones redB usuario5 usuario2) ~?= False,
    
    " (lesGustanLasMismasPublicaciones) - al segundo le gustan las mismas y más publicaciones que al primero" ~: (lesGustanLasMismasPublicaciones redB usuario2 usuario5) ~?= False,

    " (tieneUnSeguidorFiel) - si no es un seguidor fiel" ~: (tieneUnSeguidorFiel redB usuario5) ~?= False,

    " (tieneUnSeguidorFiel) - si es un seguidor fiel" ~: (tieneUnSeguidorFiel redA usuario2) ~?= True,

    " (tieneUnSeguidorFiel) - es su propio seguidor fiel" ~: (tieneUnSeguidorFiel redE usuario5) ~?= False,

    " (existeSecuenciaDeAmigos) - no son amigos " ~: (existeSecuenciaDeAmigos redD usuario1 usuario6) ~?= False,  

    " (existeSecuenciaDeAmigos) - son amigos directos" ~: (existeSecuenciaDeAmigos redD usuario7 usuario6) ~?= True,

    " (existeSecuenciaDeAmigos) - existe una secuencia con una persona en el medio" ~: (existeSecuenciaDeAmigos redD usuario1 usuario3) ~?= True,

    " (existeSecuenciaDeAmigos) - existe una secuencia con mas de una persona en el medio" ~: (existeSecuenciaDeAmigos redD usuario1 usuario5) ~?= True 

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
relacion1_5 = (usuario5, usuario1)
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
relacion12_6 = (usuario12, usuario6)
relacion12_7 = (usuario12, usuario7)
relacion12_8 = (usuario12, usuario8)
relacion12_9 = (usuario12, usuario9)
relacion12_10 = (usuario12, usuario10)
relacion12_11 = (usuario12, usuario11)


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
relacionesC = [relacion12_1, relacion12_2, relacion12_3, relacion12_4, relacion12_5, relacion1_2, relacion1_3, relacion1_4, relacion2_3, relacion2_4, relacion2_5, relacion3_4, relacion3_5, relacion4_5, relacion6_7, relacion8_9, relacion10_11, relacion12_13, relacion14_15, relacion12_6, relacion12_7, relacion12_8, relacion12_9, relacion12_10, relacion12_11]
publicacionesC = [publicacion1_1, publicacion1_2, publicacion1_3, publicacion2_3, publicacion2_4, publicacion3_4, publicacion3_5, publicacion3_6, publicacion4_4, publicacion4_5, publicacion4_6, publicacion5_1, publicacion5_2, publicacion5_3]
redC = (usuariosC, relacionesC, [])

usuariosD = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7]
relacionesD = [relacion1_2, relacion2_3, relacion3_4, relacion4_5, relacion6_7]
redD = (usuariosD, relacionesD, [])

usuariosE = [usuario1, usuario2, usuario3, usuario5]
relacionesE = [relacion1_5]
publicacionesE = [(usuario5, "sed elit ultrices blandit", [usuario5]),(usuario4, "sed elit ultrices blandit", [usuario5, usuario3]), (usuario2, "sed elit ultrices blandit", [usuario5,usuario3])]
redE = (usuariosE, relacionesE, publicacionesE)