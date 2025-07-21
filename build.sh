#!/bin/bash

# Script de build para Vercel
echo "🚀 Iniciando build do Flutter no Vercel..."

# Instalar Flutter
echo "📦 Instalando Flutter..."
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Verificar instalação
flutter --version

# Obter dependências
echo "📚 Obtendo dependências..."
flutter pub get

# Build para web
echo "🔨 Fazendo build para web..."
flutter build web --wasm

echo "✅ Build concluído!"
ls -la build/web/ 