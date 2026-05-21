with source_data as 

( 
    SELECT
        reporting_period as reporting_year,
        reporting_airport,
        origin_destination_country,
        origin_destination,
        airline_name,
        scheduled_charter as scheduled_or_chartered,
        number_flights_matched as number_of_flights,
        number_flights_cancelled as number_of_flights_cancelled,
        flights_more_than_15_minutes_early_percent / 100 as flights_early_gt_15_mins,
        flights_15_minutes_early_to_1_minute_early_percent / 100 as flights_early_lt_15_mins,
        flights_0_to_15_minutes_late_percent / 100 as flights_late_lt_15_mins,
        flights_between_16_and_30_minutes_late_percent / 100 as flights_late_15_to_30_mins,
        flights_between_31_and_60_minutes_late_percent / 100 as flights_late_31_to_60_mins

    

    from {{ source('aviation_data', 'RawData') }}

)

select * from source_data