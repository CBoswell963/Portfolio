import Dependencies._

ThisBuild / scalaVersion     := "2.13.13"
ThisBuild / version          := "0.1.0-SNAPSHOT"
ThisBuild / organization     := "com.CBoswell963"
ThisBuild / organizationName := "CBoswell963"

lazy val root = (project in file("."))
  .settings(
    name := "Pokemon Team Builder",
    libraryDependencies ++= Seq(
      "org.tpolecat" %% "doobie-core"     % "1.0.0-RC4",
      "org.tpolecat" %% "doobie-hikari"   % "1.0.0-RC4",
      "org.tpolecat" %% "doobie-postgres" % "1.0.0-RC4",
      "org.typelevel" %% "cats-effect"    % "3.5.1",
      "com.github.pureconfig" %% "pureconfig" % "0.17.4",
    

      //Test Dependencies
      "org.scalameta" %% "munit" % "1.0.0-M10" % Test,
      "org.testcontainers" % "postgresql" % "1.19.3" % Test,
      "org.typelevel" %% "munit-cats-effect-3" % "1.0.0" % Test,
      "org.tpolecat" %% "doobie-scalatest" % "1.0.0-RC4" % Test
    ),

    testFrameworks += new TestFramework("munit.Framework")
  )