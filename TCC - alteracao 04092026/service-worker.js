self.addEventListener("install", (event) => {
// executa a instalacao, e em seguida diz para o navegador esperar uma tarefa
    event.waitUntil(
// recebe o cache na variavel cache
        caches.open("gae-cache-v1").then((cache) => {
            return cache.addAll([
                "/TCC/css/agendamento.css",
                "/TCC/css/cadastrar_usuario.css",
                "/TCC/css/calendario.css",
                "/TCC/css/editar_usuario.css",
                "/TCC/css/gerenciar_usuarios.css",
                "/TCC/css/login.css",
                "/TCC/css/opcoes.css",
                "/TCC/css/selecionar_lab1.css",
                "/TCC/gaelogo.png",
                "/TCC/logo.png",
                "/TCC/manifest.json",
                "/TCC/opcoes.html",
                "/TCC/selecionar_lab.html"

            ])
        })
    )
})

self.addEventListener("activate", (event) => {
    event.waitUntil(
        caches.keys().then((cacheNames) => {
            cacheNames.forEach((cacheName) => {
                if (cacheName !== "gae-cache-v1") {
                    // se cacheName (variavel que representa o nome de cada cache encontrado)
                    //  nao for igual a gae-cache-v1...
                }
            })
        })
    )

})