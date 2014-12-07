Recipelogger
============


[![Build Status](https://api.travis-ci.org/Divinare/recipelogger.svg)](https://api.travis-ci.org/repositories/Divinare/recipelogger)

Tämä sovellus on tarkoitettu erilaisten reseptien kirjanpidon helpottamiseksi. Tulevaisuudessa olisi tarkoitus lisätä toiminnallisuuksien määrää silloin kun on aikaa.

Heroku: http://recipelogger.herokuapp.com <br />
Travis: https://travis-ci.org/Divinare/recipelogger


<h3>Käyttöohje:</h3>
- Luo ensin käyttäjätunnus ja kirjaudu sisään, jonka jälkeen voit:
- Lisätä omia resepetejä
   * julkiset reseptit
   * yksityiset reseptit
- Katsella muiden lisäämiä julkisia reseptejä
- Arvostella muiden reseptejä tai omia reseptejä

Adminit voivat lisäksi:
- Poistaa/lisätä Kategorioita
- Poistaa/lisätä Ainesosisa


<h3>Testaus:</h3>
Testit voi ajaa komennolla:
bundle exec rspec spec

Testien rivikattavuus: <b>90,91%.</b></br>
Testattu on ainakin:
- Olioiden (esim. recipe)
  * luonti
  * poistaminen
  * editointi
  * kenttien validointeja
- Näkymien oikeellisuutta
- Kirjautumisen toiminnallisuus










