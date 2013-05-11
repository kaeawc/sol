package models

import play.api.libs.json._
import play.api.libs.json.Json._

case class Asteriod(
  id:Option[Long],
  // orbit:Orbit,
  score:BigDecimal,
  saved:BigDecimal,
  price:BigDecimal,
  profit:BigDecimal,
  full_name:String,
  diameter:String,
  inexact:Boolean,
  prov_des:String,
  epoch:BigDecimal,
  fuzzed_price:Option[BigDecimal]
)

object Asteriod {

  def validate(request:Asteriod):Boolean = true
}