package com.CBoswell963.pokemondb

import munit.CatsEffectSuite
import com.CBoswell963.pokemondb.repositories.PokemonRepo
import com.CBoswell963.pokemondb.utils.DatabseConnectionManager

class PokemonRepoSpec extends CatsEffectSuite {

    test("fetchPokemonById should return a Pokemon if it exists") {
        val transactor = DatabaseConnectionManager.testTransactor
        val repo = new PokemonRepo(transactor)

        for {
            result <- repo.fetchPokemonById(25) //Pikachu
        } yield assert(result.exists(_.name == "Pikachu))
    }

    test("fetchPokemonByName should return None if Pokemon does not exist) {
        val transactor = DatabaseConnectionManager.testTransactor
        val repo = new PokemonRepo(transactor)

        for {
            result <- repo.fetchPokemonByName("MissingNo")
        } yield assert(result.isEmpty)
    }
}
