# 🚀 Guia de Deploy - Portfólio Richard Otto

## 📋 Pré-requisitos

- ✅ Projeto Flutter configurado
- ✅ Conta GitHub
- ✅ Conta Vercel (gratuita)

## 🌐 **OPÇÃO 1: VERCEL (RECOMENDADO)**

### **Passo 1: Preparar o Projeto**
```bash
# Build otimizado para web
flutter build web --wasm
```

### **Passo 2: Deploy via Interface Web**

1. **Acesse:** https://vercel.com
2. **Faça login** com sua conta GitHub
3. **Clique em "New Project"**
4. **Importe seu repositório** `portifolio_richard`
5. **Configure as opções:**
   - **Framework Preset:** `Other`
   - **Build Command:** `flutter build web --wasm`
   - **Output Directory:** `build/web`
   - **Install Command:** `flutter pub get`
6. **Clique em "Deploy"**

### **Passo 3: Configurar Domínio**
- **Domínio gratuito:** `richardotto.vercel.app`
- **Domínio personalizado:** Comprar em `richardotto.dev`

---

## 🤖 **OPÇÃO 2: GITHUB ACTIONS (AUTOMÁTICO)**

### **Configurar Secrets no GitHub**

1. **Acesse:** https://github.com/RichardOtto95/portifolio_richard/settings/secrets
2. **Adicione os secrets:**
   - `VERCEL_TOKEN` - Token do Vercel
   - `ORG_ID` - ID da organização Vercel
   - `PROJECT_ID` - ID do projeto Vercel

### **Obter Tokens do Vercel**

1. **Acesse:** https://vercel.com/account/tokens
2. **Crie um novo token**
3. **Copie o token para `VERCEL_TOKEN`**

### **Deploy Automático**
- ✅ Push para `main` = Deploy automático
- ✅ Pull Request = Preview deployment

---

## 📱 **OPÇÃO 3: NETLIFY**

### **Deploy via Netlify**
```bash
# Build
flutter build web --wasm

# Deploy
npm install -g netlify-cli
netlify deploy --dir=build/web --prod
```

### **Configurações Netlify**
- **Build Command:** `flutter build web --wasm`
- **Publish Directory:** `build/web`
- **Domínio:** `richardotto.netlify.app`

---

## 🔥 **OPÇÃO 4: FIREBASE HOSTING**

### **Configurar Firebase**
```bash
# Instalar Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Inicializar projeto
firebase init hosting

# Build e deploy
flutter build web --wasm
firebase deploy
```

---

## ⚡ **OPÇÃO 5: CLOUDFLARE PAGES**

### **Deploy via Cloudflare**
1. **Acesse:** https://pages.cloudflare.com
2. **Conecte com GitHub**
3. **Selecione o repositório**
4. **Configure:**
   - **Build Command:** `flutter build web --wasm`
   - **Build Output Directory:** `build/web`

---

## 🎯 **RECOMENDAÇÃO FINAL: VERCEL**

### **Por que Vercel?**
- ✅ **Mais rápido** - Deploy em 2 minutos
- ✅ **Performance superior** - CDN global
- ✅ **Gratuito** - Plano free generoso
- ✅ **Integração perfeita** - GitHub automático
- ✅ **SSL automático** - HTTPS incluído
- ✅ **Domínio gratuito** - `richardotto.vercel.app`

### **Passos Finais**
1. **Fazer deploy no Vercel**
2. **Configurar domínio personalizado** (opcional)
3. **Adicionar analytics** (opcional)
4. **Compartilhar portfólio**

---

## 🔧 **TROUBLESHOOTING**

### **Erro de Build**
```bash
# Limpar cache
flutter clean
flutter pub get
flutter build web --wasm
```

### **Erro de Dependências**
```bash
# Atualizar dependências
flutter pub upgrade
flutter pub get
```

### **Erro de Assets**
- Verificar se todos os assets estão em `assets/`
- Verificar `pubspec.yaml` está correto

---

## 📞 **Suporte**

- **GitHub Issues:** [Criar Issue](https://github.com/RichardOtto95/portifolio_richard/issues)
- **Email:** richard.otto95@gmail.com
- **LinkedIn:** [Richard Otto](https://www.linkedin.com/in/richard-otto-95/)

---

**🎉 Seu portfólio estará online em minutos!** 