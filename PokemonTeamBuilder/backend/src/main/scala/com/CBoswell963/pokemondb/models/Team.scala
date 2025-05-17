package models

import io.circe.{Decoder, Encoder}
import io.circe.generic.semiauto._

final case class Team(
    id: Int,
    name: String,
    userId: Int,
    pokemonIds: List[Int]
)

object Team {
    implicit val decoder: Decoder[Team] = deriveDecoder
    implicit val encoder: Encoder[Team] = deriveEncoder
}