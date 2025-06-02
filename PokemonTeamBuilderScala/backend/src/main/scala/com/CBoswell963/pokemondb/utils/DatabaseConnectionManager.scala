package com.CBoswell963.pokemondb.utils

import cats.effect.{IO, Resource}
import doobie.hikari.HikariTransactor
import pureconfig._
import pureconfig.generic.auto._
import scala.concurrent.ExecutionContext

case class DatabaseConfig(
  driver: String,
  url: String,
  user: String,
  password: String
)

object DatabaseConnectionManager {

  private val config = ConfigSource.default.at("db").loadOrThrow[DatabaseConfig]

  private val connectEC: ExecutionContext = ExecutionContext.global

  def transactor: Resource[IO, HikariTransactor[IO]] =
    HikariTransactor.newHikariTransactor[IO](
      config.driver,
      config.url,
      config.user,
      config.password,
      connectEC,
      None
    )
}
