# 🗺️ Great Places - App Flutter de Locais Favoritos

Este é um projeto de **registro de lugares importantes com localização e imagem**, criado com o objetivo de praticar a construção de aplicativos completos utilizando **Flutter**, persistência local com **SQLite** e acesso a recursos nativos como **GPS** e **câmera**.

---

## 🎯 Objetivo

Este app foi criado com propósitos **educacionais e funcionais**, focando no domínio dos seguintes recursos do Flutter:

* 📸 Captura e seleção de imagem via câmera ou galeria
* 📍 Obtenção da localização atual do dispositivo
* 🗺️ Visualização de coordenadas no Google Maps
* 🧭 Navegação com rotas nomeadas e animações personalizadas
* 🗂️ Persistência de dados locais com `sqflite`
* 🧠 Gerenciamento de estado com `Provider`
* 🧩 Modularização de componentes reutilizáveis

---

## 📸 Capturas de Tela

### Listagem de localizações
<p float="left">
  <img src="https://github.com/user-attachments/assets/0c9e25fc-e3b7-42b7-b744-84ecdba4215e" width="30%" />
  <img src="https://github.com/user-attachments/assets/da326ec8-1d7d-4f17-b4b4-1ac967d5e708" width="30%" />
  <img src="https://github.com/user-attachments/assets/eb42b95e-fce3-4fd3-b928-7a1ea7363d59" width="30%" />
</p>

### Formulário de localização
<p float="left">
  <img src="https://github.com/user-attachments/assets/15940118-eaa1-4d28-8999-07ed68f4226d" width="30%" />
  <img src="https://github.com/user-attachments/assets/d2ffed66-ccc1-4412-9a89-58745067cf99" width="30%" />
  <img src="https://github.com/user-attachments/assets/538c4613-7cd7-4984-a1b7-9d7e7261d103" width="30%" />
</p>

### Tela de detalhes da localização (com redirecionamento para Google Maps)
<p float="left">
  <img src="https://github.com/user-attachments/assets/01146395-7629-4476-8896-cbbdcf155696" width="30%" />
</p>

---

## 🧠 Como funciona

O app permite que o usuário:

* 📝 Registre um novo lugar com:

  * Um **título personalizado**
  * Uma **imagem capturada ou escolhida**
  * A **localização atual do usuário**
* 📃 Visualize uma **lista com todos os lugares registrados**
* 🌍 Toque em um lugar para ver detalhes e **abrir no Google Maps**
* ❌ Remova lugares deslizando o card para o lado

### Funcionalidades principais:

✅ Acesso à câmera e galeria

✅ Acesso à localização atual com `location`

✅ Armazenamento com `sqflite`

✅ Componentes reutilizáveis e bem separados

✅ Navegação animada com `Hero` e transições customizadas


---

## 🧩 Estrutura do Projeto

```bash
lib/
├── main.dart                         # Ponto de entrada do app
├── models/
│   └── place.dart                    # Modelo de lugar (com localização e imagem)
├── providers/
│   └── great_places.dart             # Gerenciador de estado com Provider
├── screens/
│   ├── places_list_screen.dart       # Tela principal com a lista de lugares
│   ├── places_form_screen.dart       # Tela de cadastro de novo lugar
│   └── place_detail_screen.dart      # Tela de detalhes do lugar
├── widgets/
│   ├── image_input.dart              # Widget para selecionar imagem
│   ├── location_input.dart           # Widget para selecionar localização
│   └── location_card.dart            # Card individual de lugar na lista
├── utils/
│   ├── db_util.dart                  # Utilitário para acesso ao banco SQLite
│   └── app_routes.dart               # Constantes com as rotas nomeadas
├── styles/
│   └── main_theme.dart               # Tema personalizado e transições
```

---

## 🚀 Como executar

### Pré-requisitos:

* ✅ [Flutter SDK](https://flutter.dev/docs/get-started/install)
* ✅ Emulador Android/iOS **com permissões de câmera e localização**
* ✅ Editor como [VS Code](https://code.visualstudio.com/) ou Android Studio

### Passos:

1. Clone este repositório:

```bash
git clone https://github.com/vinicius-benevides/flutter-great-places.git
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Execute o app:

```bash
flutter run
```

> Certifique-se de estar com um emulador Android/iOS ou dispositivo conectado. Lembre-se de testar com permissões de localização e câmera ativadas.

---

## 📘 Aprendizados

Durante o desenvolvimento deste projeto, foram explorados diversos conceitos práticos:

* Uso de pacotes como `image_picker`, `location`, `sqflite`, `path_provider`
* Armazenamento de imagens localmente com `File` e `path`
* Criação e exclusão de dados com SQLite via `sqflite`
* Acesso ao GPS do dispositivo para capturar localização
* Integração com `Google Maps` via `url_launcher`
* Navegação com rotas nomeadas e animações `Hero`
* Modularização e uso eficiente de `StatefulWidget` + `Provider`

---

## 🛠️ Melhorias futuras

* 🧭 Selecionar local diretamente no mapa com clique
* 🗺️ Preview real de mapa com API do Google Static Maps
* 🧮 Tela de estatísticas (lugares mais registrados, etc)
* 🧼 Limpeza automática de imagens antigas não usadas
* 🔄 Sincronização com backend (Firebase ou API própria)
* 🌗 Suporte a tema escuro e responsividade
* 🌍 Tradução para múltiplos idiomas (i18n)
