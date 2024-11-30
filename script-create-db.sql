-- Crear la base de datos
CREATE DATABASE SalesManagement;

-- Usar la base de datos
USE SalesManagement;

-- Crear tabla Supervisor
CREATE TABLE Supervisor (
    SupervisorID INT PRIMARY KEY,
    SupervisorName VARCHAR(100)
);

-- Crear tabla Seller
CREATE TABLE Seller (
    SellerID INT PRIMARY KEY,
    SupervisorID INT,
    SellerName VARCHAR(100),
    FOREIGN KEY (SupervisorID) REFERENCES Supervisor(SupervisorID)
);

-- Crear tabla Country
CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(100)
);

-- Crear tabla Sector
CREATE TABLE Sector (
    SectorID INT PRIMARY KEY,
    SectorDescription VARCHAR(100)
);

-- Crear tabla Soda
CREATE TABLE Soda (
    SodaID INT PRIMARY KEY,
    SodaName VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Crear tabla Invoice con los nuevos campos
CREATE TABLE Invoice (
    InvoiceID INT IDENTITY(1,1) PRIMARY KEY, -- Identificador �nico autoincremental
    Series INT, -- Serie de la factura
    Number INT, -- N�mero de la factura
    InvoiceDate DATE, -- Fecha de la factura
    CountryID INT, -- C�digo Pa�s
    SellerID INT, -- C�digo Vendedor
    SodaID INT, -- C�digo Gaseosa
    SectorID INT, -- C�digo Sector
    Budget DECIMAL(12, 5), -- Ppto (presupuesto)
    Quantity DECIMAL(12, 5), -- Cantidad
    Waste DECIMAL(12, 5), -- Merma
    Subtotal DECIMAL(12, 5), -- Subtotal
    IGV DECIMAL(12, 2), -- Impuesto General a las Ventas
    Total DECIMAL(12, 2), -- Total
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID),
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID),
    FOREIGN KEY (SodaID) REFERENCES Soda(SodaID),
    FOREIGN KEY (SectorID) REFERENCES Sector(SectorID)
);