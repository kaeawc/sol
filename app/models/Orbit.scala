package models

import play.api.libs.json._
import play.api.libs.json.Json._

case class Orbit(
  id:Option[Long],
  closeness:Float,
  GM:String,
  spec_B:String,
  full_name:String,
  moid:Float,
  neo:String,
  pha:String,
  diameter:String,
  dv:Float,
  a:Float,
  e:Float,
  q:Float,
  prov_des:String,
  w:Float,
  i:Float,
  om:Float,
  ma:Float,
  n:Float,
  epoch:Float,
  tp:Float,
  per:Float
)

object Orbit {

  def validate(request:Orbit):Boolean = true
}