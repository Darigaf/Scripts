#! /bin/bash
#Script that creates a appends the current date to a folder
DATE=$(date +%Y_%m_%d);
HORA=$(date +%H)
HORA=${HORA#0}
case "$(date +%u)" in
	1) DIA_SEMANA="Segunda" ;;
	2) DIA_SEMANA="Terca" ;;
	3) DIA_SEMANA="Quarta" ;;
	4) DIA_SEMANA="Quinta" ;;
	5) DIA_SEMANA="Sexta" ;;
	6) DIA_SEMANA="Sabado" ;;
	7) DIA_SEMANA="Domingo" ;;
esac
if [ "$HORA" -lt 12 ]; then
	PERIODO="Manha"
else
	PERIODO="Tarde_e_Noite"
fi
TREINO_NAME="$1";
FOLDER_NAME="${DATE}_Treinos_${TREINO_NAME}_${DIA_SEMANA}_${PERIODO}"
if [ -z "$TREINO_NAME" ];
then
	printf "Usage: create_dated_folder.sh LOCAL_DO_TREINO\n";
	exit 5;
fi
mkdir $FOLDER_NAME;

cd $FOLDER_NAME;

mkdir Videos Entrega Entrega/Lote_{1..5};
cd .. 
mv ./*CR* $FOLDER_NAME/

