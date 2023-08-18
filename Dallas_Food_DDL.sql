/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Dallas_Food_Inspection.DM1
 *
 * Date Created : Tuesday, July 25, 2023 01:14:33
 * Target DBMS : Microsoft SQL Server 2019
 */

USE Dallas_Food_Inspection
go
/* 
 * TABLE: Dim_Address 
 */

CREATE TABLE Dim_Address(
    AddressSK              int              NOT NULL,
    StreetDirectionSK      int              NOT NULL,
    StreetTypeSK           int              NOT NULL,
    StreetUnit             varchar(10)      NULL,
    StreetAddress          varchar(50)      NULL,
    ZIPCODE                int              NULL,
    Lat_Long_Location      varchar(70)      NULL,
    StreetName             varchar(20)      NULL,
    StreetNumber           int              NULL,
    DI_CreateDate          nvarchar(256)    NULL,
    DI_WorkflowFileName    nvarchar(256)    NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (AddressSK)
)

go


IF OBJECT_ID('Dim_Address') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Address >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Address >>>'
go

/* 
 * TABLE: Dim_InspectionDate 
 */

CREATE TABLE Dim_InspectionDate(
    InspectionDateSK       int              NOT NULL,
    InspectionDate         date             NULL,
    InspectionMonth        varchar(15)      NULL,
    InspectionYear         varchar(10)      NULL,
    DI_CreateDate          nvarchar(256)    NULL,
    DI_WorkflowFileName    nvarchar(256)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (InspectionDateSK)
)

go


IF OBJECT_ID('Dim_InspectionDate') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_InspectionDate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_InspectionDate >>>'
go

/* 
 * TABLE: Dim_InspectionType 
 */

CREATE TABLE Dim_InspectionType(
    InspectionTypeSK       int              NOT NULL,
    InspectionType         varchar(20)      NULL,
    DI_CreateDate          nvarchar(256)    NULL,
    DI_WorkflowFileName    nvarchar(256)    NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (InspectionTypeSK)
)

go


IF OBJECT_ID('Dim_InspectionType') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_InspectionType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_InspectionType >>>'
go

/* 
 * TABLE: Dim_StreetDirection 
 */

CREATE TABLE Dim_StreetDirection(
    StreetDirectionSK      int              NOT NULL,
    Street_Direction       varchar(10)      NULL,
    DI_CreateDate          nvarchar(256)    NULL,
    DI_WorkflowFileName    nvarchar(256)    NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (StreetDirectionSK)
)

go


IF OBJECT_ID('Dim_StreetDirection') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_StreetDirection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_StreetDirection >>>'
go

/* 
 * TABLE: Dim_StreetType 
 */

CREATE TABLE Dim_StreetType(
    StreetTypeSK           int              NOT NULL,
    StreetType             varchar(10)      NULL,
    DI_CreateDate          nvarchar(256)    NULL,
    DI_WorkflowFileName    nvarchar(256)    NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (StreetTypeSK)
)

go


IF OBJECT_ID('Dim_StreetType') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_StreetType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_StreetType >>>'
go

/* 
 * TABLE: Dim_ViolationDescription 
 */

CREATE TABLE Dim_ViolationDescription(
    ViolationDiscriptionSK    int              NOT NULL,
    ViolationDescription      varchar(100)     NULL,
    ViolationPoints           int              NULL,
    ViolationDetail           varchar(300)     NULL,
    DI_CreateDate             nvarchar(256)    NULL,
    DI_WorkflowFileName       nvarchar(256)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (ViolationDiscriptionSK)
)

go


IF OBJECT_ID('Dim_ViolationDescription') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_ViolationDescription >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_ViolationDescription >>>'
go

/* 
 * TABLE: Dim_ViolationMemo 
 */

CREATE TABLE Dim_ViolationMemo(
    ViolationMemoSK        int              NOT NULL,
    ViolationMemo          varchar(50)      NULL,
    DI_CreateDate          nvarchar(256)    NULL,
    DI_WorkflowFileName    nvarchar(256)    NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (ViolationMemoSK)
)

go


IF OBJECT_ID('Dim_ViolationMemo') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_ViolationMemo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_ViolationMemo >>>'
go

/* 
 * TABLE: Fact_Inspection 
 */

CREATE TABLE Fact_Inspection(
    InspectionSK           int              NOT NULL,
    InspectionDateSK       int              NOT NULL,
    InspectionTypeSK       int              NOT NULL,
    RestaurantNameSK       int              NOT NULL,
    AddressSK              int              NOT NULL,
    InspectionScore        int              NULL,
    DI_CreateDate          nvarchar(256)    NULL,
    DI_WorkflowFileName    nvarchar(256)    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (InspectionSK)
)

go


IF OBJECT_ID('Fact_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Inspection >>>'
go

/* 
 * TABLE: Fact_Violations 
 */

CREATE TABLE Fact_Violations(
    ViolationSK               int              NOT NULL,
    InspectionSK              int              NOT NULL,
    ViolationDiscriptionSK    int              NOT NULL,
    ViolationMemoSK           int              NOT NULL,
    DI_CreateDate             nvarchar(256)    NULL,
    DI_WorkflowFileName       nvarchar(256)    NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (ViolationSK)
)

go


IF OBJECT_ID('Fact_Violations') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Violations >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Violations >>>'
go

/* 
 * TABLE: RestaurantName 
 */

CREATE TABLE RestaurantName(
    RestaurantNameSK       int              NOT NULL,
    RestaurantName         varchar(30)      NULL,
    DI_CreateDate          nvarchar(256)    NULL,
    DI_WorkflowFileName    nvarchar(256)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (RestaurantNameSK)
)

go


IF OBJECT_ID('RestaurantName') IS NOT NULL
    PRINT '<<< CREATED TABLE RestaurantName >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RestaurantName >>>'
go

/* 
 * TABLE: Dim_Address 
 */

ALTER TABLE Dim_Address ADD CONSTRAINT RefDim_StreetDirection6 
    FOREIGN KEY (StreetDirectionSK)
    REFERENCES Dim_StreetDirection(StreetDirectionSK)
go

ALTER TABLE Dim_Address ADD CONSTRAINT RefDim_StreetType7 
    FOREIGN KEY (StreetTypeSK)
    REFERENCES Dim_StreetType(StreetTypeSK)
go


/* 
 * TABLE: Fact_Inspection 
 */

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_InspectionDate4 
    FOREIGN KEY (InspectionDateSK)
    REFERENCES Dim_InspectionDate(InspectionDateSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_InspectionType5 
    FOREIGN KEY (InspectionTypeSK)
    REFERENCES Dim_InspectionType(InspectionTypeSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefRestaurantName8 
    FOREIGN KEY (RestaurantNameSK)
    REFERENCES RestaurantName(RestaurantNameSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Address9 
    FOREIGN KEY (AddressSK)
    REFERENCES Dim_Address(AddressSK)
go


/* 
 * TABLE: Fact_Violations 
 */

ALTER TABLE Fact_Violations ADD CONSTRAINT RefFact_Inspection1 
    FOREIGN KEY (InspectionSK)
    REFERENCES Fact_Inspection(InspectionSK)
go

ALTER TABLE Fact_Violations ADD CONSTRAINT RefDim_ViolationDescription2 
    FOREIGN KEY (ViolationDiscriptionSK)
    REFERENCES Dim_ViolationDescription(ViolationDiscriptionSK)
go

ALTER TABLE Fact_Violations ADD CONSTRAINT RefDim_ViolationMemo3 
    FOREIGN KEY (ViolationMemoSK)
    REFERENCES Dim_ViolationMemo(ViolationMemoSK)
go


