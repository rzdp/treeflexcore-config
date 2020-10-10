CREATE TABLE oauth_client_details
(
    client_id               VARCHAR(256) NOT NULL,
    client_secret           VARCHAR(256) NOT NULL,
    resource_ids            VARCHAR(256),
    scope                   VARCHAR(256),
    authorities             VARCHAR(256),
    authorized_grant_types  VARCHAR(256),
    web_server_redirect_uri VARCHAR(256),
    access_token_validity   INTEGER,
    refresh_token_validity  INTEGER,
    additional_information  VARCHAR(4096),
    autoapprove             VARCHAR(256),

    PRIMARY KEY (client_id)
);

INSERT INTO oauth_client_details (client_id, client_secret, resource_ids, scope, authorities, authorized_grant_types,
                                  web_server_redirect_uri, access_token_validity, refresh_token_validity,
                                  additional_information, autoapprove)
VALUES ('treeflexhr', '$2y$10$uqtCmoR8td.IoojoXPAhGeE0.Wv8KNRxXeVvzOXSz5hmNOY2WqWXu', 'treeflexhr', 'read,write', '',
        'password,access_token,refresh_token,authorization_code', 'http://localhost:8080/login', 3600, 1800, '', '');

INSERT INTO oauth_client_details (client_id, client_secret, resource_ids, scope, authorities, authorized_grant_types,
                                  web_server_redirect_uri, access_token_validity, refresh_token_validity,
                                  additional_information, autoapprove)
VALUES ('treeflextk', '$2y$10$oBK20xca5we1cACopJeKaOGu8bHrSG8s2P7GVtX56xjqZOkR6up.m', 'treeflextk', 'read,write', '',
        'password,access_token,refresh_token,authorization_code', 'http://localhost:8080/login', 3600, 1800, '', '');


CREATE TABLE customer
(
    id                      BIGSERIAL    NOT NULL,
    customer_id             UUID         NOT NULL,
    username                VARCHAR(256) NOT NULL,
    email                   VARCHAR(256) NOT NULL,
    password                VARCHAR(256) NOT NULL,
    enabled                 BOOLEAN      NOT NULL,
    account_expired     BOOLEAN      NOT NULL,
    account_locked      BOOLEAN      NOT NULL,
    credentials_expired BOOLEAN      NOT NULL,
    created_by              VARCHAR(50)  NOT NULL,
    created_date            TIMESTAMP    NOT NULL DEFAULT current_timestamp,
    modified_by             VARCHAR(50)  NOT NULL,
    modified_date           TIMESTAMP    NOT NULL DEFAULT current_timestamp,

    PRIMARY KEY (id),
    UNIQUE (customer_id),
    UNIQUE (username),
    UNIQUE (email)
);

INSERT INTO customer (customer_id, username, email, password, enabled, account_expired, account_locked,
                      credentials_expired, created_by, created_date, modified_by, modified_date)
VALUES ('15497112-140d-4095-af5d-1653ba13da03', 'rzdp', 'rzdp97@gmail.com',
        '$2y$10$qYgi6uYUcLANfBDKYVhUYegNHUS8oQeraXRUBcKIBb34jPfHZYNyS', true, false, false, false, 'TREEFLEXCORE',
        current_timestamp, 'TREEFLEXCORE', current_timestamp);

INSERT INTO customer (customer_id, username, email, password, enabled, account_expired, account_locked,
                      credentials_expired, created_by, created_date, modified_by, modified_date)
VALUES ('b7f9a5a2-9ded-4122-a9eb-0006e1da9dc1', 'gringo', 'gringo91@gmail.com',
        '$2y$10$z653Rv4l.TPPdkyVC4a2G.cI73zR.koPRkQGxFt1E0YrRiMtKpdQq', true, false, false, false, 'TREEFLEXCORE',
        current_timestamp, 'TREEFLEXCORE', current_timestamp);

CREATE TABLE role
(
    id            BIGSERIAL   NOT NULL,
    name          VARCHAR(50) NOT NULL,
    created_by    VARCHAR(50) NOT NULL,
    created_date  TIMESTAMP   NOT NULL DEFAULT current_timestamp,
    modified_by   VARCHAR(50) NOT NULL,
    modified_date TIMESTAMP   NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (id),
    UNIQUE (name)
);

INSERT INTO role (name, created_by, created_date, modified_by, modified_date)
VALUES ('ROLE_CORE_ADMIN', 'TREEFLEXCORE', current_timestamp, 'TREEFLEXCORE', current_timestamp);

INSERT INTO role (name, created_by, created_date, modified_by, modified_date)
VALUES ('ROLE_ADMIN', 'TREEFLEXCORE', current_timestamp, 'TREEFLEXCORE', current_timestamp);

INSERT INTO role (name, created_by, created_date, modified_by, modified_date)
VALUES ('ROLE_USER', 'TREEFLEXCORE', current_timestamp, 'TREEFLEXCORE', current_timestamp);

CREATE TABLE permission
(
    id            BIGSERIAL   NOT NULL,
    name          VARCHAR(50) NOT NULL,
    created_by    VARCHAR(50) NOT NULL,
    created_date  TIMESTAMP   NOT NULL DEFAULT current_timestamp,
    modified_by   VARCHAR(50) NOT NULL,
    modified_date TIMESTAMP   NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (id),
    UNIQUE (name)
);

INSERT INTO permission (name, created_by, created_date, modified_by, modified_date)
VALUES ('CAN_CREATE_PRODUCT', 'TREEFLEXCORE', current_timestamp, 'TREEFLEXCORE', current_timestamp);
INSERT INTO permission (name, created_by, created_date, modified_by, modified_date)
VALUES ('CAN_READ_PRODUCT', 'TREEFLEXCORE', current_timestamp, 'TREEFLEXCORE', current_timestamp);
INSERT INTO permission (name, created_by, created_date, modified_by, modified_date)
VALUES ('CAN_UPDATE_PRODUCT', 'TREEFLEXCORE', current_timestamp, 'TREEFLEXCORE', current_timestamp);
INSERT INTO permission (name, created_by, created_date, modified_by, modified_date)
VALUES ('CAN_DELETE_PRODUCT', 'TREEFLEXCORE', current_timestamp, 'TREEFLEXCORE', current_timestamp);




CREATE TABLE customer_role
(
    customer_id BIGINT NOT NULL,
    role_id     BIGINT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (role_id) REFERENCES role (id)
);

INSERT INTO customer_role (customer_id, role_id)
VALUES (1, 1);

INSERT INTO customer_role (customer_id, role_id)
VALUES (2, 2);

CREATE TABLE role_permission
(
    role_id       BIGINT NOT NULL,
    permission_id BIGINT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES role (id),
    FOREIGN KEY (permission_id) REFERENCES permission (id)
);

INSERT INTO role_permission (role_id, permission_id)
VALUES (1, 1);
INSERT INTO role_permission (role_id, permission_id)
VALUES (1, 2);
INSERT INTO role_permission (role_id, permission_id)
VALUES (1, 3);
INSERT INTO role_permission (role_id, permission_id)
VALUES (1, 4);
INSERT INTO role_permission (role_id, permission_id)
VALUES (2, 2);