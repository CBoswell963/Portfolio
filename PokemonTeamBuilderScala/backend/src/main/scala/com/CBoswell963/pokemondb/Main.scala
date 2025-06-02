package com.CBoswell963.pokemondb

import cats.effect.{IO, IOApp}
import doobie.implicits._
import com.CBoswell963.pokemondb.utils.DatabaseConnectionManager

object Main extends IOApp.Simple {

  def run: IO[Unit] = {
    DatabaseConnectionManager.transactor.use { xa =>
      for {
        result <- sql"SELECT 1".query[Int].unique.transact(xa)
        _ <- IO.println(s"Test query result: $result")
      } yield ()
    }
  }
}
