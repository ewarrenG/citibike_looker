view: citibike_trips {
  sql_table_name: citibike_trips.citibike_trips ;;

  dimension: bikeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bikeid ;;
  }

  dimension: birth_year {
    type: number
    sql: ${TABLE}.birth_year ;;
  }

  dimension: customer_plan {
    type: string
    sql: ${TABLE}.customer_plan ;;
  }

  dimension: end_station_id {
    type: number
    sql: ${TABLE}.end_station_id ;;
  }

  dimension: end_station_latitude {
    type: number
    sql: ${TABLE}.end_station_latitude ;;
  }

  dimension: end_station_longitude {
    type: number
    sql: ${TABLE}.end_station_longitude ;;
  }

  dimension: end_station_name {
    type: string
    sql: ${TABLE}.end_station_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: start_station_id {
    type: number
    sql: ${TABLE}.start_station_id ;;
  }

  dimension: start_station_latitude {
    type: number
    sql: ${TABLE}.start_station_latitude ;;
  }

  dimension: start_station_longitude {
    type: number
    sql: ${TABLE}.start_station_longitude ;;
  }

  dimension: start_station_name {
    type: string
    sql: ${TABLE}.start_station_name ;;
  }

  dimension_group: starttime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.starttime AS TIMESTAMP) ;;
  }

  dimension_group: stoptime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.stoptime AS TIMESTAMP) ;;
  }

  dimension: tripduration {
    type: number
    sql: ${TABLE}.tripduration ;;
  }

  dimension: usertype {
    type: string
    sql: ${TABLE}.usertype ;;
  }

  #start of dimensions
  #created by eg
  dimension: start_end_station_same {
    type: yesno
    sql:   ${start_station_id} = ${end_station_id};;
  }

  dimension: location_start  {
    type:  location
    sql_latitude: ${start_station_latitude} ;;
    sql_longitude: ${start_station_longitude} ;;
  }

  dimension: location_end  {
    type:  location
    sql_latitude: ${end_station_latitude} ;;
    sql_longitude: ${end_station_longitude} ;;
  }

  measure: count {
    type: count
    drill_fields: [start_station_name, end_station_name]
  }

  #start of measures
  #created by eg
  measure: avg_tripduration {
    value_format_name: decimal_1
    type: average
    sql:  ${tripduration} ;;
  }

}
