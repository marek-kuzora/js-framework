# Dependences

## Setup
Jest subscriber z przypisanym mu listenerem. Są też dane - tablica utworzonych wcześniej emitters.

## Run
1. Subscriber rejestruje się do trackera
2. Wywołuję access na emitterach
3. Na koniec uruchamiam subscribe_all an subscriberze.

## Effect
Subscriber istnieje cały czas - więc otrzymuję ops/ms realistycznej sytuacji, gdzie element tworzy dependences a następnie utrzymuje je przez swój cały cykl życia.

### Suite
- Static: 1, 3, 5, 10
- Random -1 -length: 3, 5, 10
- Random -length: 1, 3, 5, 10
- Random -count:  9:1, 8:2, 7:3, 6:4, 5:5
> Random data z przedziału 50 listenerów - aby nie było powtórzeń!

# Data Propagation

## Setup
Dane - czyli tablica wcześniej utworzonych emitterów i obiekty - czyli tablica wcześniej utworzonych listenerów. Wykonuję subscribe listenerów do emitterów.

## Run
1. Emitter(y) wykonują zmianę
2. Ręcznie uruchamiany notifier.

## Effect
Testowany jest czas trwania notyfikacji w zależności od dystrybucji listenerów oraz ilości zmienionych emitterów.

## Suite

- Mamy 1, 3, 5, 10 listenerów w każdym emitterze
- Mamy 1, 3, 5, 10 emitterów
- Dystrybucja taka, że żaden listener się nie powtarza, 10%, 20%, 50% listenerów się powtarza w całości. Być może między dwoma emitterami też jakieś konkretny % powtórzeń??

# Building Emitter Structure
Czyli testy jak szybko tworzą się obiekty, które mają z emittera/subscribera korzystać! Ale najpierw muszę wymyślić jak chciałbym fizycznie je szybko budować!!


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
W efekcie potrzebuję najpierw utowrzyć zbiór emitterów a następnie odpalać je odpowiednio. Czyli jak? Jeśli jest static to N pierwszych zawsze. Jeśli jest one 1-random to N-1 pierwszych i losuję sobie 1x z pozostałego przedziału.

> Tworzę subscriber z pustym listenerem.
> Generator tablicy emitterów - bądź robię to ręcznie??

Drugim problemem jest jak budować emittery i dystrybuować do nich listenery na podstawie konkretnych współczynników!