#! /bin/sh
#Script feito para baixar os livros da loja escoteira em sua versao digital e transforma-los em pdf
BASE_URL=$(printf "%s\n" "$1" | grep -o '.*\/')
PREFIX="arquivo-"
EXTENSION=".jpg"
MAX_FILES=1000 #Limita o máximo de imagens que podem ser baixadas num unico script
i=1
#Baixa todas as imagens sequenciais do livro com base na url que foi providenciada, com o limite de 1000 paginas
#A velocidade de download é limitada em 10000kbps para não sobrecarregar os servidores da ueb, com um delay de 100ms entre cada download
download_images() {
	printf "Baixando imagens\n";
	while [ "$i" -le "$MAX_FILES" ]; do
		case "$i" in
			[0-9]) FILE_NUMBER="00$i" ;;
			[1-9][0-9]) FILE_NUMBER="0$i" ;;
			*) FILE_NUMBER="$i" ;;
		esac

		DOWNLOAD_FILE="${PREFIX}${FILE_NUMBER}${EXTENSION}"
		DOWNLOAD_URL="${BASE_URL}${DOWNLOAD_FILE}"

		printf "Tentando Baixar %s \n" "$DOWNLOAD_URL";

		if wget --execute robots=off --refer="https://google.com" --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36" --limit-rate=10000k --wait=0.1 --random-wait -q "$DOWNLOAD_URL" -O "./$NOME_ARQUIVO_FINAL/imagens/$DOWNLOAD_FILE"; then
			printf "BAIXADO %s \n" "$DOWNLOAD_FILE";
		else
			printf "\n \n \nDownload das imagens finalizado"
			rm ./"$NOME_ARQUIVO_FINAL"/imagens/"$DOWNLOAD_FILE";
			break
		fi
		i=$((i+1))
	done
}

#Converte e une as imagens baixadas em um pdf único
images_to_pdf(){
	printf "\n\nCONVERTENDO IMAGENS PARA PDF\n\n"
	magick  ./"$NOME_ARQUIVO_FINAL"/imagens/"$PREFIX"*"$EXTENSION" -quality 100 ./"$NOME_ARQUIVO_FINAL"/"$NOME_ARQUIVO_FINAL".pdf
}

#Faz o ocr do pdf
ocr_pdf(){
	ocrmypdf  -l por --title "$NOME_ARQUIVO_FINAL" --subject "Bazinga" --author "UEB" -d  -f ./"$NOME_ARQUIVO_FINAL"/"$NOME_ARQUIVO_FINAL".pdf ./"$NOME_ARQUIVO_FINAL"/"$NOME_ARQUIVO_FINAL"\_com_Texto_Selecionavel.pdf
	printf "\n\n\nOCR FINALIZADO"
}

#deleta os arquivos de imagens e outros desnecessarios
clean_files(){
	rm ./"$NOME_ARQUIVO_FINAL"/imagens/arquivo*.jpg
	rmdir ./"$NOME_ARQUIVO_FINAL"/imagens/
}

if [ -z "$1" ];
then
	printf "Esse script serve para facilitar o download e compartilhamento dos livros escoteiros do novo programa educativo da loja escoteira\n";
	printf "Uso: baixar_livro_loja_escoteira.sh LINK_PRIMEIRA_PAGINA_LIVRO\n";
	printf "Voce deve inserir o link da primeira pagina do livro ao chamar o script\n";
	exit 5;
fi

printf "Insira o nome para salvar o pdf do livro\n";
printf "!!O NOME DEVE SER NO FORMATO LIVRO_NOME, SEM ESPACOS, ACENTOS OU CARACTERES ESPECIAIS!!\n\n";
read -r NOME_ARQUIVO_FINAL
mkdir "$NOME_ARQUIVO_FINAL" "$NOME_ARQUIVO_FINAL"/imagens

download_images;
images_to_pdf;
clean_files;

printf "DOWNLOAD FINALIZADO\n\n\n\n"

printf "\nDeseja executar ocr no pdf para torna-lo selecionavel e pesquisavel?(S/N)\n";
read -r DESEJA_OCR
case "$DESEJA_OCR" in
	[sS]) ocr_pdf;;
           *) printf "Opcao Invalida\n";;
esac

printf "\nARQUIVO %s.pdf SALVO COM SUCESSO\n" "$NOME_ARQUIVO_FINAL"

