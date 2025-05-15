import Dependencies._

ThisBuild / scalaVersion     := "2.13.13"
ThisBuild / version          := "0.1.0-SNAPSHOT"
ThisBuild / organization     := "com.CBoswell963"
ThisBuild / organizationName := "CBoswell963"

lazy val root = (project in file("."))
  .settings(
    name := "Pokemon Team Builder",
    libraryDependencies ++= Seq(
      scalaTest % Test
    )
  )