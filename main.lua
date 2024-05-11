-- Define o estado do jogo

local estado =
{
    cenaAtual = "inicio"
}

-- Define as cenas

local cenas =
{

    inicio =
    {
        texto = "Tu estas numa camera escura",
        opcoes =
        {
            left = "salaEsquerda",
            right = "salaDireita"
        }
    },

    salaEsquerda =
    {
        texto = "You found a treasure, congratulations. You won!",
        opcoes =
        {
            r = "inicio",
            left = "salaExtra"
        }
    },

    salaExtra = {
        texto = "...."
        opcoes = 
        {
            
        }
    }

    salaDireita =
    {
        texto = "A lion ate you. You lost!",
        opcoes =
        {
            r = "inicio",
        }
    },

}


function love.load()
    -- Aumenta a fonte
    love.graphics.setFont(love.graphics.newFont(20))

end

function love.draw()
    
    -- Limpa o ecrao
    love.graphics.clear()

    -- Exibe o texto principal
    love.graphics.print(
        cenas[estado.cenaAtual].texto,
        50,
        50
    )

    -- Exibe as opcoes
    local deslocamento = 150
    for opcao, _ in  pairs(cenas[estado.cenaAtual].opcoes) do
        love.graphics.print(" - " .. opcao, 50, deslocamento)
        deslocamento = deslocamento + 40
    end

end




function love.keypressed(key)

    local opcao = cenas[estado.cenaAtual].opcoes[key]
    
    if opcao then
        estado.cenaAtual = opcao
    elseif key == "escape" then
        love.event.quit()
    end

end
