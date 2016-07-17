class Api::V1::WifispotsController < ApplicationController

  DISTANCE_CONSTANT = 500
  COUNT_CONSTANT = 5
  NAME = "name_jp"
  ADDRESS = "address_jp"
  DISTANCE_DEF = "(
      1000 * 3959 * acos (
      cos ( radians(?) )
      * cos( radians(y_coord) )
      * cos( radians(x_coord) - radians(?) )
      + sin ( radians(?) )
      * sin( radians(y_coord) )
    ) 
    ) as distance"

  def index

  end

  def by_gps

    (x_coord = params[:x_coord].to_f) rescue nil
    (y_coord = params[:y_coord].to_f) rescue nil

    if x_coord != nil and y_coord != nil

      (temp_distance = Integer(params[:distance])) rescue nil
      (temp_count = Integer(params[:count])) rescue nil

      name, address = set_lang(params[:lang])

      distance = set_distance(temp_distance)

      count = set_count(temp_count)

      query_string = "select #{name}, #{address}, #{DISTANCE_DEF}, y_coord, x_coord from wifispots having distance <= ? order by distance ASC limit ? "

      args = [query_string, y_coord, x_coord, y_coord, distance, count]

      wifispots = exec_sql_query(args)

      render json: wifispots
    end

  end

  def search

    search_string = params[:s]

    if search_string != ""

      (temp_count = Integer(params[:count])) rescue nil

      name, address = set_lang(params[:lang])

      count = set_count(temp_count)
      query_string = "select #{name}, #{address}, y_coord, x_coord from wifispots where #{name} like CONCAT('%', ?, '%') or #{address} like CONCAT('%', ?, '%') limit ? "
      
      args = [query_string, search_string, search_string, count]

      wifispots = exec_sql_query(args)

      render json: wifispots
    end
  end

  def exec_sql_query(args)
    sql = ActiveRecord::Base.send(:sanitize_sql_array, args)
    results = ActiveRecord::Base.connection.select_all(sql)
    return results
  end

  def set_lang(lang)
    if lang == 'en'
      return "name_en", "address_en"
    else
      return NAME, ADDRESS
    end
  end

  def set_distance(distance)
    if distance == nil or distance < 0
      distance = DISTANCE_CONSTANT
    end

    return distance
  end

  def set_count(count)
    if count == nil or count < 0
      count = COUNT_CONSTANT
    end

    return count
  end

end
