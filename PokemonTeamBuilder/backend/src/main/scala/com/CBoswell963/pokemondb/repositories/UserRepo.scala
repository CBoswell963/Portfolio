package com.CBoswell963.pokemondb.repositories

import cats.effect.IO
import doobie._
import doobie.implicits._
import com.CBoswell963.pokemondb.models.User
import com.CBoswell963.pokemondb.utils.DatabaseConnectionManager

class UserRepo(db: DatabaseConnectionManager) {

    def createUser(user: User): IO[Int] = {
        val query =
            sql"""
                INSERT INTO users (username, password_hash)
                Values (${user.username}, ${user.passwordHash})
            """.update.run

        db.transactor.use(xa => query.transact(xa))
    }

    def fetchUserByUsername(username: String): IO[Option[User]] = {
        val query =
            sql"""
                SELECT id, username, password_hash
                FROM users
                WHERE username = $username
            """.query[User.option]
        
        db.transactor.use(xa => query.transact(xa))
    }

    def deleteUserById(userId: Int): IO[Int] = {
        val query =
            sql"""
                DELETE FROM users
                WHERE id = $userId
            """.update.run
        
        db.transactor.use(xa => query.transact(xa))
    }
}