package com.CBoswell963.pokemondb

import cats.effect.{ExitCode, IO, IOApp}
import doobie.implicits._
import com.CBoswell963.pokemondb.controllers.PokemonRoutes
import com.CBoswell963.pokemondb.repositories.PokemonRepo
import com.CBoswell963.pokemondb.utils.DatabaseConnectionManager

val dbManager = new DatabaseConnectionManager(...)
val pokemonRepo = new PokemonRepo(dbManager)
val pokemonRoutes = new PokemonRoutes(pokemonRepo)

val httpApp = Router[IO](
    "/api" -> pokemonRoutes.routes
.orNotFound)

object MainHttpServer extends IOApp {
    def run(args: List[String]): IO[ExitCode] = {
        DatabaseConnectionManager.transactor.use { xa =>
            sql"SELECT version()".query[String].unique.transact(xa).flatMap { version => 
                IO(println(s"Connected to PostgreSQL: $version"))
            }
        }.as(ExitCode.Success)
    }
}