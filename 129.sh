#!/bin/bash
# kill-byname.sh: Matar procesos por nombre.
# Compara este script con kill-process.sh.

#  Por ejemplo,
#+ intenta "./kill-byname.sh xterm" --
#+ y observa cómo todas las xterms en tu escritorio desaparecen.

#  Advertencia:
#  -------
#  Este es un script bastante peligroso.
#  Ejecutarlo descuidadamente (especialmente como root)
#+ puede causar pérdida de datos y otros efectos indeseables.

E_BADARGS=66

if test -z "$1"  # ¿No se proporcionó ningún argumento en la línea de comandos?
then
  echo "Uso: `basename $0` Proceso(s)_a_matar"
  exit $E_BADARGS
fi


PROCESS_NAME="$1"
ps ax | grep "$PROCESS_NAME" | awk '{print $1}' | xargs -i kill {} 2&>/dev/null
#                                                       ^^      ^^

# ---------------------------------------------------------------
# Notas:
# -i es la opción "reemplazar cadenas" para xargs.
# Las llaves son el marcador de posición para el reemplazo.
# 2&>/dev/null suppresses unwanted error messages.
#
# Can  grep "$PROCESS_NAME" be replaced by pidof "$PROCESS_NAME"?
# ---------------------------------------------------------------

exit $?

#  The "killall" command has the same effect as this script,
#+ but using it is not quite as educational.