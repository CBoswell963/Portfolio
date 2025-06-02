package models

import io.circe.{Decoder, Encoder}
import io.circe.generic.semiauto._
import doobie.util.Read

final case class Pokemon(
  id: Int,
  name: String,
  type1: String,
  type2: Option[String]
)

object Pokemon {
  implicit val decoder: Decoder[Pokemon] = deriveDecoder
  implicit val encoder: Encoder[Pokemon] = deriveEncoder
  implicit val read: Read[Pokemon] = Read[(Int, String, String, Option[String])].map {
    case (id, name, type1, type2) => Pokemon(id, name, type1, type2)
  }
}
