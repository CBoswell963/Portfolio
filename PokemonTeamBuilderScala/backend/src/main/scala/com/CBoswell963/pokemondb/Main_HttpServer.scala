package com.CBoswell963.pokemondb

import cats.effect.{ExitCode, IO, IOApp}
import org.http4s.implicits._
import org.http4s.server.Router
import org.http4s.server.middleware.Logger
import org.http4s.ember.server.EmberServerBuilder

import com.CBoswell963.pokemondb.controllers.{PokemonRoutes, UserRoutes, TeamRoutes}
import com.CBoswell963.pokemondb.repositories.{PokemonRepo, TeamManager, UserRepo}
import com.CBoswell963.pokemondb.services.UserService
import com.CBoswell963.pokemondb.auth.AuthenticationManager
import com.CBoswell963.pokemondb.utils.DatabseConnectionManager

object MainHttpServer extends IOApp {
    
    def run(args: List[String]): IO[ExitCode] = {
        for {
            //Transactor Setup
            transactor <- DatabaseConnectionManager.createTransactor

            //Instantiate components
            pokemonRepo = new PokemonRepo(transactor)
            teamManager = new TeamManager(transactor)
            userRepo = new UserRepo(transactor)
            authManager = new AuthenticationManager()
            userService = new UserService(userRepo, authManager)

            //Create routes
            pokemonRoutes = PokemonRoutes.routes(pokemonRepo)
            userRoutes    = UserRoutes.routes(userService, authManager)
            teamRoutes    = TeamRoutes.routes(teamManager)

            //Combine all
            httpApp = Router(
                "/api/pokemon" -> pokemonRoutes,
                "/api/users"   -> userRoutes,
                "/api/teams"   -> teamRoutes
            ).orNotFound

            //Logging
            finalHttpApp = Logger.httpApp(logHeaders = true, logBody = true)(httpApp)

            //Start server
            _ <- EmberServerBuilder.default[IO]
              .withHost("0.0.0.0")
              .withPort(8080)
              .withHttpApp(finalHttpApp)
              .build
              .use(_ => IO.never)
        } yield ExitCode.Success
    }
}