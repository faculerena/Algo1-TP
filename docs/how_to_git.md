# How to git(hub)

How-to-git para TPs de Algo 1
Recomiendo FUERTEMENTE usar Powershell si usas windows, es mejor que CMD y encima, los comandos son muy parecidos o iguales a los de linux.

## Instalación

### Windows


1. Descargar [Git for Windows](https://git-scm.com/downloads)
2. Opcional: Descargar e instalar [Github Desktop](https://desktop.github.com/)
3. Instalar lo descargado
4. Abrir CMD o Powershell (menu de windows > escribir cmd o powershell)
5. Escribir `git --version` y presionar enter

### Linux
1. Trae por default git instalado, sino usar el package manager de la distro para instalar git (apt, pacman, etc)


## Uso

### Clonar un repositorio

1. Copiar el link del repo
2. `git clone <link>`

### Actualizar un repositorio (Remoto a local)

Si otra persona hizo cambios, es importante mantenerse al dia haciendo `git pull` antes de empezar a trabajar.

### Subir cambios

1. `git add <archivos>` para agregar los archivos que queres subir
   1. Podes hacer `git add -A` para agregar todos los archivos que cambiaste
2. `git commit -m "<mensaje>"` para hacer commit de los cambios
3. `git push` para subir los cambios al repo remoto

### Ver cambios

Si queres saber que cambios estan para subirse, que cambios hiciste y que cosas no vas a subir, podes hacer `git status` para ver los archivos que cambiaste.

### Branches

Son las ramas de desarrollo, se usan para separar el codigo en distintas partes y poder trabajar en distintas cosas al mismo tiempo sin que se pisen los cambios.

La idea en este caso es mantener las ramas con cada integrante. 

ANTES de empezar a hacer cosas en su branch, actualicenla con la branch main
```
git checkout <nombre>
git merge main
```

Para empezar a laburar hagan `git checkout <nombre>` para cambiarse a la rama de cada uno, voy a procurar que esté todo listo.




### NOTAS

Cuando necesiten pushear un cambio, les va a pedir username y password. El username es el mail de github, y el password es un token que tienen que generar [aca](https://github.com/settings/tokens).

1. Generar nuevo token
2. Clasico
3. Si es su compu personal, recomiendo seleccionar todo
4. Le ponen nombre y generan el token, no necesita expirar

No es lo mejor, pero guarden ese token un rato porque lo pueden ver una sola vez, intenten hacer un commit y pushear, les va a pedir el token, lo copian y listo.

Usen el comando `git config --global credential.helper store` para guardar las credenciales localmente, no es lo mas seguro y si quieren una manera mejor, pueden usar SSH keys, pero se extiende demasiado, lo puedo agregar si quieren.

