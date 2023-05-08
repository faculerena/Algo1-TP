
test :: IO ()
test = do 
    testTieneUnSeguidorFiel 



testTieneUnSeguidorFiel :: IO ()
testTieneUnSeguidorFiel = do
  putStrLn "> Test tieneUnSeguidorFiel"
  if tieneUnSeguidorFiel redA usuario1 == True 
    then putStrLn "   OK"
    else putStrLn "   ERROR con redA usuario1"
  if tieneUnSeguidorFiel redA usuario2  == False
    then putStrLn "   OK"
    else putStrLn "   ERROR con redA usuario2"
  if tieneUnSeguidorFiel redA usuario3 == False
    then putStrLn "   OK"
    else putStrLn "   ERROR con redA usuario3"
  if tieneUnSeguidorFiel redA usuario4 == False
    then putStrLn "   OK"
    else putStrLn "   ERROR con redA usuario4"
  if tieneUnSeguidorFiel redB usuario1 == True
    then putStrLn "   OK"
    else putStrLn "   ERROR con redB usuario1"
  if tieneUnSeguidorFiel redB usuario2 == False 
    then putStrLn "   OK"
    else putStrLn "   ERROR con redB usuario2"

testNombresDeUsuarios :: IO ()
testNombresDeUsuarios = do 
    putStrLn "> Test nombresDeUsuarios"
    if nombresDeUsuarios redA == ["Juan", "Natalia", "Pedro", "Mariela"]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redA"
    if nombresDeUsuarios redB == ["Juan", "Natalia", "Pedro", "Natalia"]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redB"
    if nombresDeUsuarios redC == ["Juan", "Natalia", "Pedro", "Mariela", "Santiago", "Laura", "Miguel", "Florencia", "José", "Camila", "Facundo", "Valentina", "Gabriel", "Marina"]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC"
    if nombresDeUsuarios [] == []
        then putStrLn "   OK"
        else putStrLn "   ERROR con []"

testAmigosDe :: IO ()
testAmigosDe = do 
    putStrLn "> Test amigosDe"
    if amigosDe redA usuario1 == [usuario2, usuario4]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redA usuario1"
    if amigosDe redA usuario2 == [usuario4]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redA usuario2"
    if amigosDe redA usuario3 == [usuario2]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redA usuario3"
    if amigosDe redA usuario4 == [usuario1, usuario2]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redA usuario4"
    if amigosDe redB usuario1 == [usuario2]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redB usuario1"
    if amigosDe redB usuario2 == []
        then putStrLn "   OK"
        else putStrLn "   ERROR con redB usuario2"
    if amigosDe redB usuario3 == [usuario2, usuario5]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redB usuario3"
    if amigosDe redB usuario5 == [usuario2, usuario3]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redB usuario5"
    if amigosDe redC usuario1 == [usuario2, usuario3, usuario4, usuario5, usuario12]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario1"
    if amigosDe redC usuario2 == [usuario1, usuario3, usuario4, usuario5, usuario12]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario2"
    if amigosDe redC usuario3 == [usuario1, usuario2, usuario4, usuario5, usuario12]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario3"
    if amigosDe redC usuario4 == [usuario1, usuario2, usuario3, usuario5, usuario12]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario4"
    if amigosDe redC usuario5 == [usuario1, usuario2, usuario3, usuario4, usuario12]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario5"
    if amigosDe redC usuario6 == [usuario7]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario6"
    if amigosDe redC usuario7 == [usuario6]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario7"
    if amigosDe redC usuario8 == [usuario9]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario8"
    if amigosDe redC usuario9 == [usuario8]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario9"
    if amigosDe redC usuario10 == [usuario11]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario10"
    if amigosDe redC usuario11 == [usuario10]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario11"
    if amigosDe redC usuario12 == [usuario1, usuario2, usuario3, usuario4, usuario5]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario12"
    if amigosDe redC usuario13 == []
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario13"
    if amigosDe redC usuario14 == [usuario15]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario14"
    if amigosDe redC usuario15 == [usuario14]
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario15"

testCantidadDeAmigos :: IO ()
testCantidadDeAmigos = do 
    putStrLn "> Test cantidadDeAmigos"
    if cantidadDeAmigos redA usuario1 == 2
        then putStrLn "   OK"
        else putStrLn "   ERROR con redA usuario1"
    if cantidadDeAmigos redA usuario2 == 3
        then putStrLn "   OK"
        else putStrLn "   ERROR con redA usuario2"
    if cantidadDeAmigos redA usuario3 == 2
        then putStrLn "   OK"
        else putStrLn "   ERROR con redA usuario3"
    if cantidadDeAmigos redA usuario4 == 3
        then putStrLn "   OK"
        else putStrLn "   ERROR con redA usuario4"
    if cantidadDeAmigos redB usuario5 == 0
        then putStrLn "   OK"
        else putStrLn "   ERROR con redB usuario1"
    if cantidadDeAmigos redB usuario1 == 1
        then putStrLn "   OK"
        else putStrLn "   ERROR con redB usuario2"
    if cantidadDeAmigos redB usuario2 == 2
        then putStrLn "   OK"
        else putStrLn "   ERROR con redB usuario3"
    if cantidadDeAmigos redB usuario3 == 1
        then putStrLn "   OK"
        else putStrLn "   ERROR con redB usuario4"
    if cantidadDeAmigos redB usuario4 == 0 
        then putStrLn "   OK"
        else putStrLn "   ERROR con redb usuario4"
    if cantidadDeAmigos redB usuario5 == 0
        then putStrLn "   OK"
        else putStrLn "   ERROR con redB usuario5"
    if cantidadDeAmigos redC usuario1 == 4
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario1"
    if cantidadDeAmigos redC usuario2 == 9
        then putStrLn "   OK"
        else putStrLn "   ERROR con redC usuario2"

    

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
publicacionesC = [publicacion1_1, publicacion1_2, publicacion1_3, publicacion2_3, publicacion2_4, publicacion3_4, publicacion3_5, publicacion3_6, publicacion4_4, publicacion4_5, publicacion4_6, publicacion5_1, publicacion5_2, publicacion5_3, publicacion5_4, publicacion5_5]
redC = (usuariosC, relacionesC, [])



