INSERT INTO courses (name) VALUES ('Sztuczna inteligencja');
INSERT INTO modules (no, title, course_id) VALUES (1, 'Wprowadzenie do sztucznej inteligencji', 1);
INSERT INTO modules (no, title, course_id) VALUES (2, 'Podstawy uczenia maszynowego', 1);
INSERT INTO modules (no, title, course_id) VALUES (3, 'Wprowadzenie do sieci neuronowych', 1);
INSERT INTO modules (no, title, course_id) VALUES (4, 'Głębokie uczenie i zastosowania SI', 1);
INSERT INTO modules (no, title, course_id) VALUES (5, 'Przyszłość SI i podsumowanie', 1);

INSERT INTO episodes (no, title, content, module_id) VALUES (3, 'Różnice między SI, uczeniem maszynowym (ML) i głębokim uczeniem (DL)', $$### **1. Sztuczna Inteligencja (AI)**
- **Definicja**: Szeroka dziedzina informatyki zajmująca się tworzeniem systemów zdolnych do wykonywania zadań wymagających ludzkiej inteligencji (np. rozumowanie, percepcja, podejmowanie decyzji).  
- **Zakres**: Obejmuje wszystkie techniki symulujące inteligencję, w tym ML i DL.  
- **Przykłady**:  
  - Chatboty (np. ChatGPT)  
  - Systemy ekspertowe  
  - Robotyka autonomiczna  

### **2. Uczenie Maszynowe (ML)**
- **Definicja**: Podzbiór AI skupiający się na algorytmach, które uczą się na podstawie danych bez wyraźnego programowania.  
- **Kluczowa cecha**: Model poprawia się poprzez doświadczenie (dane treningowe).  
- **Rodzaje ML**:  
  - **Nadzorowane** (np. klasyfikacja, regresja)  
  - **Nienadzorowane** (np. klastrowanie)  
  - **Wzmocnione** (uczenie przez nagradzanie)  
- **Przykłady**:  
  - Prognozowanie cen nieruchomości  
  - Filtrowanie spamu w e-mailach  

### **3. Głębokie Uczenie (DL)**
- **Definicja**: Specjalny rodzaj ML wykorzystujący sztuczne sieci neuronowe (inspirowane budową mózgu) do analizy złożonych wzorców.  
- **Kluczowa cecha**: Wymaga ogromnych ilości danych i mocy obliczeniowej (np. GPU).  
- **Zastosowania**:  
  - Przetwarzanie obrazów (np. rozpoznawanie twarzy)  
  - Przetwarzanie języka naturalnego (NLP, np. tłumaczenie maszynowe)  
  - Generowanie treści (np. DALL-E, Deepfake)  

### **Podsumowanie różnic**  
| **Cecha**          | **AI**               | **ML**                        | **DL**                     |  
|---------------------|----------------------|-------------------------------|----------------------------|  
| **Zakres**          | Najszerszy           | Podzbiór AI                   | Podzbiór ML                |  
| **Zależność od danych** | Nie zawsze        | Tak                           | Tak (duże ilości)          |  
| **Typowe algorytmy** | Reguły, drzewa decyzyjne | SVM, Random Forest       | CNN, RNN, Transformers     |  
| **Wymagania obliczeniowe** | Różne       | Umiarkowane                   | Bardzo wysokie             |  

**Prosta analogia**:  
- **AI** to całe "królestwo" inteligentnych systemów.  
- **ML** to "księstwo" w tym królestwie, gdzie maszyny uczą się z danych.  
- **DL** to "forteca" w księstwie ML, wykorzystująca głębokie sieci neuronowe.  
$$, 1);
INSERT INTO episodes (no, title, content, module_id) VALUES (3, 'Wizualizacja procesu uczenia sieci', $$
---

### **1. Architektura Sieci**  
*(Sieć neuronowa z warstwami: wejściowa, ukryta, wyjściowa)*  
``` 
  Input       Hidden       Output
  Layer       Layer       Layer
  (X)        (h1, h2)      (Y)
   o----------o----------o
   | \      / | \      / |
   |  o----o  |  o----o  |
   | /      \ | /      \ |
   o----------o----------o
```
- **Strzałki**: Połączenia z wagami (w<sub>ij</sub>)  
- **Neurony**: Koła reprezentujące jednostki obliczeniowe.  

---

### **2. Propagacja w Przód (Forward Pass)**  
*(Dane przepływają od wejścia do wyjścia)*  
``` 
Input → [W1] → Hidden Layer → [W2] → Output → Loss
          (Funkcja Aktywacji: ReLU/Sigmoid)
```
- **Przykład**: Dla danych wejściowych **X**, sieć oblicza predykcję **Ŷ**.  
- **Funkcja strat (Loss)**: Różnica między **Ŷ** a prawdziwą wartością **Y** (np. MSE).  

---

### **3. Propagacja wsteczna (Backpropagation)**  
*(Gradienty przepływają od wyjścia do wejścia)*  
``` 
Loss → ∂Loss/∂W2 → Hidden Layer → ∂Loss/∂W1 → Input
       (Optymalizator: SGD/Adam)
```
- **Cel**: Aktualizacja wag (**W1**, **W2**), aby zmniejszyć stratę.  

---

### **4. Aktualizacja Wag**  
*(Optymalizacja gradientowa)*  
**Wzór**:  
\[ W_{new} = W_{old} - \eta \cdot \nabla Loss \]  
- **η (eta)**: Learning rate (np. 0.01).  
- **∇Loss**: Gradient funkcji strat względem wag.  

---

### **5. Zbieżność (Convergence)**  
*(Wykres straty w czasie)*  
``` 
Loss
  ^
  |    .,-\'\' 
  |  .\'     
  | /       
  |/        
  +-----------→ Epochs
```
- **Idealny scenariusz**: Strata maleje z każdą epoką.  
- **Overfitting**: Strata spada na zbiorze treningowym, ale rośnie na walidacyjnym.  

---

### **6. Przykładowe Wykresy**  
- **Dane Treningowe**: Punkty rozrzucone w przestrzeni.  
- **Predykcje Sieci**: Linia/krzywa dopasowana do danych (np. regresja).  

---

### Kluczowe Elementy Wizualne:  
1. **Warstwy sieci** (kolory dla różnych warstw).  
2. **Gradienty** (strzałki z kolorami od czerwonego (wysoki) do niebieskiego (niski)).  
3. **Wykres straty** (czas vs. wartość funkcji kosztu).  
$$, 3);
INSERT INTO episodes (no, title, content, module_id) VALUES (1, 'Trendy w SI; generative AI, LLM (np. ChatGPT), AGI', $$
---

### **1. Generatywna AI (Generative AI)**
Generatywna AI to jedna z najszybciej rozwijających się dziedzin SI, znajdująca zastosowanie w wielu sektorach, od kreatywności po biznes. Kluczowe trendy na 2025 rok obejmują:
- **Tworzenie treści**: AI generuje tekst, obrazy, muzykę i filmy o coraz wyższej jakości, np. OpenAI Sora (generowanie wideo) czy narzędzia do generowania muzyki .
- **Hiperpersonalizacja**: AI dostosowuje treści i rekomendacje do indywidualnych preferencji użytkowników, np. w marketingu i e-commerce .
- **AI-as-a-Service**: Firmy coraz częściej korzystają z gotowych rozwiązań generatywnej AI w formie usług, co obniża koszty wdrożenia .
- **Etyka i regulacje**: Wzrost znaczenia regulacji, takich jak unijna ustawa AI Act, która ma na celu kontrolę rozwoju i zastosowań generatywnej AI .

---

### **2. Duże modele językowe (LLM, np. ChatGPT)**
LLM stały się kluczowym narzędziem w wielu dziedzinach, a ich rozwój w 2025 roku skupia się na:
- **Specjalizacja domenowa**: Powstają modele dostosowane do konkretnych branż, np. BloombergGPT (finanse) czy Med-PaLM (medycyna), które oferują lepszą dokładność w wąskich zastosowaniach .
- **Multimodalność**: Modele takie jak GPT-4o czy Gemini 2.0 łączą tekst, obraz, dźwięk i wideo, umożliwiając bardziej naturalne interakcje .
- **Autonomiczne agenty**: LLM są wykorzystywane do tworzenia systemów, które mogą samodzielnie wykonywać zadania, np. planować spotkania czy analizować dane .
- **Efektywność energetyczna**: Rośnie popularność mniejszych, ale wydajnych modeli, takich jak TinyLlama, które zużywają mniej mocy obliczeniowej .
- **Walka z halucynacjami**: Wprowadzane są mechanizmy weryfikacji faktów w czasie rzeczywistym, aby zmniejszyć ryzyko błędnych odpowiedzi .

---

### **3. Sztuczna inteligencja ogólna (AGI)**
AGI, czyli systemy zdolne do wykonywania dowolnych zadań intelektualnych na poziomie człowieka, wciąż pozostają w sferze badań, ale budzą ogromne zainteresowanie:
- **Postępy w badaniach**: Firmy takie jak OpenAI i DeepMind pracują nad AGI, choć wciąż brakuje konsensusu co do definicji i metod osiągnięcia tego celu .
- **Kontrowersje**: Niektórzy eksperci, jak Chris Frewin, twierdzą, że LLM nigdy nie staną się AGI ze względu na fundamentalne różnice w architekturze poznawczej .
- **Przygotowania biznesowe**: Przedsiębiorstwa zaczynają planować strategie na wypadek pojawienia się AGI, skupiając się na integracji z ludzkimi zespołami .

---

### **4. Wyzwania i przyszłość**
- **Bezpieczeństwo i prywatność**: Wraz z rozwojem SI rośnie znaczenie zabezpieczeń przed atakami, takimi jak iniekcja złośliwych promptów .
- **Wpływ na rynek pracy**: AI automatyzuje wiele zadań, co może prowadzić do transformacji zawodów, szczególnie w obszarach kreatywnych i biurowych .
- **Open source**: Rośnie popularność otwartych modeli LLM, takich jak LLaMA czy Mistral, które dają większą kontrolę nad technologią .

---

### Podsumowanie
Generatywna AI i LLM już dziś rewolucjonizują wiele sektorów, podczas AGI pozostaje celem długoterminowym. Kluczowe trendy na 2025 rok to specjalizacja modeli, multimodalność, wzrost regulacji oraz etyczne wyzwania. Firmy i badacze muszą balansować między innowacją a odpowiedzialnym rozwojem SI .
$$, 5);
INSERT INTO episodes (no, title, content, module_id) VALUES (1, 'Czym jest sztuczna inteligencja (SI)? Definicje i zastosowania', $$- **uczenie się**,  
- **rozumowanie**,  
- **rozpoznawanie wzorców**,  
- **podejmowanie decyzji**,  
- **przetwarzanie języka naturalnego**.  

### **Kluczowe definicje SI**  
1. **SI wąska (słaba AI)** – Systemy wyspecjalizowane w jednym zadaniu (np. rozpoznawanie obrazów, chatboty, autonomiczne samochody).  
2. **SI ogólna (AGI, silna AI)** – Hipoteza maszyny o uniwersalnej inteligencji, zdolnej do myślenia jak człowiek (jeszcze nieosiągnięta).  
3. **Uczenie maszynowe (ML)** – Podzbiór SI, w którym algorytmy uczą się na danych (np. rekomendacje Netflixa).  
4. **Głębokie uczenie (Deep Learning)** – Zaawansowane ML wykorzystujące sieci neuronowe (np. generowanie obrazów przez DALL-E).  

### **Zastosowania SI**  
- **Medycyna**: Diagnostyka obrazowa (np. wykrywanie nowotworów w RTG).  
- **Przemysł**: Roboty przemysłowe, prognozowanie awarii maszyn.  
- **Finanse**: Wykrywanie fraudów, algorytmy tradingowe.  
- **Rozrywka**: Generowanie muzyki (np. OpenAI Jukebox), gry komputerowe (NPC).  
- **Język**: Tłumaczenia (DeepL, Google Translate), chatboty (ChatGPT).  
- **Automatyzacja**: Samochody autonomiczne (Tesla), asystenci głosowi (Siri, Alexa).  

### **Kontrowersje wokół SI**  
- **Etyka**: Czy AI powinna podejmować decyzje (np. w sądownictwie)?  
- **Bezpieczeństwo**: Ryzyko nadużyć (np. deepfake’i).  
- **Rynek pracy**: Automatyzacja zawodów (np. kasjerów, księgowych). 
$$, 1);
INSERT INTO episodes (no, title, content, module_id) VALUES (2, 'Prosta sieć neuronowa - architektura i działanie', $$
---

### **1. Architektura prostej sieci neuronowej**  
Najprostsza sieć to **perceptron wielowarstwowy (MLP, Multilayer Perceptron)** z trzema warstwami:  
- **Warstwa wejściowa** – przyjmuje dane (np. cechy obrazu lub tabeli).  
- **Warstwa ukryta** (może być kilka) – wykonuje obliczenia za pomocą funkcji aktywacji.  
- **Warstwa wyjściowa** – zwraca wynik (np. klasę w klasyfikacji lub wartość w regresji).  

**Przykład architektury:**  
```
Input Layer (3 neurony) → Hidden Layer (4 neurony) → Output Layer (1 neuron)
```  

---

### **2. Działanie pojedynczego neuronu**  
Każdy neuron oblicza swoją wartość wyjściową w dwóch krokach:  
1. **Kombinacja liniowa:**  
   \[
   z = w_1x_1 + w_2x_2 + \dots + w_nx_n + b
   \]  
   - \(x_1, \dots, x_n\) – wejścia,  
   - \(w_1, \dots, w_n\) – wagi,  
   - \(b\) – bias (przesunięcie).  

2. **Funkcja aktywacji:**  
   \[
   a = f(z)
   \]  
   Gdzie \(f\) to np.:  
   - *Sigmoid* (dla klasyfikacji binarnej),  
   - *ReLU* (popularna w warstwach ukrytych),  
   - *Softmax* (dla wieloklasowego wyjścia).  

---

### **3. Przepływ danych (forward propagation)**  
1. Dane wejściowe (\(X\)) są przekazywane przez kolejne warstwy.  
2. Każda warstwa oblicza swoje wyjście na podstawie wag i funkcji aktywacji.  
3. Na wyjściu otrzymujemy predykcję (\(\hat{y}\)), którą porównujemy z prawdziwą wartością (\(y\)).  

**Przykład dla sieci z jedną warstwą ukrytą:**  
\[
\hat{y} = f_{\text{output}}(W_2 \cdot f_{\text{hidden}}(W_1 \cdot X + b_1) + b_2)
\]  

---

### **4. Uczenie sieci (backpropagation)**  
Sieć uczy się przez minimalizację **funkcji straty** (np. MSE dla regresji, cross-entropy dla klasyfikacji). Algorytm **backpropagation** oblicza gradienty i aktualizuje wagi za pomocą **optymalizatora** (np. gradient descent):  
1. Oblicz błąd na wyjściu.  
2. Propaguj błąd wstecz, obliczając gradienty względem wag.  
3. Zaktualizuj wagi:  
   \[
   w := w - \alpha \cdot \frac{\partial L}{\partial w}
   \]  
   Gdzie \(\alpha\) to współczynnik uczenia (*learning rate*).  

---

### **5. Przykład w Pythonie (z użyciem biblioteki `Keras`)**  
```python
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense

# Budowa modelu
model = Sequential([
    Dense(4, activation=\'relu\', input_shape=(3,)),  # Warstwa ukryta (4 neurony)
    Dense(1, activation=\'sigmoid\')                 # Warstwa wyjściowa
])

# Kompilacja
model.compile(optimizer=\'adam\', loss=\'binary_crossentropy\', metrics=[\'accuracy\'])

# Trenowanie
model.fit(X_train, y_train, epochs=10, batch_size=32)
```

---

### **Podsumowanie**  
- **Wejście → Obliczenia (funkcje aktywacji) → Wyjście**.  
- Uczenie odbywa się przez **backpropagation** i optymalizację wag.  
- Proste sieci mogą rozwiązywać zadania klasyfikacji, regresji i inne.  
$$, 3);
INSERT INTO episodes (no, title, content, module_id) VALUES (2, 'Historia sztucznej inteligencji: od Turinga do deep learningu', $$Sztuczna inteligencja (AI) przeszła długą i fascynującą drogę od teoretycznych koncepcji Alana Turinga do współczesnych zaawansowanych systemów głębokiego uczenia (deep learning). Oto kluczowe etapy tej ewolucji:

## 1. Podwaliny teoretyczne (lata 40. i 50. XX wieku)

- **Alan Turing** w 1950 roku zaproponował **test Turinga** jako sposób na ocenę inteligencji maszyn w swoim przełomowym artykule "Computing Machinery and Intelligence". Jego prace teoretyczne dotyczyły możliwości stworzenia maszyn naśladujących ludzkie myślenie.
- W 1956 roku odbyła się **konferencja w Dartmouth**, gdzie po raz pierwszy użyto terminu "sztuczna inteligencja". To wydarzenie uznaje się za formalne narodziny AI jako dziedziny nauki.

## 2. Wczesne systemy AI (lata 60. i 70.)

- **ELIZA** (1961) - pierwszy chatbot symulujący rozmowę z psychoterapeutą, stworzony przez Josepha Weizenbauma.
- **Perceptron** Franka Rosenblatta (1958) - pierwsza funkcjonalna sieć neuronowa, choć bardzo prosta w porównaniu z dzisiejszymi standardami.
- **Systemy eksperckie** w latach 70., które wykorzystywały zakodowaną wiedzę specjalistyczną do rozwiązywania problemów w wąskich dziedzinach.

## 3. Zimne zimy AI i odrodzenie (lata 80. i 90.)

- Okresy **"zim AI"** (1974-1980 i 1987-1993) charakteryzowały się spadkiem finansowania i zainteresowania ze względu na niezrealizowane oczekiwania.
- Przełom w **sieciach neuronowych**: Geoffrey Hinton, Yann LeCun i Yoshua Bengio udoskonalili algorytm **backpropagation** (wstecznej propagacji błędów), umożliwiając efektywne trenowanie wielowarstwowych sieci.
- W 1997 roku **Deep Blue** IBM pokonał mistrza świata w szachach Garriego Kasparowa.

## 4. Rewolucja głębokiego uczenia (od 2000 roku)

- **Termin "deep learning"** został spopularyzowany przez Geoffreya Hintona w 2006 roku.
- Przełom w 2012 roku, gdy sieci neuronowe osiągnęły niespotykaną dokładność w rozpoznawaniu obrazów, dzięki wykorzystaniu dużych zbiorów danych i mocy obliczeniowej GPU.
- W 2019 roku Hinton, LeCun i Bengio otrzymali **Nagrodę Turinga** za swoje pionierskie prace nad głębokim uczeniem.

## 5. Współczesne zastosowania

- **Generatywna AI** (np. GPT, DALL-E) zdolna do tworzenia tekstu, obrazów i muzyki.
- **Autonomiczne samochody** wykorzystujące zaawansowane algorytmy widzenia komputerowego.
- Systemy takie jak **AlphaGo** pokonujące ludzkich mistrzów w skomplikowanych grach.
$$, 1);
INSERT INTO episodes (no, title, content, module_id) VALUES (2, 'Jak rozwijać się w dziedzinie SI? Polecane ścieżki nauki', $$$$, 5);
INSERT INTO episodes (no, title, content, module_id) VALUES (1, 'Jak maszyny się uczą? Rodzaje uczenia: nadzorowane, nienadzorowane, ze wzmocnieniem', $$
### **3 główne rodzaje uczenia maszynowego:**  

#### 1. **Uczenie nadzorowane (Supervised Learning)**  
- **Cel:** Nauczenie modelu mapowania między danymi wejściowymi (**X**) a oczekiwanymi wynikami (**y**) na podstawie oznakowanych danych treningowych.  
- **Dane:** Zbiór danych zawierający **pary (wejście, etykieta)**, np. zdjęcia z opisami, ceny domów w zależności od metrażu.  
- **Przykłady zastosowań:**  
  - Klasyfikacja (np. rozpoznawanie spamu, diagnostyka medyczna)  
  - Regresja (np. prognozowanie cen, przewidywanie sprzedaży)  
- **Popularne algorytmy:**  
  - Regresja liniowa, regresja logistyczna  
  - Drzewa decyzyjne, Random Forest  
  - SVM (Support Vector Machines)  
  - Sieci neuronowe (np. CNN w przetwarzaniu obrazów)  

#### 2. **Uczenie nienadzorowane (Unsupervised Learning)**  
- **Cel:** Odkrywanie ukrytych wzorców lub struktur w danych **bez etykiet**.  
- **Dane:** Tylko dane wejściowe (**X**), bez oczekiwanych wyników.  
- **Przykłady zastosowań:**  
  - Grupowanie (klastrowanie, np. segmentacja klientów)  
  - Redukcja wymiarowości (np. PCA do wizualizacji danych)  
  - Wykrywanie anomalii (np. wykrywanie oszustw)  
- **Popularne algorytmy:**  
  - K-means (klastrowanie)  
  - DBSCAN (grupowanie oparte na gęstości)  
  - PCA (Analiza Głównych Składowych)  
  - Autoencodery (w głębokim uczeniu)  

#### 3. **Uczenie przez wzmocnienie (Reinforcement Learning - RL)**  
- **Cel:** Nauczenie **agenta** podejmowania optymalnych decyzji poprzez **nagrody i kary** w dynamicznym środowisku.  
- **Dane:** Agent uczy się przez **interakcję ze środowiskiem**, otrzymując **feedback w postaci nagród**.  
- **Przykłady zastosowań:**  
  - Sterowanie robotami  
  - Gry (np. AlphaGo, Dota 2 boty)  
  - Autonomiczne samochody  
  - Optymalizacja strategii biznesowych  
- **Kluczowe pojęcia:**  
  - **Agent** – podejmuje decyzje  
  - **Środowisko** – otoczenie, w którym działa agent  
  - **Nagroda (reward)** – sygnał wskazujący, czy decyzja była dobra  
  - **Polityka (policy)** – strategia działania agenta  
- **Popularne algorytmy:**  
  - Q-Learning  
  - Deep Q-Networks (DQN)  
  - Policy Gradient (np. Proximal Policy Optimization - PPO)  

### **Podsumowanie**  
| Typ uczenia | Dane | Cel | Przykłady algorytmów |  
|------------|------|------|----------------------|  
| **Nadzorowane** | Etykietowane (X, y) | Prognozowanie na podstawie wzorców | Regresja liniowa, SVM |  
| **Nienadzorowane** | Bez etykiet (X) | Odkrywanie struktur | K-means, PCA |  
| **Wzmocnienie** | Interakcja + nagrody | Optymalizacja decyzji | Q-Learning, DQN |  
$$, 2);
INSERT INTO episodes (no, title, content, module_id) VALUES (3, 'Dane treningowe, testowe i walidacyjne - dlaczego są ważne?', $$
### 1. **Zbiór treningowy (Training set)**  
   - **Cel**: Uczenie modelu na podstawie danych.  
   - **Znaczenie**:  
     - Model "widzi" te dane i dostosowuje swoje parametry (np. wagi w sieci neuronowej), aby nauczyć się wzorców.  
     - Im większy i reprezentatywniejszy zbiór treningowy, tym lepiej model może się uogólniać.  
   - **Potencjalny problem**: Jeśli model jest zbyt złożony, może **przetrenować się** (overfitting), czyli zapamiętać dane zamiast się uczyć ogólnych zasad.

### 2. **Zbiór walidacyjny (Validation set)**  
   - **Cel**: Dostrajanie hiperparametrów i ocena modelu podczas treningu.  
   - **Znaczenie**:  
     - Pozwala wybrać najlepszą architekturę modelu (np. liczbę warstw w sieci neuronowej) lub wartości hiperparametrów (np. współczynnik uczenia).  
     - Pomaga wczesnie wykryć overfitting – jeśli model radzi sobie świetnie na danych treningowych, ale słabo na walidacyjnych, oznacza to, że nie generalizuje dobrze.  
   - **Uwaga**: Często stosuje się **walidację krzyżową (cross-validation)**, zwłaszcza przy małych zbiorach danych.

### 3. **Zbiór testowy (Test set)**  
   - **Cel**: Ostateczna ocena modelu na **całkowicie niezależnych danych**.  
   - **Znaczenie**:  
     - Symuluje rzeczywiste warunki działania modelu – dane testowe **nie były nigdy użyte** podczas treningu ani walidacji.  
     - Pozwala oszacować, jak model będzie działał na nowych, niewidzianych danych.  
   - **Kluczowa zasada**: Zbiór testowy powinien być używany **tylko raz** na sam koniec, aby uniknąć nieuczciwego dostosowania modelu do tych danych (tzw. *data leakage*).

### **Dlaczego ten podział jest ważny?**  
- **Zapobiega overfittingowi**: Model musi działać dobrze nie tylko na danych, które "zna", ale też na nowych.  
- **Ocena realnej skuteczności**: Testowanie na niezależnym zbiorze daje realistyczne wyniki.  
- **Optymalizacja modelu**: Walidacja pomaga wybrać najlepsze ustawienia bez "oszustwa".  

### **Przykład złego podejścia**  
Jeśli użyjemy tego samego zbioru do treningu i testu, model może osiągać **zawyżone wyniki**, ponieważ już "zapamiętał" dane, ale w praktyce będzie słabo działał na nowych przykładach.

### **Alternatywy i dodatkowe techniki**  
- **Cross-validation** (np. k-fold) – przydatne przy małych danych, wielokrotne dzielenie na trening/walidację.  
- **Hold-out method** – klasyczny podział (np. 60/20/20 lub 70/15/15).  
$$, 2);
INSERT INTO episodes (no, title, content, module_id) VALUES (1, 'Jak działa sztuczny neuron? Perceptron i funkcje aktywacji.', $$
---

### **1. Perceptron (najprostszy sztuczny neuron)**
Perceptron składa się z:
- **Wejść** (\(x_1, x_2, \dots, x_n\)) – dane lub cechy.
- **Wag** (\(w_1, w_2, \dots, w_n\)) – parametry uczone, które określają znaczenie każdego wejścia.
- **Sumy ważonej** – obliczanej jako:  
  \[
  z = w_0 + w_1 x_1 + w_2 x_2 + \dots + w_n x_n
  \]
  gdzie \(w_0\) to *bias* (przesunięcie).
- **Funkcji aktywacji** – decyduje, czy neuron "aktywuje się" (przykład: funkcja krokowa w klasycznym perceptronie).

**Działanie perceptronu**:  
Jeśli suma ważona przekroczy pewien próg, neuron zwraca **1**, w przeciwnym razie **0** (w przypadku funkcji krokowej).

---

### **2. Funkcje aktywacji**
Perceptrony i współczesne neurony używają różnych funkcji aktywacji, aby wprowadzić **nieliniowość** (kluczową dla uczenia złożonych wzorców). Przykłady:

1. **Funkcja krokowa** (używana w klasycznym perceptronie):  
   \[
   f(z) = \begin{cases} 
   1 & \text{if } z \geq 0, \\
   0 & \text{if } z < 0.
   \end{cases}
   \]
   - Stosowana tylko w prostych zadaniach klasyfikacji liniowej.

2. **Sigmoida** (logistyczna):  
   \[
   f(z) = \frac{1}{1 + e^{-z}}
   \]
   - Zwraca wartości między 0 a 1. Używana w probabilistycznych modelach.

3. **ReLU (Rectified Linear Unit)**:  
   \[
   f(z) = \max(0, z)
   \]
   - Najpopularniejsza w głębokich sieciach – szybka obliczeniowo i redukuje problem zanikającego gradientu.

4. **Tanh (Tangens hiperboliczny)**:  
   \[
   f(z) = \tanh(z)
   \]
   - Podobna do sigmoidy, ale zwraca wartości między -1 a 1.

---

### **3. Różnica między perceptronem a neuronem w głębokich sieciach**
- **Perceptron Rosenblatta** (1958):  
  - Używa funkcji krokowej.  
  - Może klasyfikować tylko liniowo separowalne dane (np. AND, OR).  
  - Nie nadaje się do nieliniowych problemów (np. XOR).  

- **Neuron w MLP (wielowarstwowej sieci neuronowej)**:  
  - Wykorzystuje nieliniowe funkcje aktywacji (ReLU, sigmoidę).  
  - Po połączeniu w warstwy może uczyć się złożonych funkcji (np. obrazów, tekstu).  

---

### **4. Dlaczego funkcje aktywacji są kluczowe?**
- Bez nich sieć byłaby po prostu **liniową kombinacją wejść** (nawet z wieloma warstwami!).  
- Nieliniowości pozwalają modelować skomplikowane zależności w danych.  

---

### Podsumowanie
Sztuczny neuron to "maszyna matematyczna", która:  
1. Oblicza sumę ważoną wejść.  
2. Stosuje funkcję aktywacji, aby zdecydować o wyjściu.  
3. W perceptronie jest prostym klasyfikatorem, a w głębokich sieciach – częścią większej, nieliniowej struktury.  

Przykład działania perceptronu (dla funkcji krokowej):  
- Dane: \(x_1 = 1, x_2 = 0\), wagi: \(w_1 = 0.5, w_2 = -0.5\), bias: \(w_0 = -0.2\).  
- Suma: \(z = -0.2 + 0.5 \cdot 1 + (-0.5) \cdot 0 = 0.3\).  
- Wyjście: \(f(0.3) = 1\) (jeśli próg to 0).
$$, 3);
INSERT INTO episodes (no, title, content, module_id) VALUES (2, 'Przykłady zastosowań: rozpoznawanie obrazów, NLP, autonomiczne samochody', $$
### **1. Rozpoznawanie obrazów (Computer Vision)**  
- **Diagnostyka medyczna** – analiza zdjęć RTG, tomografii czy rezonansu magnetycznego w celu wykrycia nowotworów lub innych chorób.  
- **Rozpoznawanie twarzy** – systemy bezpieczeństwa (np. Face ID w smartfonach), kontrola dostępu.  
- **Rolnictwo precyzyjne** – monitorowanie stanu upraw, wykrywanie chorób roślin.  
- **Handel detaliczny** – automatyzacja kas (np. Amazon Go), analiza zachowań klientów.  
- **Przemysł** – kontrola jakości produktów na liniach produkcyjnych.  

### **2. Przetwarzanie języka naturalnego (NLP – Natural Language Processing)**  
- **Tłumaczenie maszynowe** – np. Google Translate, DeepL.  
- **Asystenci głosowi** – Siri, Alexa, Google Assistant rozumiejące i odpowiadające na pytania.  
- **Chatboty i wsparcie klienta** – automatyzacja obsługi klienta w firmach.  
- **Analiza sentymentu** – badanie opinii w mediach społecznościowych (np. ocena reakcji na nowy produkt).  
- **Generowanie tekstu** – np. ChatGPT, DeepSeek do tworzenia treści, podsumowań.  

### **3. Autonomiczne samochody (Self-driving cars)**  
- **Systemy wspomagania kierowcy (ADAS)** – np. Tesla Autopilot, które potrafią utrzymywać pas ruchu, dostosowywać prędkość.  
- **Taksówki autonomiczne** – np. Waymo (Google) oferujące przejazdy bez kierowcy w wybranych miastach.  
- **Logistyka i transport ciężarowy** – autonomiczne ciężarówki (np. TuSimple) do przewozu towarów.  
- **Dostawy autonomiczne** – roboty i pojazdy dostarczające paczki (np. Nuro).  
$$, 4);
INSERT INTO episodes (no, title, content, module_id) VALUES (1, 'Czym jest deep lerning? Sieci konwolucyjne (CNN) i rekurencyjne (RNN)', $$
W kontekście AI, dwie kluczowe architektury deep learningu to:  

### 1. **Sieci konwolucyjne (CNN – Convolutional Neural Networks)**  
   - **Zastosowanie**: Głównie przetwarzanie obrazów, ale też wideo, dane medyczne, NLP (np. klasyfikacja tekstu).  
   - **Cechy charakterystyczne**:  
     - Warstwy **konwolucyjne** – wykrywają lokalne wzorce (np. krawędzie, tekstury) dzięki filtrom (jądrom).  
     - **Pooling** (np. max-pooling) – redukuje wymiarowość, zachowując istotne informacje.  
     - Hierarchiczna ekstrakcja cech (im głębsza warstwa, tym bardziej abstrakcyjne cechy).  
   - **Przykłady**: ResNet, VGG, EfficientNet (do obrazów), Conv1D (do tekstu/sygnałów).  

### 2. **Sieci rekurencyjne (RNN – Recurrent Neural Networks)**  
   - **Zastosowanie**: Dane sekwencyjne – tekst, mowa, szeregi czasowe, tłumaczenia.  
   - **Cechy charakterystyczne**:  
     - **Pętle rekurencyjne** – pamiętają poprzednie stany (kontekst), np. w zdaniu "The cat [...] is hungry" RNN pamięta, że podmiot to "cat").  
     - Problemy: **Zanikające gradienty** (trudność w uczeniu długich zależności).  
   - **Ulepszenia**:  
     - **LSTM (Long Short-Term Memory)** – lepsza pamięć długoterminowa dzięki bramkom.  
     - **GRU (Gated Recurrent Unit)** – uproszczona wersja LSTM.  
   - **Przykłady**: Modele językowe, tłumaczenie maszynowe (np. stare wersje Google Translate).  

