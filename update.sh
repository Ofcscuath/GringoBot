#!/data/data/com.termux/files/usr/bin/bash 
BOT_DIR="GringoBot"  
BOT_REPO="https://github.com/GataNina-Li/$BOT_DIR"
DB_FILE="database.json"
 
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'
  
if [[ $(basename "$PWD") == "$BOT_DIR" ]]; then
    if [ -e "$DB_FILE" ]; then 
        echo -e "${BOLD}${BLUE}Moviendo \"$DB_FILE\" a \"$HOME\" y clonando repositorio \"$BOT_REPO\" en \"$HOME\"...${RESET}"
        echo -e "${BOLD}${BLUE}Moving \"$DB_FILE\" to \"$HOME\" and cloning repository \"$BOT_REPO\" into \"$HOME\"...\n${RESET}"
        mv "$HOME/$BOT_DIR/$DB_FILE" "$HOME" && cd && rm -rf "$HOME/$BOT_DIR" && git clone "$BOT_REPO" && cd "$HOME/$BOT_DIR" && yarn --ignore-scripts && npm install && cd
        if [ -e "$HOME/$DB_FILE" ]; then
            echo -e "${BOLD}${BLUE}Rescatando archivo \"$DB_FILE\" y moviendo a \"$BOT_DIR\".${RESET}"
            echo -e "${BOLD}${BLUE}Rescuing file \"$DB_FILE\" and moving it to \"$BOT_DIR\".\n${RESET}"
            echo -e "${BOLD}${BLUE}Iniciando $BOT_DIR...${RESET}"
            echo -e "${BOLD}${BLUE}Starting  $BOT_DIR...\n${RESET}"
            mv "$HOME/$DB_FILE" "$HOME/$BOT_DIR/" && cd "$BOT_DIR" && npm start
        else
            echo -e "${BOLD}${BLUE}\"$DB_FILE\" No existe en \"$HOME\"${RESET}"
            echo -e "${BOLD}${BLUE}\"$DB_FILE\" does not exist in \"$HOME\"\n${RESET}"
            echo -e "${BOLD}${BLUE}Iniciando $BOT_DIR...${RESET}"
            echo -e "${BOLD}${BLUE}Starting  $BOT_DIR...\n${RESET}"
            cd "$BOT_DIR" && npm start
        fi
    else
        echo -e "${BOLD}${BLUE}\"$DB_FILE\" no se encontró en \"$BOT_DIR\", clonando repositorio \"$BOT_REPO\" en \"$HOME\"...${RESET}"
        echo -e "${BOLD}${BLUE}\"$DB_FILE\" not found in \"$BOT_DIR\", cloning repository \"$BOT_REPO\" to \"$HOME\"...\n${RESET}"
        cd && rm -rf "$HOME/$BOT_DIR" && git clone "$BOT_REPO" && cd "$HOME/$BOT_DIR" && yarn --ignore-scripts && npm install && cd
        if [ -e "$HOME/$DB_FILE" ]; then
            echo -e "${BOLD}${BLUE}Rescatando archivo \"$DB_FILE\" y moviendo a \"$BOT_DIR\".${RESET}"
            echo -e "${BOLD}${BLUE}Rescuing file \"$DB_FILE\" and moving it to \"$BOT_DIR\".\n${RESET}"
            echo -e "${BOLD}${BLUE}Iniciando $BOT_DIR...${RESET}"
            echo -e "${BOLD}${BLUE}Starting  $BOT_DIR...\n${RESET}"
            mv "$HOME/$DB_FILE" "$HOME/$BOT_DIR/" && cd "$BOT_DIR" && npm start
        else
            echo -e "${BOLD}${BLUE}\"$DB_FILE\" No existe en \"$HOME\"${RESET}"
            echo -e "${BOLD}${BLUE}\"$DB_FILE\" does not exist in \"$HOME\"\n${RESET}"
            echo -e "${BOLD}${BLUE}Iniciando $BOT_DIR...${RESET}"
            echo -e "${BOLD}${BLUE}Starting  $BOT_DIR...\n${RESET}"
            cd "$BOT_DIR" && npm start
        fi
    fi
