package com.CBoswell963.pokemondb.controllers

import cats.effect._
import org.http4s._
import org.http4s.dsl.Http4sDsl
import io.circe.syntax._
import io.circe.generic.auto._
import com.CBoswell963.pokemondb.repositories.PokemonRepo
import com.CBoswell963.pokemondb.models.Pokemon

class PokemonRoutes(pokemonRepo: PokemonRepo)(implicit val cs: ContextShift[IO]) extends Http4sDsl[IO] {

  private object IdQueryParamMatcher extends QueryParamDecoderMatcher[Int]("id")
  private object NameQueryParamMatcher extends QueryParamDecoderMatcher[String]("name")

  val routes: HttpRoutes[IO] = HttpRoutes.of[IO] {
    
    // GET /pokemon?id=1
    case GET -> Root / "pokemon" :? IdQueryParamMatcher(id) =>
      pokemonRepo.fetchPokemonById(id).flatMap {
        case Some(pokemon) => Ok(pokemon.asJson)
        case None => NotFound(s"Pokemon with id $id not found")
      }
    
    // GET /pokemon?name=pikachu
    case GET -> Root / "pokemon" :? NameQueryParamMatcher(name) =>
      pokemonRepo.fetchPokemonByName(name).flatMap {
        case Some(pokemon) => Ok(pokemon.asJson)
        case None => NotFound(s"Pokemon with name $name not found")
      }
    
    case _ =>
      BadRequest("Missing or invalid query parameter. Provide 'id' or 'name'.")
  }
}
