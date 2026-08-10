# Instruções de Uso do Script ADB para Tablets Samsung

Este pacote foi estruturado para automatizar a configuração em lote de tablets Android/Samsung na sua empresa.

---

## 📁 Estrutura de Pastas Recomendada

Crie uma pasta no seu computador (por exemplo: `C:\adb_tools`) e insira os seguintes arquivos dentro dela:

```text
C:\adb_tools\
├── platform-tools\        (Arquivos oficiais do ADB do Google)
│   ├── adb.exe
│   └── ...
├── apks\                  (Coloque todos os seus arquivos .apk aqui)
│   ├── teams.apk
│   ├── outlook.apk
│   └── meu_app_empresa.apk
└── configurar_tablets.bat (O script executável)
```

---

## 🚀 Passo a Passo de Execução

1. **Ativar Depuração USB no Tablet:**
   - Vá em **Configurações > Sobre o tablet > Informações do software**.
   - Toque **7 vezes seguidas** em **Número da compilação** até exibir a mensagem de que o Modo Desenvolvedor foi ativado.
   - Volte ao menu principal de **Configurações > Opções do desenvolvedor**.
   - Ative a chave **Depuração USB**.

2. **Conectar e Autorizar:**
   - Conecte o tablet ao computador via cabo USB.
   - Na tela do tablet, aparecerá o aviso: *"Permitir depuração USB?"*.
   - Marque a caixa **"Sempre permitir a partir deste computador"** e toque em **Permitir**.

3. **Executar o Script:**
   - Dê um duplo clique no arquivo `configurar_tablets.bat`.
   - Escolha a opção **[1] Executar Configuração Completa** ou selecione módulos específicos no menu interativo.

---

## 💡 Dicas de Produtividade

- **Instalação Sem Prompt (`-g`):** O script usa o parâmetro `-g` que concede **todas as permissões automaticamente** no momento da instalação (câmera, arquivos, localização). O colaborador não precisará clicar em "Permitir" app por app.
- **Pasta `apks`:** Basta arrastar qualquer aplicativo baixado (`.apk`) para dentro da pasta `apks` que o script irá ler e instalar automaticamente em sequência.
- **Aceleração do Sistema:** O script reduz a escala das animações nativas para `0.5x`, tornando a navegação no tablet visivelmente mais rápida e ágil para o uso de trabalho.
