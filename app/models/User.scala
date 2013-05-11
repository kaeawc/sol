package models

import play.api.libs.json._
import play.api.libs.json.Json._
import play.api.libs.functional.syntax._
import org.joda.time.DateTime

case class User(
	id:Long,
	name:String,
	email:String,
	role:String,
	last:DateTime
) {
	def owns(content:Long,kind:String):Boolean = User.owns(this,content,kind)

	def leads[Group](group:Group):Boolean = User.leads(this,group)

	def in[Group](group:Group):Boolean = User.in[Group](this,group)
}

object User extends Function5[Long,String,String,String,DateTime,User] {

	implicit val r = Json.reads[User]
	implicit val w = Json.writes[User]

	def parse(json:String):User = {
		if(json == "") throw new Exception("Can't parse a User from an empty JSON string.")
		Json.fromJson(Json.parse(json)).get
	}

	def toJson(user:User):String = {
		Json.stringify(Json.toJson(user))
	}

	def owns(user:User,content:Long,kind:String):Boolean = true

	def leads[Group](user:User,group:Group):Boolean = true

	def in[Group](user:User,group:Group):Boolean = true

  def getByUsername(username:String):Option[User] = {
    Option(User(1,"LOL","thatguy@zog.boom","Average Joe",new DateTime()))
  }
  
}
