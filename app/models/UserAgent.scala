package models

import play.api._
import play.api.mvc._
import play.api.libs.json._
import play.api.libs.json.Json._
import play.api.libs.functional.syntax._
import org.joda.time.DateTime

case class UserAgent(
  id:Option[Long],
  ip:String,
  os:String,
  browser:String,
  full:String,
  last:DateTime,
  user:Option[User]
) {
  def withoutUser():UserAgent = UserAgent(this.id, this.ip, this.os, this.browser, this.full, this.last, None)

  def withUser(user:User):UserAgent = UserAgent(this.id, this.ip, this.os, this.browser, this.full, this.last, Option(user))
}

object UserAgent extends Function7[Option[Long],String,String,String,String,DateTime,Option[User],UserAgent] {

  implicit val r = Json.reads[UserAgent]
  implicit val w = Json.writes[UserAgent]

  def parse(json:String):UserAgent = {
    if(json == "") throw new Exception("Can't parse a UserAgent from an empty JSON string.")
    Json.fromJson(Json.parse(json)).get
  }

  def toJson(userAgent:UserAgent):String = {
    Json.stringify(Json.toJson(userAgent))
  }

  def parseRequest(request:RequestHeader):UserAgent = {
    val allkeys = request.headers.keys
    val user = auth.Cookie.getUser(request)
    UserAgent(
      None,
      request.remoteAddress,
      "",
      "",
      "",
      new DateTime(),
      user)
  }
}
