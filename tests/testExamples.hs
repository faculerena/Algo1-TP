
usuario1 = (1, "Juan")
usuario2 = (2, "Natalia")
usuario3 = (3, "Pedro")
usuario4 = (4, "Mariela")
usuario5 = (5, "Natalia")

relacion1_2 = (usuario1, usuario2)
relacion1_3 = (usuario1, usuario3)
relacion1_4 = (usuario4, usuario1) -- Notar que el orden en el que aparecen los usuarios es indistinto
relacion2_3 = (usuario3, usuario2)
relacion2_4 = (usuario2, usuario4)
relacion3_4 = (usuario4, usuario3)

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


usuariosA = [usuario1, usuario2, usuario3, usuario4]
relacionesA = [relacion1_2, relacion1_4, relacion2_3, relacion2_4, relacion3_4]
publicacionesA = [publicacion1_1, publicacion1_2, publicacion2_1, publicacion2_2, publicacion3_1, publicacion3_2, publicacion4_1, publicacion4_2]
redA = (usuariosA, relacionesA, publicacionesA)

usuariosB = [usuario1, usuario2, usuario3, usuario5]
relacionesB = [relacion1_2, relacion2_3]
publicacionesB = [publicacion1_3, publicacion1_4, publicacion1_5, publicacion3_1, publicacion3_2, publicacion3_3]
redB = (usuariosB, relacionesB, publicacionesB)


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

usuariosC = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12, usuario13, usuario14, usuario15]

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

relacionesC = [relacion12_1, relacion12_2, relacion12_3, relacion12_4, relacion12_5, relacion1_2, relacion1_3, relacion1_4, relacion2_3, relacion2_4, relacion2_5, relacion3_4, relacion3_5, relacion4_5, relacion6_7, relacion8_9, relacion10_11, relacion12_13, relacion14_15]


redC = (usuariosC, relacionesC, [])


