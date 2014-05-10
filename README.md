Recipelogger
============


[![Build Status](https://api.travis-ci.org/Divinare/recipelogger.svg)](https://api.travis-ci.org/repositories/Divinare/recipelogger)

Heroku: http://recipelogger.herokuapp.com/ingredients
Travis: https://travis-ci.org/Divinare/recipelogger

Tämä sovellus on tarkoitettu erilaisten reseptien kirjanpidon helpottamiseksi. Tulevaisuudessa olisi tarkoitus lisätä toiminnallisuuksien määrää silloin kun on aikaa.

<h2>Käyttöohje:</h2>
Luo käyttäjätunnus
Kirjaudu sisään
Toiminnallisuuksia:
- Omien reseptejen lisäys
   * julkiset reseptit
   * yksityiset reseptit
- Muiden lisäämien julkisten reseptien katselu 
- Omien/muiden reseptien arvostelu

Adminit voivat lisäksi:
- Poistaa/lisätä Kategorioita
- Poistaa/lisätä Ainesosisa


Testaus:
Testit voi ajaa komennolla:
bundle exec rspec spec

Testien rivikattavuus: 90,91%
Testattu on ainakin:
- Olioiden (esim. recipe)
  * luonti
  * poistaminen
  * editointi
  * kenttien validointeja
- Näkymien oikeellisuutta
- Kirjautumisen toiminnallisuus










