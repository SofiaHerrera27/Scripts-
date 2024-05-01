#!/bin/bash
# date-calc.sh
# Autor: Nathan Coulter
# Usado en ABS Guide con permiso (¡gracias!).

MPHR=60    # Minutos por hora.
HPD=24     # Horas por día.

diff () {
        printf '%s' $(( $(date -u -d"$TARGET" +%s) -
                        $(date -u -d"$CURRENT" +%s)))
#                       %d = día del mes.
}


CURRENT=$(date -u -d '2007-09-01 17:30:24' '+%F %T.%N %Z')
TARGET=$(date -u -d'2007-12-25 12:30:00' '+%F %T.%N %Z')
# %F = fecha completa, %T = %H:%M:%S, %N = nanosegundos, %Z = zona horaria.

printf '\nEn 2007, %s ' \
       "$(date -d"$CURRENT +
        $(( $(diff) /$MPHR /$MPHR /$HPD / 2 )) days" '+%d %B')" 
#       %B = nombre del mes                ^ a mitad de camino
printf 'estaba a mitad de camino entre %s ' "$(date -d"$CURRENT" '+%d %B')"
printf 'y %s\n' "$(date -d"$TARGET" '+%d %B')"

printf '\nEl %s a las %s, quedaban\n' \
        $(date -u -d"$CURRENT" +%F) $(date -u -d"$CURRENT" +%T)
DAYS=$(( $(diff) / $MPHR / $MPHR / $HPD ))
CURRENT=$(date -d"$CURRENT +$DAYS days" '+%F %T.%N %Z')
HOURS=$(( $(diff) / $MPHR / $MPHR ))
CURRENT=$(date -d"$CURRENT +$HOURS hours" '+%F %T.%N %Z')
MINUTES=$(( $(diff) / $MPHR ))
CURRENT=$(date -d"$CURRENT +$MINUTES minutes" '+%F %T.%N %Z')
printf '%s días, %s horas, ' "$DAYS" "$HOURS"
printf '%s minutos y %s segundos ' "$MINUTES" "$(diff)"
printf 'hasta la Cena de Navidad!\n\n'

#  Ejercicio:
#  --------
#  Reescribe la función diff () para aceptar parámetros pasados,
#+ en lugar de usar variables globales.