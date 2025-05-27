package com.CBoswell963.pokemondb.repositories

import cats.effect.IO
import doobie._
import doobie.implicits._
import com.CBoswell963.pokemondb.models.Pokemon
import com.CBoswell963.pokemondb.utils.DatabaseConnectionManager

class PokemonRepo(db: DatabaseConnectionManager) {

  def fetchPokemonById(id: Int): IO[Option[Pokemon]] = {

    val query = sql"""
      SELECT id, name, types, sprite_url
      FROM pokemon
      WHERE id = $id
    """.query[(Int, String, String, String)].option

    db.transactor.use { xa =>
      query.transact(xa).map(_.map {
        case (id, name, typesStr, spriteURL) =>
          Pokemon(id, name, parseTypes(typeStr), spriteURL)
      })
    }
  }

  def fetchPokemonByName(name: String): IO[Option[Pokemon]] = {
    val query = sql"""
      SELECT id, name, types, sprite_url
      FROM pokemon
      WHERE name = $name
    """.query[(Int, String, String, String)].option

    db.transactor.use { xa =>
      query.transact(xa).map(_.map {
        case (id, name, typeStr, spriteURL) =>
          Pokemon(id, name, parseTypes(typeStr), spriteURL)
      })
    }
  }

  //Helper to parse comma-separated types into List[String]
  private def parseTypes(typeString: String): List[String] =
    typeString.split(",").map(_.trim).toList
}