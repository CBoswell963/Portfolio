package com.CBoswell963.pokemondb

import scala.io.Source
import cats.effect.{IO, Resource}
import doobie.hikari.HikariTransactor
import org.testcontainers.containers.PostgreSQLContainer
import org.testcontainers.utility.DockerImageName

object TestTransactor {

  private val schema: String =
    Source.fromResource("db/schema.sql").getLines().mkString("\n")

  def apply(): Resource[IO, HikariTransactor[IO]] = for {
    config <- Resource.eval(IO(ConfigSource.default.at("test.db").loadOrThrow[DbConfig]))
    transactor <- HikariTransactor.newHikariTransactor[IO](
      config.driver,
      config.url,
      config.user,
      config.password
    )
    _ <- Resource.eval(IO.println("Setting up test schema..."))
    _ <- Resource.eval(schema.update.run.transact(transactor))
  } yield transactor
}