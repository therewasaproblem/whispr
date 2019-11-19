# language: pt
Funcionalidade: Mostrar imagens nas notícias
    Como um usuário do sistema,
    Para obter mais informações das notícias,
    Gostaria de ver, na listagem das notícias, imagens presentes nelas.

    Cenário: Busca de notícias
        Dado que temos notícias com informações de imagens
        E que estou na página inicial
        Quando procuro por notícias
        Então eu deveria ver imagens nas notícias