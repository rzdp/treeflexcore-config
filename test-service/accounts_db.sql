CREATE TABLE member
(
    id            BIGSERIAL   NOT NULL,
    customer_id   UUID        NOT NULL,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    created_by    VARCHAR(50) NOT NULL,
    created_date  TIMESTAMP   NOT NULL DEFAULT current_timestamp,
    modified_by   VARCHAR(50) NOT NULL,
    modified_date TIMESTAMP   NOT NULL DEFAULT current_timestamp,

    PRIMARY KEY (id),
    UNIQUE (customer_id)
);
