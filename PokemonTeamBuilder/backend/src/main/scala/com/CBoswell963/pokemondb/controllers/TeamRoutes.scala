package com.CBoswell963.pokemondb.controllers

import cats.effect.IO
import org.http4s._
import org.http4s.dsl.io._
import org.http4s.circe._
import io.circe.generic.auto._
import io.circe.syntax._
import com.CBoswell963.pokemondb.repositories.TeamManager
import com.CBoswell963.pokemondb.models.Team

object TeamRoutes {
    case class CreateTeamRequest(userId: Int, name: String, pokemonIds: List[Int])

    implicit val createTeamDecoder = jsonOf[IO, CreateTeamRequest]

    def routes(teamManager: TeamManager): HttpRoutes[IO] = HttpRoutes.of[IO] {

        case req @ POST -> Root / "teams" =>
            for {
                createReq <- req.as[CreateTeamRequest]
                team <- teamManager.createTeam(createReq.userId, createReq.name, createReq.pokemonIds)
                resp <- Created(team.asJson)
            } yield resp

        case GET -> Root / "teams" / IntVar(userId) =>
            for {
                teams <- teamManager.getTeamByUserId(userid)
                resp <- Ok(teams.asJson)
            } yield resp

        case DELETE -> Root / "teams" / IntVar(teamId) =>
            for {
                _ <- teamManager.deleteTeam(teamId)
                resp <- Ok("Team deleted.")
            } yield resp
    }
}