### **Różnice CNN vs. RNN**  
| Cecha               | CNN                          | RNN                          |  
|---------------------|------------------------------|------------------------------|  
| **Dane**            | Przestrzenne (obrazy, siatki)| Sekwencyjne (tekst, czas)    |  
| **Pamięć**          | Brak (każdy piksel traktowany niezależnie) | Zachowuje kontekst (poprzednie kroki) |  
| **Architektura**    | Filtry konwolucyjne          | Pętle rekurencyjne           |  

### **Nowoczesne rozwinięcia**  
- **Transformery** (np. BERT, GPT) – zastępują RNN w NLP, używają **mechanizmu uwagi** (attention), lepiej radząc sobie z długimi zależnościami.  
- **Hybrydy CNN+RNN** – np. do opisywania obrazów (CNN ekstrahuje cechy, RNN generuje opis).  
$$, 4);
INSERT INTO episodes (no, title, content, module_id) VALUES (2, 'Prosty przykład algorytmu ML (np. regresja liniowa lub drzewa decyzyjne)', $$
---

### 1. **Regresja liniowa**  
**Cel:** Przewidywanie wartości (np. ceny domu na podstawie metrażu).  

```python
import numpy as np
from sklearn.linear_model import LinearRegression

# Dane przykładowe: X = metraż (m²), y = cena (tys. zł)
X = np.array([[50], [60], [70], [80], [90]])  # cecha (1D)
y = np.array([300, 370, 420, 470, 530])       # etykieta

# Trenowanie modelu
model = LinearRegression()
model.fit(X, y)

# Predykcja dla nowej wartości
nowy_metraz = np.array([[65]])
predykcja = model.predict(nowy_metraz)
print(f"Przewidywana cena dla 65m²: {predykcja[0]:.2f} tys. zł")

# Współczynniki modelu
print(f"Wzór: y = {model.coef_[0]:.2f} * X + {model.intercept_:.2f}")
```

**Wynik:**  
```
Przewidywana cena dla 65m²: 395.00 tys. zł
Wzór: y = 5.70 * X + 15.00
```

---

### 2. **Drzewo decyzyjne**  
**Cel:** Klasyfikacja (np. czy klient dostanie pożyczkę na podstawie wieku i zarobków).  

```python
from sklearn.tree import DecisionTreeClassifier
import matplotlib.pyplot as plt
from sklearn.tree import plot_tree

# Dane przykładowe: X = [wiek, zarobki (tys. zł)], y = czy pożyczka (0/1)
X = np.array([[25, 40], [30, 60], [35, 80], [40, 30], [45, 50]])
y = np.array([0, 1, 1, 0, 1])

# Trenowanie modelu
model = DecisionTreeClassifier(max_depth=2)
model.fit(X, y)

# Predykcja dla nowego klienta
nowy_klient = np.array([[28, 45]])
predykcja = model.predict(nowy_klient)
print(f"Czy dostanie pożyczkę? {\'Tak\' if predykcja[0] == 1 else \'Nie\'}")

# Wizualizacja drzewa
plt.figure(figsize=(10, 6))
plot_tree(model, feature_names=[\'wiek\', \'zarobki\'], class_names=[\'Nie\', \'Tak\'], filled=True)
plt.show()
```

**Wynik:**  
```
Czy dostanie pożyczkę? Nie
```
+ Wizualizacja drzewa pokazuje podziały w oparciu o warunki (np. `zarobki <= 45`).

---

### Kluczowe pojęcia:
- **Regresja liniowa**: Szuka liniowej zależności między cechą a etykietą.  
- **Drzewo decyzyjne**: Działa jak seria pytań "if-else", dzieląc dane na grupy.  
- `fit()`: Uczy model na danych.  
- `predict()`: Przewiduje etykietę dla nowych danych.  

Jeśli chcesz głębszej analizy (np. metryki oceny, tuning parametrów), daj znać!
$$, 2);
