package models

import io.circe.{Decoder, Encoder}
import io.circe.generic.semiauto._

final case class PokemonType(
    name: String
)

object PokemonType {
    implicit val decoder: Decoder[PokmeonType] = deriveDecoder
    implicit val encoder: Encoder[PokemonType] = deriveEncoder
}