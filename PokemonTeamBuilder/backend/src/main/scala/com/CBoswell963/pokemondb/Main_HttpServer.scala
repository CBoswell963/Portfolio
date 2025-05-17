package com.CBoswell963.pokemondb

import cats.effect.{ExitCode, IO, IOApp}
import doobie.implicits._
import com.CBoswell963.pokemondb.utils.DatabaseConnectionManager

object MainHttpServer extends IOApp {
    def run(args: List[String]): IO[ExitCode] = {
        DatabaseConnectionManager.transactor.use { xa =>
            sql"SELECT version()".query[String].unique.transact(xa).flatMap { version => 
                IO(println(s"Connected to PostgreSQL: $version"))
            }
        }.as(ExitCode.Success)
    }
}