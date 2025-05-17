package models

import java.time.Instant
import io.circe.{Decoder, Encoder}
import io.circe.generic.semiauto._

final case class AuthToken(
  id: Int,
  userId: Int,
  token: String,
  expiresAt: Instant
)

object AuthToken {
  implicit val decoder: Decoder[AuthToken] = deriveDecoder
  implicit val encoder: Encoder[AuthToken] = deriveEncoder
}
