CREATE VIEW hospitals_analysis AS
SELECT 
    hospital_name, 
    hg.city, 
    hg.state, 
    county_name, 
    hospital_type, 
    hospital_ownership, 
    emergency_services, 
    beds, 
    trauma, 
    mortality_national_comparison, 
    hospital_overall_rating::NUMERIC(3,1) as rating
FROM hospital_general hg
JOIN hospital_locations hl ON hg.hospital_name = hl.name
WHERE hospital_overall_rating IS NOT NULL 