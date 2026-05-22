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
        flights_between_31_and_60_minutes_late_percent / 100 as flights_late_31_to_60_mins,
        flights_between_61_and_120_minutes_late_percent / 100 as flights_late_61_to_120_mins,
        flights_between_121_and_180_minutes_late_percent / 100 as flights_late_121_to_180_mins,
        flights_between_181_and_360_minutes_late_percent / 100 as flights_late_181_to_360_mins,
        flights_more_than_360_minutes_late_percent / 100 as flights_late_gt_360_mins,
        flights_cancelled_percent / 100 as flights_cancelled,
        average_delay_mins,
        previous_year_month_early_to_15_mins_late_percent / 100 as previous_yr_mth_lt_15_mins_late,
        previous_year_month_average_delay as previous_yr_mth_avg_delay
    

    from {{ source('aviation_data', 'RawData') }}

    where reporting_airport is NOT NULL
)

select * from source_data