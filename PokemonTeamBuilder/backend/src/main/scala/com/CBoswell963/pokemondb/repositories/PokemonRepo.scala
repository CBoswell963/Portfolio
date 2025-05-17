package com.CBoswell963.pokemondb.repositories

import cats.effect.IO
import com.CBoswell963.pokemondb.models.Pokemon
import com.CBoswell963.pokemondb.utils.DatabaseConnectionManager

class PokemonRepo(db: DatabaseConnectionManager) {

  def fetchPokemonById(id: Int): IO[Option[Pokemon]] = {
    // SQL query example to get pokemon by ID
    val query = s"SELECT id, name, types, sprite_url FROM pokemon WHERE id = $id"
    db.executeQuery(query).map { rs =>
      if (rs.next()) Some(Pokemon(
        id = rs.getInt("id"),
        name = rs.getString("name"),
        types = parseTypes(rs.getString("types")),
        spriteURL = rs.getString("sprite_url")
      ))
      else None
    }
  }

  def fetchPokemonByName(name: String): IO[Option[Pokemon]] = {
    val query = s"SELECT id, name, types, sprite_url FROM pokemon WHERE name = '$name'"
    db.executeQuery(query).map { rs =>
      if (rs.next()) Some(Pokemon(
        id = rs.getInt("id"),
        name = rs.getString("name"),
        types = parseTypes(rs.getString("types")),
        spriteURL = rs.getString("sprite_url")
      ))
      else None
    }
  }

  // Helper to parse types from stored DB string representation (e.g., "fire, flying")
  private def parseTypes(typesString: String): List[String] = {
    typesString.split(",").map(_.trim).toList
  }
}
