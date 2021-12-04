CREATE TABLE company(
    company_id INT PRIMARY KEY,
    company_name VARCHAR(70),
    company_location VARCHAR(100)

);

CREATE TABLE brand(
    br_id INT PRIMARY KEY,
    name VARCHAR(70),
     company_id INT,
    FOREIGN KEY(company_id)
                  references company
);


CREATE TABLE model(
    mod_id INT PRIMARY KEY,
    name VARCHAR(50),
    m_year INT NOT NULL,
    equipment VARCHAR(100)
);

CREATE TABLE options(
    opt_id INT PRIMARY KEY,
    color VARCHAR(40),
    engine INT NOT NULL,
    transmissions VARCHAR(40),
    mod_id INT,
    FOREIGN KEY(mod_id)
                  references model


);

CREATE TABLE vehicle(
    VIN INT PRIMARY KEY,
    br_id INT,
    FOREIGN KEY(br_id)
                  references brand,
    mod_id INT,
    FOREIGN KEY(mod_id)
                  references model

);

CREATE TABLE dealer(
    deal_id INT PRIMARY KEY,
    d_name VARCHAR(70),
    d_location VARCHAR(70)

);

CREATE TABLE customer(
    cus_id INT PRIMARY KEY,
    cus_name VARCHAR(70),
    address VARCHAR(70),
    phone VARCHAR(50),
    company_id INT,
    FOREIGN KEY(company_id)
                  references company

);

CREATE TABLE suppliers(
    sup_id INT PRIMARY KEY,
    sup_name VARCHAR(70),
    mod_id INT,
    FOREIGN KEY(mod_id)
                  references model,
    opt_id INT,
    FOREIGN KEY(opt_id)
                  references options
);

CREATE TABLE details(
    det_id INT PRIMARY KEY,
    det_name VARCHAR(70),
    mod_id INT,
    FOREIGN KEY(mod_id)
                  references options

);



