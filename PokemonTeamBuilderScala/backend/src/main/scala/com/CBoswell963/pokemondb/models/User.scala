package models

import io.circe.{Decoder, Encoder}
import io.circe.generic.semiauto._

final case class User(
    id: Int,
    username: String,
    passwordHash: String,
    teams: List[Team] = List.empty
)

object User {
    implicit val decoder: Decoder[User] = deriveDecoder
    implicit val encoder: Encoder[User] = deriveEncoder
}