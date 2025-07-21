# 🚀 Deploy no GitHub Pages

## 📋 Pré-requisitos

- Conta no GitHub
- Repositório público ou GitHub Pro para repositórios privados
- Flutter SDK instalado

## 🔧 Configuração

### 1. Preparar o Repositório

```bash
# Fazer build do projeto
flutter build web --wasm

# Commit das mudanças
git add .
git commit -m "Configurar deploy GitHub Pages"
git push origin main
```

### 2. Configurar GitHub Pages

1. **Ir para Settings do repositório**
   - Acesse: `https://github.com/SEU_USUARIO/portifolio_richard/settings`

2. **Ativar GitHub Pages**
   - Role até "Pages" no menu lateral
   - Em "Source", selecione "GitHub Actions"
   - Clique em "Save"

3. **Verificar Deploy**
   - Vá para a aba "Actions" no repositório
   - O workflow será executado automaticamente
   - Aguarde o deploy completar

### 3. URL do Site

Após o deploy, seu site estará disponível em:
- **GitHub Pages:** `https://SEU_USUARIO.github.io/portifolio_richard/`
- **Domínio Personalizado:** `https://richardotto.dev` (se configurado)

## 🔄 Deploy Automático

O deploy acontece automaticamente quando você:
- Faz push para a branch `main` ou `master`
- Cria um Pull Request

## 🛠️ Troubleshooting

### Problema: Build falha
```bash
# Verificar versão do Flutter
flutter --version

# Limpar cache
flutter clean
flutter pub get
```

### Problema: Site não carrega
- Verificar se o GitHub Pages está ativo
- Aguardar alguns minutos após o deploy
- Verificar logs na aba Actions

### Problema: Assets não carregam
- Verificar se os caminhos estão corretos
- Usar caminhos relativos no código

## 📱 PWA Features

O site inclui:
- ✅ Manifest.json configurado
- ✅ Service Worker
- ✅ Ícones responsivos
- ✅ Tema escuro/claro
- ✅ Instalação como app

## 🔍 SEO Otimizado

- ✅ Meta tags completas
- ✅ Open Graph tags
- ✅ Twitter Cards
- ✅ Sitemap automático
- ✅ Loading indicator

## 🌐 Domínio Personalizado (Opcional)

Para usar `richardotto.dev`:

1. **Comprar domínio** (ex: GoDaddy, Namecheap)
2. **Configurar DNS:**
   ```
   Type: CNAME
   Name: @
   Value: SEU_USUARIO.github.io
   ```
3. **Adicionar no GitHub:**
   - Settings > Pages > Custom domain
   - Adicionar: `richardotto.dev`
4. **Aguardar propagação** (até 24h)

## 📊 Analytics (Opcional)

Para adicionar Google Analytics:

1. Criar conta no Google Analytics
2. Adicionar código no `web/index.html`:
   ```html
   <!-- Google Analytics -->
   <script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
   <script>
     window.dataLayer = window.dataLayer || [];
     function gtag(){dataLayer.push(arguments);}
     gtag('js', new Date());
     gtag('config', 'GA_MEASUREMENT_ID');
   </script>
   ```

## 🎯 Próximos Passos

1. ✅ Deploy no GitHub Pages
2. 🔄 Configurar domínio personalizado
3. 📊 Adicionar analytics
4. 🔍 Otimizar SEO
5. 📱 Testar PWA

---

**🎉 Seu portfólio estará online em minutos!** 