else
    echo -e "${BOLD}${BLUE}Ubicación actual: \"$HOME\"${RESET}"
    echo -e "${BOLD}${BLUE}Current location: \"$HOME\"\n${RESET}"
    cd "$HOME"
    if [ -e "$HOME/$BOT_DIR" ]; then
        echo -e "${BOLD}${BLUE}Dirigiéndome a \"$BOT_DIR\".${RESET}"
        echo -e "${BOLD}${BLUE}Heading to \"$BOT_DIR\".\n${RESET}"
        cd "$HOME/$BOT_DIR"
        if [ -e "$HOME/$BOT_DIR/$DB_FILE" ]; then
            echo -e "${BOLD}${BLUE}Moviendo \"$DB_FILE\" a \"$HOME\" y clonando repositorio \"$BOT_REPO\" en \"$HOME\"...${RESET}"
            echo -e "${BOLD}${BLUE}Moving \"$DB_FILE\" to \"$HOME\" and cloning repository \"$BOT_REPO\" in \"$HOME\"...\n${RESET}"
            mv "$HOME/$BOT_DIR/$DB_FILE" "$HOME" && cd && rm -rf "$BOT_DIR" && git clone "$BOT_REPO" && cd "$BOT_DIR" && yarn --ignore-scripts && npm install && cd
            if [ -e "$HOME/$DB_FILE" ]; then
                echo -e "${BOLD}${BLUE}Rescatando archivo \"$DB_FILE\" y moviendo a \"$BOT_DIR\".${RESET}"
                echo -e "${BOLD}${BLUE}Rescuing file \"$DB_FILE\" and moving it to \"$BOT_DIR\".\n${RESET}"
                mv "$HOME/$DB_FILE" "$HOME/$BOT_DIR/" && cd "$BOT_DIR" &&
                echo -e "${BOLD}${BLUE}Iniciando $BOT_DIR...${RESET}"
                echo -e "${BOLD}${BLUE}Starting  $BOT_DIR...\n${RESET}"
                npm start
            else
                echo -e "${BOLD}${BLUE}Dirigiéndome a \"$BOT_DIR\"...${RESET}"
                echo -e "${BOLD}${BLUE}Heading to \"$BOT_DIR\".\n${RESET}"
                cd "$BOT_DIR" && 
                echo -e "${BOLD}${BLUE}Iniciando $BOT_DIR...${RESET}"
                echo -e "${BOLD}${BLUE}Starting  $BOT_DIR...\n${RESET}"
                npm start
            fi
        else
            echo -e "${BOLD}${BLUE}\"$DB_FILE\" no existe, clonando repositorio \"$BOT_REPO\" en \"$HOME\"...${RESET}"
            echo -e "${BOLD}${BLUE} \"$DB_FILE\" does not exist, cloning \"$BOT_REPO\" in \"$HOME\"...\n${RESET}"
            cd && rm -rf "$BOT_DIR" && git clone "$BOT_REPO" && cd "$BOT_DIR" && yarn --ignore-scripts && npm install &&
            echo -e "${BOLD}${BLUE}Iniciando $BOT_DIR...${RESET}"
            echo -e "${BOLD}${BLUE}Starting  $BOT_DIR...\n${RESET}"
            npm start
        fi
    else
        echo -e "${BOLD}${BLUE}\"$BOT_DIR\" no existe, clonando repositorio \"$BOT_REPO\" en \"$HOME\"...${RESET}"
        echo -e "${BOLD}${BLUE} \"$BOT_DIR\" does not exist, cloning \"$BOT_REPO\" in \"$HOME\"...\n${RESET}"
        git clone "$BOT_REPO" && cd "$BOT_DIR" && yarn --ignore-scripts && npm install && cd
        if [ -e "$HOME/$DB_FILE" ]; then
            echo -e "${BOLD}${BLUE}He encontrado un archivo \"$DB_FILE\" en \"$HOME\", lo moveré a \"$BOT_DIR\".${RESET}"
            echo -e "${BOLD}${BLUE}I have found a file \"$DB_FILE\" in \"$HOME\", moving it to \"$BOT_DIR\".\n${RESET}"
            mv "$HOME/$DB_FILE" "$HOME/$BOT_DIR/" && cd "$BOT_DIR" &&
            echo -e "${BOLD}${BLUE}Iniciando $BOT_DIR...${RESET}"
            echo -e "${BOLD}${BLUE}Starting  $BOT_DIR...\n${RESET}"
            npm start
        else
            cd "$BOT_DIR" &&
            echo -e "${BOLD}${BLUE}Iniciando $BOT_DIR...${RESET}"
            echo -e "${BOLD}${BLUE}Starting  $BOT_DIR...\n${RESET}"
            npm start
        fi
    fi
fi
