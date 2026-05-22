with staging as (

    select *
    from {{ ref('stg_aviation_model') }}
),

metrics as (

    select 
        *,

        --operational metrics
        flights_late_lt_15_mins + flights_early_lt_15_mins 
        as on_time_rate,

        flights_cancelled 
        as cancellation_rate,

        (
            (flights_late_15_to_30_mins * 1)
            + (flights_late_31_to_60_mins * 2)
            + (flights_late_61_to_120_mins * 3)
            + (flights_late_121_to_180_mins * 4)
            + (flights_late_181_to_360_mins * 5)
            + (flights_late_gt_360_mins * 6)
        )
        as delay_severity_score
    
    from staging
)

select * from metrics