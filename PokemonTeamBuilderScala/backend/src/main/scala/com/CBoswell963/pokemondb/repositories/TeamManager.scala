package com.CBoswell963.pokemondb.managers

import cats.effect.IO
import doobie._
import doobie.implicits._
import com.CBoswell963.pokemondb.models.Team
import com.CBoswell963.pokemondb.utils.DatabaseConnectionManager

class TeamManager(db: DatabaseConnectionManager) {
    
    def saveTeam(team: Team): IO[Int] = {
        val pokemonIdStr = team.pokemonIds.mkString(",")
        val query =
            sql"""
                INSERT INTO team (user_id, team_name, pokemon_ids)
                VALUES (${team.userId}, ${team.teamName}, $pokemonIdsStr)
            """.update.run

        db.transactor.use(xa => query.transact(xa))
    }

    def fetchTeamByUser(userId: Int): IO[List[Team]] = {
        val query =
            sql"""
                SELECT id, user_id, team_name, pokemon_ids
                FROM teams
                WHERE user_id = $userId
            """.query[(Int, Int, String, String)].to[List]

        db.transactor.user { xa =>
            query.transact(xa).map(_.map {
                case (id, userId, teamName, idStr) =>
                    Team(id, userId, teamName, parseIds(idsStr))
            })
        }
    }

    def deleteTeamById(teamId: Int): IO[Int] = {
        val query =
            sql"""
                DELETE FROM teams
                WHERE id = $teamId
            """.update.run
        
        db.transactor.use(xa => query.transact(xa))
    }

    private def parseIds(ids: String): List[Int] =
        ids.split(",").map(_.trim.toInt).toList
}