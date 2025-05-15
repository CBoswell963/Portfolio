import sbt._

object Dependencies {

  val http4sVersion = "0.23.24"
  val circeVersion  = "0.14.6"
  val doobieVersion = "1.0.0-RC4"

  val scalaTest = "org.scalatest" %% "scalatest" % "3.2.18"

  val http4s = Seq(
    "org.http4s" %% "http4s-dsl"          % http4sVersion,
    "org.http4s" %% "http4s-blaze-server" % http4sVersion,
    "org.http4s" %% "http4s-circe"        % http4sVersion
  )

  val circe = Seq(
    "io.circe" %% "circe-core"    % circeVersion,
    "io.circe" %% "circe-generic" % circeVersion,
    "io.circe" %% "circe-parser"  % circeVersion
  )

  val doobie = Seq(
    "org.tpolecat" %% "doobie-core"     % doobieVersion,
    "org.tpolecat" %% "doobie-hikari"   % doobieVersion,
    "org.tpolecat" %% "doobie-postgres" % doobieVersion
  )

  val all = http4s ++ circe ++ doobie :+ scalaTest
}
