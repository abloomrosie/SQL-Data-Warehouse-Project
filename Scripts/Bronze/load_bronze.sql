CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    batch_start_time TIMESTAMP;
    batch_end_time TIMESTAMP;
    row_count BIGINT;
BEGIN
    batch_start_time := NOW();

    RAISE NOTICE '================================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '================================================';

    RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '------------------------------------------------';

    -- CRM: cust_info
    start_time := NOW();
    RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
    TRUNCATE TABLE bronze.crm_cust_info;
    RAISE NOTICE '>> Copying Data Into: bronze.crm_cust_info';
    COPY bronze.crm_cust_info
    FROM '/data/source_crm/cust_info.csv'
    DELIMITER ',' CSV HEADER;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    end_time := NOW();
    RAISE NOTICE 'Inserted % rows into bronze.crm_cust_info', row_count;
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));

    -- CRM: prd_info
    start_time := NOW();
    TRUNCATE TABLE bronze.crm_prd_info;
    RAISE NOTICE '>> Copying Data Into: bronze.crm_prd_info';
    COPY bronze.crm_prd_info
    FROM '/data/source_crm/prd_info.csv'
    DELIMITER ',' CSV HEADER;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    end_time := NOW();
    RAISE NOTICE 'Inserted % rows into bronze.crm_prd_info', row_count;
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));

    -- CRM: sales_details
    start_time := NOW();
    TRUNCATE TABLE bronze.crm_sales_details;
    RAISE NOTICE '>> Copying Data Into: bronze.crm_sales_details';
    COPY bronze.crm_sales_details
    FROM '/data/source_crm/sales_details.csv'
    DELIMITER ',' CSV HEADER;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    end_time := NOW();
    RAISE NOTICE 'Inserted % rows into bronze.crm_sales_details', row_count;
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));

        RAISE NOTICE '------------------------------------------------';
    RAISE NOTICE 'Loading ERP Tables';
    RAISE NOTICE '------------------------------------------------';

    -- ERP: LOC_A101
    start_time := NOW();
    TRUNCATE TABLE bronze.erp_loc_a101;
    RAISE NOTICE '>> Copying Data Into: bronze.erp_loc_a101';
    COPY bronze.erp_loc_a101
    FROM '/data/source_erp/LOC_A101.csv'
    DELIMITER ',' CSV HEADER;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    end_time := NOW();
    RAISE NOTICE 'Inserted % rows into bronze.erp_loc_a101', row_count;
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));

    -- ERP: CUST_AZ12
    start_time := NOW();
    TRUNCATE TABLE bronze.erp_cust_az12;
    RAISE NOTICE '>> Copying Data Into: bronze.erp_cust_az12';
    COPY bronze.erp_cust_az12
    FROM '/data/source_erp/CUST_AZ12.csv'
    DELIMITER ',' CSV HEADER;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    end_time := NOW();
    RAISE NOTICE 'Inserted % rows into bronze.erp_cust_az12', row_count;
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));

    -- ERP: PX_CAT_G1V2
    start_time := NOW();
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    RAISE NOTICE '>> Copying Data Into: bronze.erp_px_cat_g1v2';
    COPY bronze.erp_px_cat_g1v2
    FROM '/data/source_erp/PX_CAT_G1V2.csv'
    DELIMITER ',' CSV HEADER;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    end_time := NOW();
    RAISE NOTICE 'Inserted % rows into bronze.erp_px_cat_g1v2', row_count;
    RAISE NOTICE '>> Load Duration: % seconds', EXTRACT(EPOCH FROM (end_time - start_time));


EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '==========================================';
        RAISE NOTICE 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        RAISE NOTICE 'Error message: %', SQLERRM;
        RAISE NOTICE '==========================================';
END;
$$;

-- Run it:
CALL bronze.load_bronze();

