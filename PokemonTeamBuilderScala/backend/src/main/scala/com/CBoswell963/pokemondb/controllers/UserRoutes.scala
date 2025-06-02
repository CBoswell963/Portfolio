package com.CBoswell963.pokemondb.controllers

import cats.effect.IO
import org.http4s._
import org.http4s.dsl.io._
import org.http4s.circe._
import io.circe.generic.auto._
import io.circe.syntax._
import com.CBoswell963.pokemondb.services.UserService
import com.CBoswell963.pokemondb.auth.AuthenticationManager
import com.CBoswell963.pokemondb.models.User

object UserRoutes {
    case class RegisterRequest(username: String, password: String)
    case class LoginRequest(username: String, password: String)

    implicit val registerDecoder = jsonOf[IO, RegisterRequest]
    implicit val loginDecoder = jsonOf[IO, LoginRequest]

    def routes(userService: UserService, authManager: AuthenticationManager): HttpRoutes[IO] = HttpRoutes.of[IO] {

        case req @ POST -> Root / "register" =>
            for {
                registerData <- req.as[RegisterRequest]
                result <- userService.registerUser(registerData.username, registerData.password)
                resp <- result match {
                    case Some(user) => Created(user.asJson)
                    case None       => Conflict("User alreasy exists.")
                }
            } yield resp

        case req @ POST -> Root / "login" =>
            for {
                loginData <- req.as[LoginRequest]
                tokenOpt <- userService.authenticateUser(loginData.username, loginData.password)
                resp <- tokenOpt match {
                    case Some(token) => Ok(token.asJson)
                    case None        => Unauthorized("Invalid credentials.")
                }
            } yield resp
    }
}