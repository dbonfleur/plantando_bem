BEGIN TRANSACTION;
CREATE TABLE "AspNetRoleClaims" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY AUTOINCREMENT,
    "RoleId" TEXT NOT NULL,
    "ClaimType" TEXT NULL,
    "ClaimValue" TEXT NULL,
    CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE
);
CREATE TABLE "AspNetRoles" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_AspNetRoles" PRIMARY KEY,
    "Name" TEXT NULL,
    "NormalizedName" TEXT NULL,
    "ConcurrencyStamp" TEXT NULL
);
CREATE TABLE "AspNetUserClaims" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY AUTOINCREMENT,
    "UserId" TEXT NOT NULL,
    "ClaimType" TEXT NULL,
    "ClaimValue" TEXT NULL,
    CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
);
CREATE TABLE "AspNetUserLogins" (
    "LoginProvider" TEXT NOT NULL,
    "ProviderKey" TEXT NOT NULL,
    "ProviderDisplayName" TEXT NULL,
    "UserId" TEXT NOT NULL,
    CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey"),
    CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
);
CREATE TABLE "AspNetUserRoles" (
    "UserId" TEXT NOT NULL,
    "RoleId" TEXT NOT NULL,
    CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId"),
    CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
);
CREATE TABLE "AspNetUserTokens" (
    "UserId" TEXT NOT NULL,
    "LoginProvider" TEXT NOT NULL,
    "Name" TEXT NOT NULL,
    "Value" TEXT NULL,
    CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name"),
    CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE
);
CREATE TABLE "AspNetUsers" (
    "Id" TEXT NOT NULL CONSTRAINT "PK_AspNetUsers" PRIMARY KEY,
    "UserName" TEXT NULL,
    "NormalizedUserName" TEXT NULL,
    "Email" TEXT NULL,
    "NormalizedEmail" TEXT NULL,
    "EmailConfirmed" INTEGER NOT NULL,
    "PasswordHash" TEXT NULL,
    "SecurityStamp" TEXT NULL,
    "ConcurrencyStamp" TEXT NULL,
    "PhoneNumber" TEXT NULL,
    "PhoneNumberConfirmed" INTEGER NOT NULL,
    "TwoFactorEnabled" INTEGER NOT NULL,
    "LockoutEnd" TEXT NULL,
    "LockoutEnabled" INTEGER NOT NULL,
    "AccessFailedCount" INTEGER NOT NULL
);
INSERT INTO "AspNetUsers" VALUES('f9717b99-9769-4545-b397-fbb6a032c383','Daniel','DANIEL','danibonfleur@hotmail.com','DANIBONFLEUR@HOTMAIL.COM',1,'AQAAAAIAAYagAAAAEP9tbacafc+KKMLTDYGB3gOpKA25jlx/k/jTlnu/sSfGo+9Hv9urL4ODH0P26EvhQw==','DSRCG4XVOXPLRKKMSZ6B3LYQCXBJVMED','ab133414-d5bb-41fe-ac74-5902a25325c4',NULL,0,0,NULL,1,0);
CREATE TABLE "Cidade" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Cidade" PRIMARY KEY AUTOINCREMENT,
    "Nome" TEXT NULL,
    "IdMicrorregiao" INTEGER NULL,
    "IdRegiaoImediata" INTEGER NULL,
    CONSTRAINT "FK_Cidade_Microrregiao_IdMicrorregiao" FOREIGN KEY ("IdMicrorregiao") REFERENCES "Microrregiao" ("Id"),
    CONSTRAINT "FK_Cidade_RegiaoImediata_IdRegiaoImediata" FOREIGN KEY ("IdRegiaoImediata") REFERENCES "RegiaoImediata" ("Id")
);
INSERT INTO "Cidade" VALUES(4116059,'Missal',41024,410007);
CREATE TABLE "DiasPlanta" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_DiasPlanta" PRIMARY KEY AUTOINCREMENT,
    "DiaMin" INTEGER NULL,
    "DiaMax" INTEGER NULL
);
INSERT INTO "DiasPlanta" VALUES(1,90,120);
INSERT INTO "DiasPlanta" VALUES(2,45,60);
INSERT INTO "DiasPlanta" VALUES(3,60,70);
INSERT INTO "DiasPlanta" VALUES(4,180,200);
INSERT INTO "DiasPlanta" VALUES(5,60,80);
INSERT INTO "DiasPlanta" VALUES(6,150,180);
INSERT INTO "DiasPlanta" VALUES(7,120,150);
INSERT INTO "DiasPlanta" VALUES(8,100,120);
INSERT INTO "DiasPlanta" VALUES(9,90,100);
INSERT INTO "DiasPlanta" VALUES(10,120,180);
INSERT INTO "DiasPlanta" VALUES(11,80,100);
INSERT INTO "DiasPlanta" VALUES(12,90,110);
INSERT INTO "DiasPlanta" VALUES(13,50,60);
INSERT INTO "DiasPlanta" VALUES(14,80,90);
INSERT INTO "DiasPlanta" VALUES(15,100,110);
INSERT INTO "DiasPlanta" VALUES(16,240,300);
INSERT INTO "DiasPlanta" VALUES(17,300,360);
INSERT INTO "DiasPlanta" VALUES(18,85,90);
INSERT INTO "DiasPlanta" VALUES(19,80,120);
INSERT INTO "DiasPlanta" VALUES(20,80,110);
INSERT INTO "DiasPlanta" VALUES(21,70,80);
INSERT INTO "DiasPlanta" VALUES(22,45,50);
INSERT INTO "DiasPlanta" VALUES(23,25,30);
INSERT INTO "DiasPlanta" VALUES(24,40,60);
INSERT INTO "DiasPlanta" VALUES(25,70,100);
CREATE TABLE "EpocaRegiao" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_EpocaRegiao" PRIMARY KEY AUTOINCREMENT,
    "Regiao" TEXT NULL,
    "Meses" TEXT NULL
);
INSERT INTO "EpocaRegiao" VALUES(1,'Sul','OUT./FEV.');
INSERT INTO "EpocaRegiao" VALUES(2,'Sudeste','SET./MAR.');
INSERT INTO "EpocaRegiao" VALUES(3,'Nordeste','MAR./OUT.');
INSERT INTO "EpocaRegiao" VALUES(4,'Centro-Oeste','ANO_TODO');
INSERT INTO "EpocaRegiao" VALUES(5,'Norte','ABR./AGO.');
INSERT INTO "EpocaRegiao" VALUES(6,'Sul','SET./MAIO');
INSERT INTO "EpocaRegiao" VALUES(7,'Sudeste','AGO./MAIO');
INSERT INTO "EpocaRegiao" VALUES(8,'Sul','FEV./JUL.');
INSERT INTO "EpocaRegiao" VALUES(9,'Sudeste','FEV./JUL.');
INSERT INTO "EpocaRegiao" VALUES(10,'Nordeste','*');
INSERT INTO "EpocaRegiao" VALUES(11,'Centro-Oeste','*');
INSERT INTO "EpocaRegiao" VALUES(12,'Norte','ABR./JUN.');
INSERT INTO "EpocaRegiao" VALUES(13,'Sul','FEV./OUT.');
INSERT INTO "EpocaRegiao" VALUES(14,'Nordeste','MAR./SET.');
INSERT INTO "EpocaRegiao" VALUES(15,'Centro-Oeste','MAR./JUL.');
INSERT INTO "EpocaRegiao" VALUES(16,'Norte','ABR./JUL.');
INSERT INTO "EpocaRegiao" VALUES(17,'Sul','FEV./MAR.');
INSERT INTO "EpocaRegiao" VALUES(18,'Sudeste','FEV./MAR.');
INSERT INTO "EpocaRegiao" VALUES(19,'Norte','*');
INSERT INTO "EpocaRegiao" VALUES(20,'Centro-Oeste','MAR./SET.');
INSERT INTO "EpocaRegiao" VALUES(21,'Norte','MAR./JUL.');
INSERT INTO "EpocaRegiao" VALUES(22,'Sul','MAIO/JUN.');
INSERT INTO "EpocaRegiao" VALUES(23,'Sudeste','MAR./ABR.');
INSERT INTO "EpocaRegiao" VALUES(24,'Nordeste','MAIO');
INSERT INTO "EpocaRegiao" VALUES(25,'Centro-Oeste','MAR./ABR.');
INSERT INTO "EpocaRegiao" VALUES(26,'Sul','MAR./JUN.');
INSERT INTO "EpocaRegiao" VALUES(27,'Sudeste','MAR./JUN.');
INSERT INTO "EpocaRegiao" VALUES(28,'Nordeste','MAIO/JUN.');
INSERT INTO "EpocaRegiao" VALUES(29,'Centro-Oeste','ABR./JUN.');
INSERT INTO "EpocaRegiao" VALUES(30,'Sudeste','FEV./AGO.');
INSERT INTO "EpocaRegiao" VALUES(31,'Nordeste','FEV./AGO.');
INSERT INTO "EpocaRegiao" VALUES(32,'Centro-Oeste','FEV./AGO.');
INSERT INTO "EpocaRegiao" VALUES(33,'Sul','NOV./DEz.');
INSERT INTO "EpocaRegiao" VALUES(34,'Sudeste','ABR./MAIO');
INSERT INTO "EpocaRegiao" VALUES(35,'Centro-Oeste','ABR./MAIO');
INSERT INTO "EpocaRegiao" VALUES(36,'Sul','OUT/DEz.');
INSERT INTO "EpocaRegiao" VALUES(37,'Sudeste','OUT/DEz.');
INSERT INTO "EpocaRegiao" VALUES(38,'Nordeste','ANO_TODO');
INSERT INTO "EpocaRegiao" VALUES(39,'Centro-Oeste','OUT/DEz.');
INSERT INTO "EpocaRegiao" VALUES(40,'Norte','ANO_TODO');
INSERT INTO "EpocaRegiao" VALUES(41,'Sul','AGO./JAN.');
INSERT INTO "EpocaRegiao" VALUES(42,'Sudeste','AGO./MAR.');
INSERT INTO "EpocaRegiao" VALUES(43,'Centro-Oeste','AGO./FEV.');
INSERT INTO "EpocaRegiao" VALUES(44,'Sul','SET/FEV');
INSERT INTO "EpocaRegiao" VALUES(45,'Sudeste','SET/FEV');
INSERT INTO "EpocaRegiao" VALUES(46,'Nordeste','SET/FEV');
INSERT INTO "EpocaRegiao" VALUES(47,'Sul','ANO_TODO');
INSERT INTO "EpocaRegiao" VALUES(48,'Sudeste','ANO_TODO');
INSERT INTO "EpocaRegiao" VALUES(49,'Nordeste','ABR./AGO.');
INSERT INTO "EpocaRegiao" VALUES(50,'Centro-Oeste','ABR./AGO.');
INSERT INTO "EpocaRegiao" VALUES(51,'Sul','FEV./SET.');
INSERT INTO "EpocaRegiao" VALUES(52,'Centro-Oeste','FEV./MAIO');
INSERT INTO "EpocaRegiao" VALUES(53,'Sul','JUL./AGO.');
INSERT INTO "EpocaRegiao" VALUES(54,'Sudeste','FEV./MAIO');
INSERT INTO "EpocaRegiao" VALUES(55,'Nordeste','FEV./ABR.');
INSERT INTO "EpocaRegiao" VALUES(56,'Norte','FEV./MAIO');
INSERT INTO "EpocaRegiao" VALUES(57,'Nordeste','MAR./');
INSERT INTO "EpocaRegiao" VALUES(58,'Centro-Oeste','JUL.');
INSERT INTO "EpocaRegiao" VALUES(59,'Sul','FEV./AGO.');
INSERT INTO "EpocaRegiao" VALUES(60,'Sudeste','MAR./JUL.');
INSERT INTO "EpocaRegiao" VALUES(61,'Centro-Oeste','ABR./JUL.');
INSERT INTO "EpocaRegiao" VALUES(62,'Norte','MAR./AGO.');
INSERT INTO "EpocaRegiao" VALUES(63,'Sul','SET./OUT.');
INSERT INTO "EpocaRegiao" VALUES(64,'Sudeste','SET./OUT.');
INSERT INTO "EpocaRegiao" VALUES(65,'Centro-Oeste','SET./OUT.');
INSERT INTO "EpocaRegiao" VALUES(66,'Sul','SET./JAN.');
INSERT INTO "EpocaRegiao" VALUES(67,'Sudeste','AGO./FEV.');
INSERT INTO "EpocaRegiao" VALUES(68,'Centro-Oeste','AGO./ABR.');
INSERT INTO "EpocaRegiao" VALUES(69,'Norte','ABR./OUT.');
INSERT INTO "EpocaRegiao" VALUES(70,'Centro-Oeste','FEV./JUL.');
INSERT INTO "EpocaRegiao" VALUES(71,'Nordeste','MAR./MAIO');
INSERT INTO "EpocaRegiao" VALUES(72,'Centro-Oeste','MAR./MAIO');
INSERT INTO "EpocaRegiao" VALUES(73,'Sul','FEV./JUN.');
INSERT INTO "EpocaRegiao" VALUES(74,'Sudeste','FEV./ABR.');
INSERT INTO "EpocaRegiao" VALUES(75,'Nordeste','FEV./JUL.');
INSERT INTO "EpocaRegiao" VALUES(76,'Sul','ABR./MAIO');
INSERT INTO "EpocaRegiao" VALUES(77,'Sul','FEV/SET');
INSERT INTO "EpocaRegiao" VALUES(78,'Sudeste','FEV/SET');
INSERT INTO "EpocaRegiao" VALUES(79,'Nordeste','MAR./AGO.');
INSERT INTO "EpocaRegiao" VALUES(80,'Centro-Oeste','MAR./AGO.');
INSERT INTO "EpocaRegiao" VALUES(81,'Norte','MAR/MAI');
INSERT INTO "EpocaRegiao" VALUES(82,'Sul','SET./MAR.');
INSERT INTO "EpocaRegiao" VALUES(83,'Sul','AGO./DEz.');
INSERT INTO "EpocaRegiao" VALUES(84,'Sudeste','AGO./DEz.');
INSERT INTO "EpocaRegiao" VALUES(85,'Centro-Oeste','AGO./DEz.');
INSERT INTO "EpocaRegiao" VALUES(86,'Sul','JUN./SET.');
INSERT INTO "EpocaRegiao" VALUES(87,'Sudeste','JUN./SET.');
INSERT INTO "EpocaRegiao" VALUES(88,'Nordeste','DEz./JAN.');
INSERT INTO "EpocaRegiao" VALUES(89,'Centro-Oeste','JUL/AGO');
INSERT INTO "EpocaRegiao" VALUES(90,'Norte','JUN./SET.');
INSERT INTO "EpocaRegiao" VALUES(91,'Sul','SET./FEV.');
INSERT INTO "EpocaRegiao" VALUES(92,'Sul','ABRIL/MAIO');
INSERT INTO "EpocaRegiao" VALUES(93,'Sudeste','ABRIL/MAIO');
INSERT INTO "EpocaRegiao" VALUES(94,'Centro-Oeste','ABRIL/MAIO');
INSERT INTO "EpocaRegiao" VALUES(95,'Sudeste','SET./FEV.');
INSERT INTO "EpocaRegiao" VALUES(96,'Centro-Oeste','SET./DEz.');
INSERT INTO "EpocaRegiao" VALUES(97,'Sul','*');
INSERT INTO "EpocaRegiao" VALUES(98,'Sul','AGO./FEV.');
INSERT INTO "EpocaRegiao" VALUES(99,'Sudeste','SET./DEz.');
INSERT INTO "EpocaRegiao" VALUES(100,'Nordeste','OUT./MAR.');
INSERT INTO "EpocaRegiao" VALUES(101,'Centro-Oeste','SET./JAN.');
INSERT INTO "EpocaRegiao" VALUES(102,'Norte','MAR./MAIO');
INSERT INTO "EpocaRegiao" VALUES(103,'Sul','SET./DEz.');
INSERT INTO "EpocaRegiao" VALUES(104,'Nordeste','MAR./JUN.');
INSERT INTO "EpocaRegiao" VALUES(105,'Sul','MAR./ABR.');
INSERT INTO "EpocaRegiao" VALUES(106,'Centro-Oeste','FEV./MAR.');
INSERT INTO "EpocaRegiao" VALUES(107,'Sul','JUL./DEz.');
INSERT INTO "EpocaRegiao" VALUES(108,'Sudeste','MAR/AGO');
INSERT INTO "EpocaRegiao" VALUES(109,'Sudeste','JAN./AGO.');
INSERT INTO "EpocaRegiao" VALUES(110,'Centro-Oeste','JUL./NOV.');
INSERT INTO "EpocaRegiao" VALUES(111,'Norte','ABR./SET.');
INSERT INTO "EpocaRegiao" VALUES(112,'Norte','JUL./DEz.');
INSERT INTO "EpocaRegiao" VALUES(113,'Nordeste','MAIO/SET.');
INSERT INTO "EpocaRegiao" VALUES(114,'Sul','OUT./DEz.');
INSERT INTO "EpocaRegiao" VALUES(115,'Sul','MAR/AGO');
INSERT INTO "EpocaRegiao" VALUES(116,'Nordeste','MAR/JUL.');
INSERT INTO "EpocaRegiao" VALUES(117,'Centro-Oeste','ABR./SET.');
INSERT INTO "EpocaRegiao" VALUES(118,'Nordeste','MAR./JUL.');
INSERT INTO "EpocaRegiao" VALUES(119,'Centro-Oeste','MAR./JUL');
INSERT INTO "EpocaRegiao" VALUES(120,'Sul','MAR./SET.');
INSERT INTO "EpocaRegiao" VALUES(121,'Sudeste','MAR./SET');
INSERT INTO "EpocaRegiao" VALUES(122,'Sul','SET./NOV.');
INSERT INTO "EpocaRegiao" VALUES(123,'Sudeste','SET./NOV.');
INSERT INTO "EpocaRegiao" VALUES(124,'Centro-Oeste','SET./FEV.');
INSERT INTO "EpocaRegiao" VALUES(125,'Sudeste','DEz./JAN.');
INSERT INTO "EpocaRegiao" VALUES(126,'Norte','DEz./JAN.');
INSERT INTO "EpocaRegiao" VALUES(127,'Norte','MAR./');
CREATE TABLE "EpocaRegiaoPlanta" (
    "IdEpocaRegiao" INTEGER NOT NULL,
    "IdPlanta" INTEGER NOT NULL,
    CONSTRAINT "PK_EpocaRegiaoPlanta" PRIMARY KEY ("IdEpocaRegiao", "IdPlanta"),
    CONSTRAINT "FK_EpocaRegiaoPlanta_EpocaRegiao_IdEpocaRegiao" FOREIGN KEY ("IdEpocaRegiao") REFERENCES "EpocaRegiao" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_EpocaRegiaoPlanta_Planta_IdPlanta" FOREIGN KEY ("IdPlanta") REFERENCES "Planta" ("Id") ON DELETE CASCADE
);
INSERT INTO "EpocaRegiaoPlanta" VALUES(1,1);
INSERT INTO "EpocaRegiaoPlanta" VALUES(2,1);
INSERT INTO "EpocaRegiaoPlanta" VALUES(3,1);
INSERT INTO "EpocaRegiaoPlanta" VALUES(4,1);
INSERT INTO "EpocaRegiaoPlanta" VALUES(5,1);
INSERT INTO "EpocaRegiaoPlanta" VALUES(3,2);
INSERT INTO "EpocaRegiaoPlanta" VALUES(4,2);
INSERT INTO "EpocaRegiaoPlanta" VALUES(5,2);
INSERT INTO "EpocaRegiaoPlanta" VALUES(6,2);
INSERT INTO "EpocaRegiaoPlanta" VALUES(7,2);
INSERT INTO "EpocaRegiaoPlanta" VALUES(8,3);
INSERT INTO "EpocaRegiaoPlanta" VALUES(9,3);
INSERT INTO "EpocaRegiaoPlanta" VALUES(10,3);
INSERT INTO "EpocaRegiaoPlanta" VALUES(11,3);
INSERT INTO "EpocaRegiaoPlanta" VALUES(12,3);
INSERT INTO "EpocaRegiaoPlanta" VALUES(9,4);
INSERT INTO "EpocaRegiaoPlanta" VALUES(13,4);
INSERT INTO "EpocaRegiaoPlanta" VALUES(14,4);
INSERT INTO "EpocaRegiaoPlanta" VALUES(15,4);
INSERT INTO "EpocaRegiaoPlanta" VALUES(16,4);
INSERT INTO "EpocaRegiaoPlanta" VALUES(10,5);
INSERT INTO "EpocaRegiaoPlanta" VALUES(11,5);
INSERT INTO "EpocaRegiaoPlanta" VALUES(17,5);
INSERT INTO "EpocaRegiaoPlanta" VALUES(18,5);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,5);
INSERT INTO "EpocaRegiaoPlanta" VALUES(9,6);
INSERT INTO "EpocaRegiaoPlanta" VALUES(13,6);
INSERT INTO "EpocaRegiaoPlanta" VALUES(14,6);
INSERT INTO "EpocaRegiaoPlanta" VALUES(20,6);
INSERT INTO "EpocaRegiaoPlanta" VALUES(21,6);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,7);
INSERT INTO "EpocaRegiaoPlanta" VALUES(22,7);
INSERT INTO "EpocaRegiaoPlanta" VALUES(23,7);
INSERT INTO "EpocaRegiaoPlanta" VALUES(24,7);
INSERT INTO "EpocaRegiaoPlanta" VALUES(25,7);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,8);
INSERT INTO "EpocaRegiaoPlanta" VALUES(26,8);
INSERT INTO "EpocaRegiaoPlanta" VALUES(27,8);
INSERT INTO "EpocaRegiaoPlanta" VALUES(28,8);
INSERT INTO "EpocaRegiaoPlanta" VALUES(29,8);
INSERT INTO "EpocaRegiaoPlanta" VALUES(5,9);
INSERT INTO "EpocaRegiaoPlanta" VALUES(13,9);
INSERT INTO "EpocaRegiaoPlanta" VALUES(30,9);
INSERT INTO "EpocaRegiaoPlanta" VALUES(31,9);
INSERT INTO "EpocaRegiaoPlanta" VALUES(32,9);
INSERT INTO "EpocaRegiaoPlanta" VALUES(10,10);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,10);
INSERT INTO "EpocaRegiaoPlanta" VALUES(33,10);
INSERT INTO "EpocaRegiaoPlanta" VALUES(34,10);
INSERT INTO "EpocaRegiaoPlanta" VALUES(35,10);
INSERT INTO "EpocaRegiaoPlanta" VALUES(36,11);
INSERT INTO "EpocaRegiaoPlanta" VALUES(37,11);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,11);
INSERT INTO "EpocaRegiaoPlanta" VALUES(39,11);
INSERT INTO "EpocaRegiaoPlanta" VALUES(40,11);
INSERT INTO "EpocaRegiaoPlanta" VALUES(5,12);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,12);
INSERT INTO "EpocaRegiaoPlanta" VALUES(41,12);
INSERT INTO "EpocaRegiaoPlanta" VALUES(42,12);
INSERT INTO "EpocaRegiaoPlanta" VALUES(43,12);
INSERT INTO "EpocaRegiaoPlanta" VALUES(4,13);
INSERT INTO "EpocaRegiaoPlanta" VALUES(40,13);
INSERT INTO "EpocaRegiaoPlanta" VALUES(44,13);
INSERT INTO "EpocaRegiaoPlanta" VALUES(45,13);
INSERT INTO "EpocaRegiaoPlanta" VALUES(46,13);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,14);
INSERT INTO "EpocaRegiaoPlanta" VALUES(47,14);
INSERT INTO "EpocaRegiaoPlanta" VALUES(48,14);
INSERT INTO "EpocaRegiaoPlanta" VALUES(49,14);
INSERT INTO "EpocaRegiaoPlanta" VALUES(50,14);
INSERT INTO "EpocaRegiaoPlanta" VALUES(9,15);
INSERT INTO "EpocaRegiaoPlanta" VALUES(10,15);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,15);
INSERT INTO "EpocaRegiaoPlanta" VALUES(51,15);
INSERT INTO "EpocaRegiaoPlanta" VALUES(52,15);
INSERT INTO "EpocaRegiaoPlanta" VALUES(52,16);
INSERT INTO "EpocaRegiaoPlanta" VALUES(53,16);
INSERT INTO "EpocaRegiaoPlanta" VALUES(54,16);
INSERT INTO "EpocaRegiaoPlanta" VALUES(55,16);
INSERT INTO "EpocaRegiaoPlanta" VALUES(56,16);
INSERT INTO "EpocaRegiaoPlanta" VALUES(5,17);
INSERT INTO "EpocaRegiaoPlanta" VALUES(47,17);
INSERT INTO "EpocaRegiaoPlanta" VALUES(48,17);
INSERT INTO "EpocaRegiaoPlanta" VALUES(57,17);
INSERT INTO "EpocaRegiaoPlanta" VALUES(58,17);
INSERT INTO "EpocaRegiaoPlanta" VALUES(10,18);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,18);
INSERT INTO "EpocaRegiaoPlanta" VALUES(59,18);
INSERT INTO "EpocaRegiaoPlanta" VALUES(60,18);
INSERT INTO "EpocaRegiaoPlanta" VALUES(61,18);
INSERT INTO "EpocaRegiaoPlanta" VALUES(8,19);
INSERT INTO "EpocaRegiaoPlanta" VALUES(9,19);
INSERT INTO "EpocaRegiaoPlanta" VALUES(29,19);
INSERT INTO "EpocaRegiaoPlanta" VALUES(31,19);
INSERT INTO "EpocaRegiaoPlanta" VALUES(62,19);
INSERT INTO "EpocaRegiaoPlanta" VALUES(16,20);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,20);
INSERT INTO "EpocaRegiaoPlanta" VALUES(63,20);
INSERT INTO "EpocaRegiaoPlanta" VALUES(64,20);
INSERT INTO "EpocaRegiaoPlanta" VALUES(65,20);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,21);
INSERT INTO "EpocaRegiaoPlanta" VALUES(66,21);
INSERT INTO "EpocaRegiaoPlanta" VALUES(67,21);
INSERT INTO "EpocaRegiaoPlanta" VALUES(68,21);
INSERT INTO "EpocaRegiaoPlanta" VALUES(69,21);
INSERT INTO "EpocaRegiaoPlanta" VALUES(8,22);
INSERT INTO "EpocaRegiaoPlanta" VALUES(9,22);
INSERT INTO "EpocaRegiaoPlanta" VALUES(16,22);
INSERT INTO "EpocaRegiaoPlanta" VALUES(49,22);
INSERT INTO "EpocaRegiaoPlanta" VALUES(70,22);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,23);
INSERT INTO "EpocaRegiaoPlanta" VALUES(47,23);
INSERT INTO "EpocaRegiaoPlanta" VALUES(48,23);
INSERT INTO "EpocaRegiaoPlanta" VALUES(71,23);
INSERT INTO "EpocaRegiaoPlanta" VALUES(72,23);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,24);
INSERT INTO "EpocaRegiaoPlanta" VALUES(70,24);
INSERT INTO "EpocaRegiaoPlanta" VALUES(73,24);
INSERT INTO "EpocaRegiaoPlanta" VALUES(74,24);
INSERT INTO "EpocaRegiaoPlanta" VALUES(75,24);
INSERT INTO "EpocaRegiaoPlanta" VALUES(10,25);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,25);
INSERT INTO "EpocaRegiaoPlanta" VALUES(34,25);
INSERT INTO "EpocaRegiaoPlanta" VALUES(35,25);
INSERT INTO "EpocaRegiaoPlanta" VALUES(76,25);
INSERT INTO "EpocaRegiaoPlanta" VALUES(77,26);
INSERT INTO "EpocaRegiaoPlanta" VALUES(78,26);
INSERT INTO "EpocaRegiaoPlanta" VALUES(79,26);
INSERT INTO "EpocaRegiaoPlanta" VALUES(80,26);
INSERT INTO "EpocaRegiaoPlanta" VALUES(81,26);
INSERT INTO "EpocaRegiaoPlanta" VALUES(16,27);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,27);
INSERT INTO "EpocaRegiaoPlanta" VALUES(42,27);
INSERT INTO "EpocaRegiaoPlanta" VALUES(80,27);
INSERT INTO "EpocaRegiaoPlanta" VALUES(82,27);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,28);
INSERT INTO "EpocaRegiaoPlanta" VALUES(40,28);
INSERT INTO "EpocaRegiaoPlanta" VALUES(83,28);
INSERT INTO "EpocaRegiaoPlanta" VALUES(84,28);
INSERT INTO "EpocaRegiaoPlanta" VALUES(85,28);
INSERT INTO "EpocaRegiaoPlanta" VALUES(86,29);
INSERT INTO "EpocaRegiaoPlanta" VALUES(87,29);
INSERT INTO "EpocaRegiaoPlanta" VALUES(88,29);
INSERT INTO "EpocaRegiaoPlanta" VALUES(89,29);
INSERT INTO "EpocaRegiaoPlanta" VALUES(90,29);
INSERT INTO "EpocaRegiaoPlanta" VALUES(5,30);
INSERT INTO "EpocaRegiaoPlanta" VALUES(14,30);
INSERT INTO "EpocaRegiaoPlanta" VALUES(42,30);
INSERT INTO "EpocaRegiaoPlanta" VALUES(50,30);
INSERT INTO "EpocaRegiaoPlanta" VALUES(91,30);
INSERT INTO "EpocaRegiaoPlanta" VALUES(10,31);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,31);
INSERT INTO "EpocaRegiaoPlanta" VALUES(92,31);
INSERT INTO "EpocaRegiaoPlanta" VALUES(93,31);
INSERT INTO "EpocaRegiaoPlanta" VALUES(94,31);
INSERT INTO "EpocaRegiaoPlanta" VALUES(4,32);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,32);
INSERT INTO "EpocaRegiaoPlanta" VALUES(40,32);
INSERT INTO "EpocaRegiaoPlanta" VALUES(91,32);
INSERT INTO "EpocaRegiaoPlanta" VALUES(95,32);
INSERT INTO "EpocaRegiaoPlanta" VALUES(5,33);
INSERT INTO "EpocaRegiaoPlanta" VALUES(14,33);
INSERT INTO "EpocaRegiaoPlanta" VALUES(42,33);
INSERT INTO "EpocaRegiaoPlanta" VALUES(66,33);
INSERT INTO "EpocaRegiaoPlanta" VALUES(96,33);
INSERT INTO "EpocaRegiaoPlanta" VALUES(5,34);
INSERT INTO "EpocaRegiaoPlanta" VALUES(14,34);
INSERT INTO "EpocaRegiaoPlanta" VALUES(95,34);
INSERT INTO "EpocaRegiaoPlanta" VALUES(96,34);
INSERT INTO "EpocaRegiaoPlanta" VALUES(97,34);
INSERT INTO "EpocaRegiaoPlanta" VALUES(98,35);
INSERT INTO "EpocaRegiaoPlanta" VALUES(99,35);
INSERT INTO "EpocaRegiaoPlanta" VALUES(100,35);
INSERT INTO "EpocaRegiaoPlanta" VALUES(101,35);
INSERT INTO "EpocaRegiaoPlanta" VALUES(102,35);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,36);
INSERT INTO "EpocaRegiaoPlanta" VALUES(96,36);
INSERT INTO "EpocaRegiaoPlanta" VALUES(99,36);
INSERT INTO "EpocaRegiaoPlanta" VALUES(103,36);
INSERT INTO "EpocaRegiaoPlanta" VALUES(104,36);
INSERT INTO "EpocaRegiaoPlanta" VALUES(10,37);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,37);
INSERT INTO "EpocaRegiaoPlanta" VALUES(23,37);
INSERT INTO "EpocaRegiaoPlanta" VALUES(105,37);
INSERT INTO "EpocaRegiaoPlanta" VALUES(106,37);
INSERT INTO "EpocaRegiaoPlanta" VALUES(15,38);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,38);
INSERT INTO "EpocaRegiaoPlanta" VALUES(75,38);
INSERT INTO "EpocaRegiaoPlanta" VALUES(107,38);
INSERT INTO "EpocaRegiaoPlanta" VALUES(108,38);
INSERT INTO "EpocaRegiaoPlanta" VALUES(16,39);
INSERT INTO "EpocaRegiaoPlanta" VALUES(70,39);
INSERT INTO "EpocaRegiaoPlanta" VALUES(75,39);
INSERT INTO "EpocaRegiaoPlanta" VALUES(76,39);
INSERT INTO "EpocaRegiaoPlanta" VALUES(109,39);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,40);
INSERT INTO "EpocaRegiaoPlanta" VALUES(91,40);
INSERT INTO "EpocaRegiaoPlanta" VALUES(95,40);
INSERT INTO "EpocaRegiaoPlanta" VALUES(110,40);
INSERT INTO "EpocaRegiaoPlanta" VALUES(111,40);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,41);
INSERT INTO "EpocaRegiaoPlanta" VALUES(42,41);
INSERT INTO "EpocaRegiaoPlanta" VALUES(85,41);
INSERT INTO "EpocaRegiaoPlanta" VALUES(91,41);
INSERT INTO "EpocaRegiaoPlanta" VALUES(112,41);
INSERT INTO "EpocaRegiaoPlanta" VALUES(16,42);
INSERT INTO "EpocaRegiaoPlanta" VALUES(42,42);
INSERT INTO "EpocaRegiaoPlanta" VALUES(85,42);
INSERT INTO "EpocaRegiaoPlanta" VALUES(91,42);
INSERT INTO "EpocaRegiaoPlanta" VALUES(113,42);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,43);
INSERT INTO "EpocaRegiaoPlanta" VALUES(40,43);
INSERT INTO "EpocaRegiaoPlanta" VALUES(42,43);
INSERT INTO "EpocaRegiaoPlanta" VALUES(43,43);
INSERT INTO "EpocaRegiaoPlanta" VALUES(114,43);
INSERT INTO "EpocaRegiaoPlanta" VALUES(62,44);
INSERT INTO "EpocaRegiaoPlanta" VALUES(108,44);
INSERT INTO "EpocaRegiaoPlanta" VALUES(115,44);
INSERT INTO "EpocaRegiaoPlanta" VALUES(116,44);
INSERT INTO "EpocaRegiaoPlanta" VALUES(117,44);
INSERT INTO "EpocaRegiaoPlanta" VALUES(9,45);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,45);
INSERT INTO "EpocaRegiaoPlanta" VALUES(51,45);
INSERT INTO "EpocaRegiaoPlanta" VALUES(70,45);
INSERT INTO "EpocaRegiaoPlanta" VALUES(75,45);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,46);
INSERT INTO "EpocaRegiaoPlanta" VALUES(108,46);
INSERT INTO "EpocaRegiaoPlanta" VALUES(115,46);
INSERT INTO "EpocaRegiaoPlanta" VALUES(118,46);
INSERT INTO "EpocaRegiaoPlanta" VALUES(119,46);
INSERT INTO "EpocaRegiaoPlanta" VALUES(19,47);
INSERT INTO "EpocaRegiaoPlanta" VALUES(79,47);
INSERT INTO "EpocaRegiaoPlanta" VALUES(80,47);
INSERT INTO "EpocaRegiaoPlanta" VALUES(120,47);
INSERT INTO "EpocaRegiaoPlanta" VALUES(121,47);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,48);
INSERT INTO "EpocaRegiaoPlanta" VALUES(40,48);
INSERT INTO "EpocaRegiaoPlanta" VALUES(122,48);
INSERT INTO "EpocaRegiaoPlanta" VALUES(123,48);
INSERT INTO "EpocaRegiaoPlanta" VALUES(124,48);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,49);
INSERT INTO "EpocaRegiaoPlanta" VALUES(63,49);
INSERT INTO "EpocaRegiaoPlanta" VALUES(65,49);
INSERT INTO "EpocaRegiaoPlanta" VALUES(125,49);
INSERT INTO "EpocaRegiaoPlanta" VALUES(126,49);
INSERT INTO "EpocaRegiaoPlanta" VALUES(4,50);
INSERT INTO "EpocaRegiaoPlanta" VALUES(38,50);
INSERT INTO "EpocaRegiaoPlanta" VALUES(48,50);
INSERT INTO "EpocaRegiaoPlanta" VALUES(91,50);
INSERT INTO "EpocaRegiaoPlanta" VALUES(127,50);
CREATE TABLE "Estado" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Estado" PRIMARY KEY AUTOINCREMENT,
    "Sigla" TEXT NULL,
    "Nome" TEXT NULL,
    "IdRegiao" INTEGER NULL,
    CONSTRAINT "FK_Estado_Regiao_IdRegiao" FOREIGN KEY ("IdRegiao") REFERENCES "Regiao" ("Id")
);
INSERT INTO "Estado" VALUES(41,'PR','Paraná',4);
CREATE TABLE "Mesorregiao" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Mesorregiao" PRIMARY KEY AUTOINCREMENT,
    "Nome" TEXT NULL,
    "IdUF" INTEGER NULL,
    CONSTRAINT "FK_Mesorregiao_UF_IdUF" FOREIGN KEY ("IdUF") REFERENCES "UF" ("Id")
);
INSERT INTO "Mesorregiao" VALUES(4106,'Oeste Paranaense',41);
CREATE TABLE "Microrregiao" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Microrregiao" PRIMARY KEY AUTOINCREMENT,
    "Nome" TEXT NULL,
    "IdMessorregiao" INTEGER NULL,
    CONSTRAINT "FK_Microrregiao_Mesorregiao_IdMessorregiao" FOREIGN KEY ("IdMessorregiao") REFERENCES "Mesorregiao" ("Id")
);
INSERT INTO "Microrregiao" VALUES(41024,'Foz do Iguaçu',4106);
CREATE TABLE "Planta" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Planta" PRIMARY KEY AUTOINCREMENT,
    "IdDias" INTEGER NULL,
    "Nome" TEXT NULL,
    "NomeCientifico" TEXT NULL,
    "Descricao" TEXT NULL,
    "RegiaoPlantio" TEXT NULL,
    "RecomAprov" TEXT NULL,
    CONSTRAINT "FK_Planta_DiasPlanta_IdDias" FOREIGN KEY ("IdDias") REFERENCES "DiasPlanta" ("Id")
);
INSERT INTO "Planta" VALUES(1,1,'Abóbora','Cucurbita moschata Duch.',' É uma cultura tipicamente tropical com frutos ricos em vitamina A. Também fornece vitaminas do complexo B, cálcio e fósforo. Na mesma planta encontram-se flores femininas (que originam os frutos) e masculinas (que fornecem o pólen). Para boa produtividade e frutos sem deformações, é necessária a presença de abelhas para a polinização. Os tipos mais encontrados são:  seca (frutos grandes),  baianinha (casca rajada) e japonesa ou cabotiá (casca verde-escuro). No caso das abóboras híbridas (cabotiá), para o pegamento dos frutos, é preciso que outra espécie, plantada 15 dias antes do híbrido, forneça o pólen ou seja aplicado hormônio sintético nas flores.',' É favorecida por temperaturas elevadas. Tolera temperaturas amenas (entre 15° e 25°C), mas não resiste a geadas. Dias curtos, com menor exposição do Sol, favorecem a floração feminina, resultando em maior produtividade. Em regiões de inverno suave, é possível plantar o ano todo, desde que haja irrigação.','É consumida em saladas, cozidos, refogados, sopas, purês, pães, bolos, pudins e doces. As sementes são ricas em ferro e podem ser torradas e consumidas como aperitivo. São também vermicidas. Tem-se observado um crescimento na venda da abóbora já processada (cortada e embalada) e de sementes já torradas e salgadas.');
INSERT INTO "Planta" VALUES(2,2,'Abobrinha italiana, abobrinha verde, abobrinha','Cucurbita pepo L.',' Seus frutos são de fácil digestão, ricos em niacina, e fonte de vitaminas do complexo B. As abobrinhas são produzidas de forma semelhante à abóbora, mas são colhidas ainda imaturas (verdes). Podem ser semeadas diretamente no local de plantio ou em bandejas para transplante. Mas cuidado: são sensíveis ao transplantio, já que suas raízes não se recuperam depois de danificadas. A cultura é sensível ao excesso de água no solo. O início da colheita dependerá da cultivar escolhida e do ponto de maturação exigido pelo consumidor.',' Desenvolve-se melhor sob temperaturas amenas (entre 15° e 25°C). Temperaturas elevadas podem prejudicar a polinização. Não tolera geadas. ','A abobrinha pode ser consumida refogada no óleo ou azeite, cozida, em saladas frias, como suflê, frita à milanesa, recheada ou como ingrediente em bolos, pizza e pastelões. Seu cozimento é rápido e não é necessário acrescentar água, pois a água da abobrinha é suficiente para cozinhá-la. É comercializada em caixas plásticas e vendida ao consumidor final a granel ou em bandejas, com os frutos inteiros ou já cortados.');
INSERT INTO "Planta" VALUES(3,3,'Acelga ','Beta vulgaris L. var. cicla',' A acelga é da mesma família da beterraba e se diferencia pelo grande desenvolvimento das folhas e do talo, que são as partes comestíveis. Rica em fibras e vitaminas A e C, além de ser fonte de sais minerais como cálcio e ferro. A semeadura é feita em bandejas para a produção de mudas ou diretamente no canteiro, sendo necessário o raleio (eliminação das plantas em excesso) nesse último caso. O ciclo pode prolongar-se por cerca de 100 dias, sendo que a colheita inicia-se entre 60 – 70 dias após o plantio.',' Desenvolve-se melhor sob temperaturas amenas (entre 15° e 25°C), sendo plantadas geralmente nos períodos de outono e inverno em regiões de baixa altitude. Em regiões mais altas, com verão suave, pode-se plantar durante todo o ano.','Pode ser consumida crua, em saladas, e refogada como a couve. É vendida em maços, e os caules podem ser consumidos fritos ou cozidos em sopas.');
INSERT INTO "Planta" VALUES(4,3,'Agrião ','Nasturtium officinale sp.',' É uma planta semiperene, podendo ser plantada em água ou em terra seca. É uma hortaliça folhosa, rica em vitamina C e em sais minerais, como o ferro. Seus talos são ricos em iodo. É semeada em bandejas ou em sementeiras, sendo posteriormente transplantada para o local definitivo. As estacas retiradas de culturas adultas também podem ser utilizadas para o plantio. A colheita pode ser feita quando as folhas já têm um bom tamanho, podendo ser repetida por quatro vezes ou mais. O primeiro corte se dá por volta de 60 dias após o plantio.',' Desenvolve-se melhor sob temperaturas amenas (entre 15° e 25°C), sendo plantado geralmente nos períodos de outono e inverno. Onde o verão não é muito quente, pode ser plantado o ano inteiro.','Pode ser usado cru, em saladas, molhos, pães, sopas e cozidos. Também é utilizado com mel na medicina popular para curar tosse e bronquite. É vendido em maços ou minimamente processado, já desinfetado, em embalagens com outras hortaliças. ');
INSERT INTO "Planta" VALUES(5,4,'Alcachofra','Cynara scolymus L.',' A parte comestível é o botão floral. É fonte de vitamina C, ácido fólico, magnésio e potássio. É uma cultura perene, plantada por brotos retirados de plantas selecionadas. As mudas devem ter uma parte subterrânea que contenha algumas raízes e a parte aérea com 5 a 7 folhas. De cada planta são colhidos cerca de 20 botões.',' A cultura exige frio para se desenvolver bem, mas é sensível a geada.','As flores são consumidas cozidas. Deve-se retirar a parte fibrosa central de cada alcachofra, isto é, os “espinhos”. Pode acompanhar carnes ou compor molhos e tortas. ');
INSERT INTO "Planta" VALUES(6,5,'Alface','Lactuca sativa L. ',' É uma hortaliça de folhas comestíveis. As folhas podem ser lisas ou crespas, com ou sem formação de cabeça. Também existem alfaces com folhas roxas ou folhas bem recortadas. É uma importante fonte de sais minerais, principalmente de cálcio e de vitaminas, especialmente a vitamina A. A alface deve ser colhida antes do início do pendoamento (emissão do pendão floral), momento em que as folhas começam a apresentar um sabor amargo característico. O plantio em local definitivo é feito por mudas semeadas em bandejas ou copinhos.',' Pode ser cultivada durante o ano todo, em todas as regiões do Brasil, a depender da cultivar escolhida, já que existem variedades adaptadas a climas mais quentes e outras para plantio em regiões de clima ameno.','Todas as folhas podem ser aproveitadas. As alfaces roxa e verde são consumidas predominantemente em saladas frescas. A alface americana é mais crocante e, além de seu uso em saladas, é indicada para o preparo de sanduíches por ser mais resistente ao calor. Podem ser limpas e embaladas em agroindústria, sendo vendidas já prontas para consumo. ');
INSERT INTO "Planta" VALUES(7,6,'Alho','Allium sativum L.',' O alho é um condimento mundialmente utilizado na culinária, sendo uma cultura muito antiga. É rico em vitaminas do complexo B e contém expressiva quantidade de fósforo. O bulbo contém bulbilhos (dentes) capazes de originar uma nova planta após brotação. A planta necessita de dias longos e frios para formar o bulbo. Visando induzir a formação de bulbos, foi desenvolvida a técnica de vernalização (expor os bulbos ao frio em câmara fria), sendo essa prática útil para algumas cultivares. ',' A escolha da cultivar adequada ao clima da região é essencial para o sucesso da cultura. As cultivares de ciclo curto ou precoces são menos exigentes de temperaturas frias e de quantidade de horas diárias de luz. As de ciclo mediano são um pouco mais exigentes de frio e horas de luz, enquanto as cultivares tardias exigem, no mínimo, 13 horas de luz por dia, podendo ser plantadas no extremo sul do Brasil ou no centro-sul, somente após a vernalização dos bulbos.','Pode ser usado na fabricação de molhos, pastas e temperos prontos pela agroindústria. O alho também tem sido vendido na forma de chips e frito, pronto para o consumo. É utilizado para temperar grande parte dos alimentos preparados em casa: sopas, arroz, feijão, carnes, molhos e massas.');
INSERT INTO "Planta" VALUES(8,1,'Alho-porro','Allium ampeloprasum L.',' A planta lembra o alho, porém é maior, com folhas mais largas e alongadas, de cor verde-escura. Apresenta consideráveis teores de vitaminas A, B e C. Produz melhor em solos de textura média (entre argiloso e arenoso), solto e leve. O plantio por mudas é o mais indicado, transplantando-se as mudas quando atingirem cerca de 12 centímetros de altura. Um trato cultural recomendado é a amontoa, que é a chegada de terra junto às plantas para provocar a produção de longas hastes brancas (na verdade, folhas modificadas).',' É planta típica de frio e deve ser plantada nos períodos de  outono e inverno.','No Brasil, ainda é pouco usado na culinária, porém seu uso tem aumentado nas agroindústrias para produção de sopas desidratadas. Pode ser usado em saladas, para temperar carnes e pratos finos, além de sopas. Deve ser manuseado com cuidado para evitar escurecimento do talo.');
INSERT INTO "Planta" VALUES(9,3,'Almeirão ou chicória amarga','Cichorium intybus L.',' Suas folhas são alongadas, em forma de lança e constituem a parte comestível. Fornece vitaminas A, C e do complexo B, sendo boa fonte de fósforo e ferro. Deve ser plantado diretamente no campo, pois suas raízes não suportam o transplante. As plantinhas em excesso devem ser eliminadas, obedecendo ao espaçamento de 15 a 20 centímetros entre as plantas. É uma cultura bastante exigente em água, portanto, deve-se irrigar bem e com frequência.',' Produz melhor sob temperaturas amenas (entre 15° e 25°C), sendo plantado geralmente nas estações de outono e inverno.','Pode ser consumido cru em saladas ou refogado como a couve, podendo substituí-la. Também pode ser usado no preparo de tortas, bolinhos e sopas ou como acompanhamento do arroz e feijão. É vendido em maços de folhas.');
INSERT INTO "Planta" VALUES(10,1,'e popular - Batata','Solanum tuberosum ssp. tuberosum',' Originária dos Andes, a batateira produz caules modicfi ados (tubérculos) ricos em carboidratos, muito utilizados na alimentação humana. A batata também é fonte importante de fósforo e vitaminas do grupo B. O tubérculo com brotações é a estrutura usada para plantio das lavouras de batata para consumo. Adapta-se melhor a solos arenosos, arejados e bem drenados, o que dicfi ulta o aparecimento de doenças. A colheita é feita quando as ramas já estão secando e tombando.',' No centro-sul, pode-se plantar o ano inteiro. Entretanto, os plantios de inverno e primavera são melhores que os de verão, pois a cultura se desenvolve melhor sob temperaturas amenas (entre 15° e 25°C), sofrendo menor incidência de doenças. Temperaturas altas noturnas (acima de 20°C) por mais de 60 dias inviabiliza a produção de tubérculos. ','A batata é uma hortaliça consumida em todo o mundo, das mais diversas formas. Acompanha carnes, peixes e aves, podendo ser cozida, assada ou frita. É utilizada na forma de purês, em massas (nhoque), salgados, tortas e sopas. Ultimamente tem-se observado crescimento na venda da batata já processada (cortada e embalada) juntamente com outras hortaliças, como chuchu e cenoura, para o preparo de sopas e maioneses.');
INSERT INTO "Planta" VALUES(11,7,'Batata-doce','Ipomoea batatas L.',' A batata-doce é originária de regiões tropicais da América do Sul, sendo suas raízes tuberosas as partes de maior interesse para alimentação, por serem ricas em amido e açúcares. A polpa e a casca possuem cores que variam de branco ao roxo, passando pelo creme e alaranjado. É uma cultura rústica, pouco exigente em nutrientes e água, porém requer um bom preparo do solo (aração e gradagem). Adapta-se melhor a solos arenosos e arejados. A propagação pode ser feita pela própria batata-doce brotada, pelos brotos destacados da batata, ramas velhas e ramas novas, sendo esta última a forma que fornece melhor resultado. Enterram-se de 3 a 4 entrenós (espaço entre dois nós de tronco ou caule) da rama, deixando a ponteira com as folhas para fora da terra. A colheita deve preferencialmente ser feita com a terra seca, quando as raízes atingirem o tamanho desejado.',' A cultura da batata-doce se desenvolve bem em temperaturas mais elevadas. O frio pode reduzir a produtividade e aumentar o ciclo da cultura. Não tolera geadas. Em regiões de baixa altitude, com inverno suave, é possível plantar durante todo o ano.','A batata-doce pode se consumida cozida, assada ou frita, acompanhando diversos pratos. Até os brotos e folhas podem ser consumidos, refogados ou em sopas. Na indústria, a batata-doce é matéria-prima para fabricação de álcool, farinha (amido), pães e doces. As raízes e ramas também podem ser usadas na alimentação animal. ');
INSERT INTO "Planta" VALUES(12,8,'Berinjela','Nome popular – BerinjelaNNome científico - Solanum melongena L.',' É uma planta arbustiva, resistente e vigorosa. Produzem frutos roxo-escuros ou quase negros. É rica em vitamina A, B1, B2, B5, C, potássio, fósforo, cloro, cálcio, sódio, ferro, magnésio e enxofre. O plantio é realizado via semente, em bandejas com posterior transplantio para o campo.',' É uma planta de clima quente, sendo favorecida pelo calor, principalmente para a germinação, emergência e formação da muda.','Pode ser consumida cozida, em pratos frios ou quentes, e frita à milanesa em fatias finas. Também pode ser ingrediente no preparo de patês, molhos, recheada, omelete e muitos outros pratos. Seu suco é diurético, diminui o colesterol e reduz a ação das gorduras sobre o fígado.');
INSERT INTO "Planta" VALUES(13,3,'Bertalha, bretalha, couve-de-cerca, joão-gomes, espinafre-indiano (Ásia), folha-Ntartaruga (África)','Basella alba e Basella rubra',' A bertalha é uma hortaliça trepadeira, de folhas suculentas, brilhantes e de formato ovalado ou de coração. É uma boa fonte de vitaminas A e C, além de cálcio, ferro e fósforo. A cultura prefere solos arenosos e ricos em matéria orgânica. As sementes devem permanecer 24 horas de molho em água antes da semeadura, para quebrar a dormência. A propagação é feita por sementes plantadas em sementeiras ou bandejas para posterior transplante ou por ramos plantados diretamente no canteiro. O transplante das mudas é feito 20 dias após a germinação. A planta pode ser tutorada (apoiada com estacas e arame) ou, dependendo da variedade, a lavoura pode ser conduzida de forma rasteira, com cortes sucessivos Colhem-se os ramos terminais quando atingem de 40 a 50 centímetros.',' Desenvolve-se melhor em regiões ensolaradas e com temperaturas mais elevadas. Chuvas abundantes e bem distribuídas favorecem a cultura. Não tolera geadas.','A bertalha pode substituir a couve ou o espinafre. Suas folhas e ramos podem ser consumidos crus em saladas, ou cozidos em sopas, refogados e recheios de tortas, panquecas e de outros pratos. Os ramos são comercializados em maços.');
INSERT INTO "Planta" VALUES(14,3,'Beterraba','Beta vulgaris L.',' É uma hortaliça bastante consumida no Brasil, cuja parte tuberosa tem sabor doce e coloração roxa. É fonte de sais minerais, principalmente ferro, e açúcar. Deve-se quebrar a dormência das sementes colocando-as de molho por 24 horas antes da semeadura e lavando-as em seguida. Pode ser plantada via semente em local definitivo ou em bandejas e sementeiras para posterior transplante, quando tiverem 4 a 5 folhas. Para produzir sementes, a cultura deve passar por um período de frio intenso. ',' Desenvolve-se melhor sob temperaturas amenas (entre 15° e 25°C) ou baixas e resiste ao frio e geadas. Não tolera temperaturas e umidade muito elevadas.','A raiz deve ser preferencialmente consumida crua e ralada, na forma de salada ou em sucos. Também pode ser consumida cozida, em sopas, em sucos e no preparo de bolos e suflês. Pode ser comercializada, já embalada, na forma minimamente processada (cubos, ralada, em rodelas). As folhas também podem ser consumidas, refogadas como couve ou em omeletes e bolinhos, sopas. ');
INSERT INTO "Planta" VALUES(15,9,'Brócolis, brócoli, brócolos ou couve-brócolos','Ou COuvE-BRóCOLOSNome popular – Brócolis, brócoli, brócolos ou couve-brócolosNNome científico - Brassica oleracea L. var. italica Plenck',' Planta verde escura da mesma família da couve, da couve-ofl r, do repolho e do agrião (brassicacea). Produz inofl rescências (conjunto de ofl res) comestíveis. Podem ser do tipo “cabeça”, ou do tipo “ramoso”. É fonte de vitamina C, A, cálcio, ferro, fósforo e bfi ras. É uma cultura exigente em adubação de micronutrientes, especialmente boro e molibdênio. A colheita deve ser feita quando os botões ofl rais estão bem desenvolvidos, ainda com coloração verde-escuro, mas antes da abertura das ofl res. ',' Já existem cultivares adaptadas a clima mais quente. A escolha da cultivar ideal, em relação ao clima da região e altitude, é fundamental. Para fazer a melhor escolha, o produtor deve consultar o catálogo de cultivares da espécie.','O brócolis pode ser consumido cru, quando muito novinho, ou cozido em saladas, sopas, suflês, refogado no arroz ou outros pratos. É uma hortaliça pouco durável e deve ser consumida rapidamente após a colheita, exigindo uma boa coordenação entre quem produz e distribui as hortaliças.');
INSERT INTO "Planta" VALUES(16,10,'e popular - Cebola','e popular - CebolaNNome científico - Allium cepa L.',' É planta originária da Ásia, sendo que a parte utilizável é um bulbo originado de folhas carnosas. É rica em vitaminas do complexo B, principalmente B1 e B2, e vitamina C. Pode ser semeada em local definitivo e em bandejas ou sementeiras para posterior transplante das mudas. O plantio também pode ser feito por bulbinhos, colhidos com 1 a 3 centímetros de diâmetro. Existe no mercado cultivares adaptadas a períodos de dias mais curtos e mais longos, de ciclo curto, mediano e longo.',' De modo geral, não forma bulbos em dias com duração inferior a 10 horas de luz. Os bulbos crescem e amadurecem mais rapidamente sob temperaturas altas. Mas a alta temperatura não tem efeito, se as horas de luz diárias exigidas não forem suficientes. Plantas expostas a um período prolongado de frio são induzidas a florescer, o que é desejável somente a produtores de sementes.','É usada principalmente para realçar o sabor dos alimentos. Pode ser consumida em saladas, no preparo de sopas, carnes, patês, pizzas, biscoitos, frita à milanesa ou assada. Também pode ser comercializada na forma de conservas e pastas.23');
INSERT INTO "Planta" VALUES(17,11,'Cebolinha','Allium schoenoprasum L.; Allium fistulosum L.',' As plantas de cebolinha se parecem com as de cebola, porém possuem um número maior de folhas que formam uma touceira. As folhas são uma boa fonte de cálcio, vitamina C e vitamina A. É propagada por sementes ou pelo plantio de parte da touceira. Devido à capacidade de rebrota, podem ser feitas várias colheitas.',' Produz melhor sob temperaturas amenas a frias (de 25ºC para baixo), sendo plantadas geralmente nas estações de outono e inverno.','É utilizada para dar aroma e sabor a pratos variados, como sopas, carnes, peixes e assados em geral. Pode ser congelada para aproveitamento posterior. Geralmente é comercializada em maços juntamente com a salsa ou o coentro, o chamado cheiro-verde.');
INSERT INTO "Planta" VALUES(18,12,'Cenoura','Daucus carota L.',' A cenoura é uma planta cuja parte comestível é a raiz tuberosa de cor alaranjada. Tem alto teor de betacaroteno, substância necessária à produção de vitamina A pelo nosso organismo. Também fornece cálcio, sódio e potássio. O solo deve ser bem fofo, sem qualquer obstáculo ao crescimento das raízes, para que não ocorram deformações. O amarelecimento e o secamento das folhas mais velhas e o arqueamento das folhas mais novas são indicativos do ponto de colheita.',' A faixa ideal para uma germinação rápida e uniforme das sementes é de 20º a 30ºC. Para cultivares de verão, baixas temperaturas no campo induzem as plantas a florescerem, o que só é desejável para produtores de sementes . Deve-se atentar à adequação da cultivar com o clima na época de plantio. ','Além do consumo in natura em saladas (crua ou cozida) e na forma de bolo, pão, purê, suflê, creme, doce ou suco, também é utilizada como matéria-prima para indústrias processadoras de alimentos. Assim, são comercializadas na forma minimamente processada (minicenouras, cubos, ralada, em rodelas) ou processada na forma de seleta de legumes, alimentos infantis e sopas instantâneas. ');
INSERT INTO "Planta" VALUES(19,3,'Chicória, escarola ou endívia','Cichorium endivia L.',' Parecida com a alface, a chicória possui dois tipos de cultivares: a lisa (chamada escarola) e a crespa (chamada endívia). É rica em bfi ras, vitaminas e minerais, em especial o potássio.',' Produz melhor sob temperaturas não muito altas (amenas), entre 15º a 25ºC, sendo semeada normalmente nos períodos de outono e inverno. Em regiões altas de clima ameno, pode ser plantada o ano todo.','Pode ser consumida crua em saladas e refogada, como a couve. Substitui a couve em sopas, omeletes e até em sucos. Não deve ser cozida em excesso, pois perde suas propriedades nutricionais devido ao calor.');
INSERT INTO "Planta" VALUES(20,8,'Chuchu','Sechium edule Sw.',' É uma planta de hábito trepador e seus frutos são ricos em fibras, vitaminas A, B1 e C e sais minerais como o potássio. Na mesma planta encontram-se flores femininas (que originam os frutos) e masculinas (que fornecem o pólen). O solo deve ser bem drenado, e o plantio é feito colocando na cova o fruto brotado, maduro e sem doenças. Não se deve enterrar ou cobrir de terra inteiramente o chuchu. A cultura é muito exigente em água. No inverno, as ramas e folhas secas devem ser retiradas.',' Produz bem sob temperaturas amenas (entre 15° e 25°C), porém não tolera frio excessivo. Calor e chuvas em excesso provocam queda das flores e ataque por doenças causadas por fungos.','É consumido cozido em sopas e refogados, suflês, tortas e em saladas frias. Atualmente tem-se observado o crescimento do comércio de chuchu cortado e embalado para o preparo de sopas.');
INSERT INTO "Planta" VALUES(21,13,'Coentro ','C oriandrum sativum L.',' É uma hortaliça condimentar da mesma família da cenoura, da salsa e da mandioquinha-salsa. O coentro é rico em vitaminas A, B1, B2 e C. Normalmente é plantado em local definitivo, via semente. As plantinhas devem ser desbastadas, ficando distanciadas de 8 a 10 centímetros uma da outra. É pouco exigente em relação ao solo e muito tolerante à acidez.',' É uma cultura de clima quente e não tolera baixas temperaturas.','Dá aroma e sabor a variados pratos. Pode ser ingrediente de sopas, saladas, carnes e peixes e cozidos em geral. Deve ser colocado ao final do preparo, para não ficar murcho. O coentro é geralmente comercializado em conjunto com a cebolinha, composição chamada cheiro-verde. 28');
INSERT INTO "Planta" VALUES(22,14,'Couve manteiga ou couve de folhas','Brassica oleracea L. var. acephala D.C.',' Apresenta caule ereto e emite novas folhas continuamente ao redor do caule. É muito rica em nutrientes, especialmente cálcio, ferro e vitaminas A, C, K e B5. Propaga-se por semente ou por plantio do broto lateral. Essa é a forma de propagação mais comum. A cultura é bastante exigente em boro e molibdênio.',' A couve é uma cultura típica dos períodos de outono e inverno, apresentando certa tolerância ao calor. Pode ser plantada durante o ano todo, mas as épocas mais indicadas por região estão descritas abaixo.','As folhas da couve podem ser comercializadas em maços e na forma minimamente processada, ou seja, já picadas e embaladas. A couve pode ser consumida crua, em sucos e saladas, refogada ou como ingrediente de sopas, farofas e cozidos. Deve ser comercializada e consumida em pouco tempo, pois sua vida útil é curta, quando não congelada.');
INSERT INTO "Planta" VALUES(23,3,'Couve-chinesa ou repolho chinês, chamada erroneamente de acelga.','Brassica pekinensis (Lou.). ',' A couve-chinesa possui folhas de cor verde-claro com a parte central branca. Fonte de ácido fólico (importante para a formação do sangue), além de vitamina A, vitaminas do grupo B e C, além de cálcio e potássio. São semeadas em bandejas e depois transplantadas para o canteiro definitivo, ou diretamente no canteiro, sendo necessário selecionar as melhores plantas.',' A maioria das cultivares tem melhor produção sob temperaturas amenas (entre 15º e 25ºC), mas há cultivares mais tolerantes ao calor.','As folhas podem ser consumidas cruas ou cozidas. É muito usada na culinária oriental na preparação de macarrão e carnes. Pode ser usada em sopas, tortas, misturadas no arroz e na salada (folhas cruas). ');
INSERT INTO "Planta" VALUES(24,15,'Couve-flor','Brassica oleracea var. botritys',' É uma hortaliça rica em cálcio e fósforo e fonte de folato e vitamina C. A parte comestível é a inflorescência (conjunto de floretes) ainda imatura, antes da abertura das flores. As mudas devem ser produzidas em substrato enriquecido com cálcio e fósforo e pobre em nitrogênio. Assim como o brócolis, é muito exigente em adubação com boro e molibdênio. Deve-se irrigar bem a lavoura de couve-flor, mas sem excesso, para não favorecer o aparecimento de doenças. Algumas folhas devem ser mantidas para a proteção da cabeça durante o transporte que, preferencialmente, deve ser feito sob refrigeração.',' É fundamental a escolha da cultivar correta de acordo com a época de plantio, pois há cultivares adaptadas a temperaturas mais quentes e a temperaturas mais amenas, entre 15º e 25ºC.','É consumida cozida em saladas, tortas, sopas e molhos, além de pratos fritos ou assados. Deve-se cozinhá-la antes de fritar ou assar. A couve-ofl r comercializada na forma minimamente processada vem apresentando crescimento considerável em diversos supermercados. A cabeça é cortada em pequenos ofl retes, que são acomodados em bandejas envoltas por lfi mes plásticos.');
INSERT INTO "Planta" VALUES(25,3,'Ervilha','Pisum sativum L.',' A ervilha é uma planta semelhante a feijão-vagem. Produz grãos tanto para a agroindústria (cultivares para debulhar, que geram grãos secos e verdes) quanto para consumo em vagem comestível. As ervilhas são hortaliças muito nutritivas e fornecem boa quantidade de vitaminas A, C e B, minerais e fibras. A semeadura é feita diretamente no local definitivo, pois não tolera o transplante. Para a produção de vagens comestíveis, a colheita deve se iniciar de 60 a 100 dias após o plantio, com os grãos ainda em desenvolvimento, dependendo da cultivar.',' Exige temperaturas amenas a frias (de 25ºC para baixo), adaptando-se às condições dos períodos de outono e inverno das regiões Sul, Sudeste e Centro-Oeste. Para não prejudicar a qualidade dos grãos secos, não devem ocorrer chuvas no início da colheita. ','A ervilha é muito usada no preparo de pratos orientais (arroz colorido) e no recheio de massas, panquecas e cachorro-quente. É muito apreciada em saladas frias. Tanto as vagens comestíveis quanto os grãos (verdes e secos) são consumidos cozidos.');
INSERT INTO "Planta" VALUES(26,5,'Espinafre','Spinacea oleracea L',' Há duas hortaliças conhecidas como espinafre. O mais encontrado no Brasil é o espinafre da Nova zelândia, planta que produz grandes folhas carnosas de cor verde-escuro. É rico em vitamina A, do complexo B e sais minerais, principalmente ferro. Recomenda-se a semeadura em bandejas para posterior transplante. Também é possível enraizar os seus ramos cortados pela base. Suas folhas devem ser colhidas antes que a planta emita o pendão e forme flores. Podem ser feitos cortes sucessivos, os quais estimulam a produção de novas folhas.',' Pode ser cultivado numa ampla faixa de temperatura, mas produz melhor sob temperaturas amenas (entre 15° e 25°C), com resistência ao calor. Não tolera frio excessivo. ','Pode ser consumido cru em saladas ou refogado, como a couve, em sopas, cremes, molhos, tortas, omeletes e até em sucos. É comercializado em maços.');
INSERT INTO "Planta" VALUES(27,3,'Feijão-vagem ou vagem','Phaseolus vulgaris L.',' O feijão-vagem é rico em proteína, importante para a formação dos músculos. Possui cultivares de três tipos: grupo macarrão (vagem cilíndricas), grupo manteiga (vagens achatadas) e as do grupo rasteiro (vagem cilíndrica e planta de crescimento determinado). Deve ser semeado diretamente no local definitivo de plantio. Temperaturas extremas (calor ou frio excessivo) podem provocar queda de flores ou vagens deformadas pela deficiência na polinização. O ponto de colheita ideal é quando as vagens atingem o máximo de desenvolvimento, antes de se tornarem fibrosas.',' Não tolera baixas temperaturas e geadas, desenvolvendo-se melhor sob temperaturas amenas (entre 15° e 25°C) a altas. Em regiões com inverno ameno, é possível o plantio durante o ano todo.','Vagens são consumidas cozidas, em pouca água ou no vapor, para não perderem muitos nutrientes. São utilizadas em saladas, cozidos, tortas, sopas e farofas. Podem ser comercializadas a granel, em porções já pesadas, acondicionadas em bandejas ou cortadas, higienizadas e embaladas.');
INSERT INTO "Planta" VALUES(28,16,'Gengibre','Zingiber officinale Roscoe',' O gengibre é uma planta que pode chegar a 1,20 metro de altura. Os rizomas, que são caules localizados embaixo da terra, são utilizados tanto para o consumo humano quanto para o plantio. São ricos em vitamina A, B, B2, B5, C, potássio, sódio. A planta cresce entre 90 e 120 centímetros e suas folhas são em forma de lança. Prefere solos arenosos, bem drenados e ricos em matéria orgânica. Deve-se fazer a amontoa, ou seja, cobrir com terra a área onde estão desenvolvendo os rizomas, para que eles não fiquem expostos ao sol. ',' Os rizomas se desenvolvem melhor em climas tropicais e subtropicais. A planta é sensível à geada, e temperaturas abaixo de 13°C podem paralisar seu crescimento.','Com o gengibre, podem ser preparados condimentos, refrigerantes, licores, cervejas e conservas. Com o óleo, preparam-se cosméticos. É utilizado como condimento de pratos chineses e japoneses, picles e para o preparo do quentão (bebida alcoólica com gengibre levada ao fogo).');
INSERT INTO "Planta" VALUES(29,6,'Inhame (antigo cará).','Dioscorea alata L. ; Dioscorea rotundata Poir; Dioscorea cayenensis',' É uma planta trepadeira, mas se adapta bem à cultura rasteira. Suas folhas têm formato de ponta de lança e são estreitas. É alimento rico em carboidratos e também se destaca como fonte de vitaminas do complexo B. Os tubérculos sementes são plantados sobre leiras. A colheita é feita quando as folhas ficam amareladas e os ramos secos. É ainda conhecido como cará no centro-sul do Brasil.',' Desenvolve-se bem sob altas temperaturas e chuvas abundantes. Não tolera frio nem geadas.','O inhame é consumido geralmente cozido. Pode ser usado das mesmas formas que a batata – em sopas, caldos, purês e refogados. Também pode ser ingrediente de pães, cremes, biscoitos, panquecas e tortas. Depois de cozido pode ser assado ou frito. Pode ser vendido inteiro ou já processado (cortado e embalado).');
INSERT INTO "Planta" VALUES(30,9,'Jiló','Solanum gilo Raddi',' O jiló é um fruto colhido e consumido ainda imaturo (verde) e possui um sabor amargo. É da mesma família do tomate, batata, pimenta e pimentão. É rico em vitamina A, B, cálcio, fósforo, ferro. Os tipos de jiló mais encontrados no mercado são: os de formato comprido e de coloração verde-claro e os de formato esférico e de cor verde-escuro. O plantio é feito por mudas, produzidas em bandejas ou copinhos. Não tolera excesso de água no solo, que deve ser bem drenado. Não é muito exigente em adubação e tolera a acidez. Pode ser necessário colocar estacas nas plantas para que não tombem.',' É uma planta típica de clima tropical, sendo plantado nos períodos de primavera e verão. Onde o inverno não é rigoroso, pode ser plantado o ano todo.','O jiló é consumido ainda verde e cozido, na forma de refogados, saladas frias, farofas e recheios de tortas. Pode ser vendido em caixas ou embalado em bandejas de isopor, o que aumenta seu valor de venda.');
INSERT INTO "Planta" VALUES(31,17,'Mandioquinha-salsa, baroa, batata-baroa, mandioquinha, batata-salsa, batata Nfiúza e cenoura-amarela','Arracacia xanthorrhiza Banc.',' Suas raízes são ricas em vitaminas do complexo B e carboidratos, além de minerais. É uma cultura de valor comercial alto em relação a outras hortaliças de raízes. O plantio é feito de brotos (filhotes) tirados de uma planta sadia. É feito em leiras e em solos bem drenados. A colheita é feita entre 10 e 12 meses após o plantio. ',' É uma cultura de clima ameno e de elevadas altitudes. Na regiões Sudeste e Centro-Oeste, somente é possível o cultivo acima de 800 metros de altitude, e em Santa Catarina e Rio Grande do Sul, acima de 500 metros.','Por ser de fácil digestão, é recomendada para alimentação infantil, de pessoas doentes e idosas. Pode ser vendida em caixas plásticas, depois de classificada por tamanho, ou embalada a vácuo, em porções menores, para melhor conservação. É muito utilizada para processamento em agroindústria, na fabricação de sopas prontas. ');
INSERT INTO "Planta" VALUES(32,3,'Maxixe','Cucumis anguria L.',' Os frutos são fonte de minerais, principalmente zinco, e têm poucas calorias. O plantio é feito colocando-se três sementes por cova. Não é muito exigente em adubação e tolera a acidez do solo. Adapta-se melhor a solos arenosos. ',' É uma hortaliça de clima tropical, suporta temperaturas elevadas e chuvas abundantes. Em regiões altas só pode ser semeado nos períodos de primavera e verão. Na Região Norte, o excesso de chuvas pode provocar doenças. ','Se colhido ainda verde, ele pode ser preparado cru, como salada, ou cozido como é mais comum ser consumido na forma de sopas ou refogados. É normalmente vendido para o consumidor final a granel, ou em bandejas de isopor, como forma de aumentar o valor do produto. Deve-se classificar o maxixe por tamanho e cor, para vender o produto por um preço melhor. ');
INSERT INTO "Planta" VALUES(33,18,'Melancia','Citrullus lanatus (Thunb.) Matsum. & Nakai',' É rica em vitamina A e vitamina C. Possui flores femininas (que originarão o fruto) e masculinas (que fornecem o pólen) na mesma planta. É essencial a presença de abelhas para que o fruto fique bem formado. Dias quentes e secos originam frutos mais doces. Há cultivares de formato alongado, globular (a mais comum), sem sementes e de tamanho mini. A melancia deve ser colhida quando a casca em contato com o solo mudar da cor verde esbranquiçado para amarelo.',' Exige temperaturas elevadas e não tolera frio nem geadas. Em regiões de baixa altitude e com irrigação como as observadas no Centro-Oeste, a melancia também pode ser plantada nos períodos de outono e inverno, utilizando-se irrigação para formar frutos de alta qualidade.','A melancia deve ser manuseada com cuidado para evitar danos mecânicos (pancadas), empilhando no máximo cinco camadas de frutos. É consumida in natura e na forma de sucos. Da casca podem ser feitos deliciosos doces e compotas.');
INSERT INTO "Planta" VALUES(34,19,'Melão','Cucumis melo L. var. inodorus Naud.',' A planta é muito parecida com a da melancia. As cultivares de melão estão distribuídas em dois grupos: inodorus (de casca firme e polpa usualmente branca), e aromáticos (de casca mais frágil e com aroma e sabor mais fortes). É uma cultura exigente em adubação. Pode ser plantada por mudas feitas em bandejas ou copinhos. É necessário girar os frutos, expondo toda a superfície à luz do sol para obter uma cor mais uniforme. ',' É uma planta de clima quente e todas as fases de desenvolvimento da planta são prejudicadas por baixas temperaturas (temperatura mínima ideal é em torno de 20°C). Não tolera frio nem geadas. Dias e noites quentes e baixa umidade relativa do ar são as condições ideais para essa cultura.','O melão é geralmente consumido in natura e na forma de sucos. Deve-se ter bastante cuidado no transporte, colocando-os em caixas de papelão. Tem sido uma excelente opção para produtores do semi-árido nordestino.');
INSERT INTO "Planta" VALUES(35,20,'Milho-verde.','Zea mays L.',' É o milho colhido em estágio ainda imaturo (verde). As espigas são verde-claras e os grãos amarelados. Produz em vários tipos de solo, porém é exigente em adubação com zinco e magnésio, devendo ser bem adubado. Essa cultura é uma ótima opção para rotação de culturas com as demais hortaliças. Existem cultivares para colheita de milho-doce e para colheita de milho-verde O milho-doce possui grãos ricos em açúcar, enquanto os grãos de milho-verde são ricos em amido. ',' Desenvolve-se bem em regiões de clima quente e ameno, sendo prejudicada pelo frio e geada. Onde não há inverno rigoroso, pode ser plantado o ano todo.','O milho-doce e o milho-verde podem ser consumidos cozidos ou assados, como ingredientes no recheio em pizzas e tortas, pastelões, cachorro-quente, saladas, entre outros pratos. No Brasil, o milho-doce é predominantemente utilizado na forma de conserva, sendo enviado para a agroindústria para ser enlatado. Por não ser rico em amido, o milho-doce não é recomendado para o preparo de pamonha e curau. Já o milho-verde é muito utilizado para o preparo de pratos típicos, como: pamonha, curau e cremes de milho. A vida pós-colheita dos dois tipos de milho é bastante curta, devendo ser comercializado rapidamente.');
INSERT INTO "Planta" VALUES(36,7,'Moranga','Cucurbita maxima Duch.',' Os frutos da moranga são ricos em vitamina A e carboidratos. É uma cultura que se adapta a vários tipos de solo, sendo a condução da lavoura semelhante à de abóbora. Assim como as abóboras, pode ser plantada em local definitivo (2 a 3 sementes por cova), ou por transplante de mudas semeadas em bandejas ou copinhos. Deve-se tomar o cuidado para não danificar as raízes no momento do transplante. Os frutos possuem polpa e casca alaranjadas e seus gomos são destacados. ',' São mais tolerantes que as abóboras em relação a temperaturas mais baixas e menos tolerante ao excesso de chuvas. É uma planta de clima quente, mas tolera temperaturas amenas (entre 15° a 25°C). São geralmente plantadas durante a primavera-verão.','As formas de preparo são semelhantes às da abóbora. Doces e purês são muito apreciados. Alguns pratos regionais são preparados com a moranga inteira, como camarão na moranga ou carne seca na moranga. ');
INSERT INTO "Planta" VALUES(37,21,'Morango','Fragaria X ananassa Duch.',' O morangueiro é uma planta rasteira. Forma pequenas touceiras que vão se alastrando pela emissão de estolhos (brotos). Esses brotos enraízam e formam novas plantas ao redor. Seu plantio em local definitivo é feito por mudas produzidas dos estolhos retirados da planta-mãe. A parte comestível é um pseudofruto, ou seja, um falso fruto, vermelho e rico em vitaminas A e C e sais minerais. O plantio é feito em canteiros e em solos bem drenados, para evitar o encharcamento. ',' É originário de clima frio, mas não tolera geadas. Há cultivares adaptadas a temperaturas amenas (entre 15° e 25°C). Dias curtos de outono-inverno favorecem a fruticfi ação. Temperaturas elevadas favorecem o crescimento vegetativo e deixam os frutos muito azedos.','Os morangos podem ser comercializados em caixas plásticas direto ao consumidor final ou podem ser destinados à agroindústria para a produção de sucos, geléias, doces. Pode ser ingrediente de vários produtos, como iogurtes, biscoitos e tortas. ');
INSERT INTO "Planta" VALUES(38,22,'Mostarda ou mostarda de folhas','Brassica juncea (L.) Coss.',' A mostarda é da mesma família da couve e brócolis. Há cultivares para a produção de folhas (consumo em saladas) e outras cultivares e espécies para a produção de grãos (fabricação de molhos e temperos). Para folhas, as cultivares mais plantadas são a Lisa da Flórida e Lisa de Irajá. O sabor picante é característico dessa hortaliça. É fonte de vitaminas C e A, de cálcio e possui teores moderados de ferro, sódio, potássio e magnésio. O plantio pode ser feito por mudas semeadas em bandejas ou diretamente no local definitivo, retirando as plantas em excesso.',' Prefere temperaturas mais amenas (entre 15° e 25°C).','Suas folhas são vendidas em maços e podem ser consumidas cruas ou refogadas. Tem uma vida pós-colheita bastante curta e deve ser rapidamente comercializada após colhida.45');
INSERT INTO "Planta" VALUES(39,13,'Nabo ','Brassica rapa var. rapa (L.) Thell.',' Da mesma família do repolho, da couve e do rabanete. É uma planta que produz raiz e folhas comestíveis, sendo a sua raiz mais consumida que as folhas. É fonte de fibras e sais minerais, principalmente cálcio. É semeado diretamente em local definitivo. Deve-se retirar o excesso de plantas, deixando as melhores a uma distância de 10 centímetros uma da outra. Não é muito exigente em adubação, e o solo argiloso favorece a cultura. ',' Prefere temperaturas amenas (entre 15° e 25°C) a frias, suportando geadas leves. Pode ser semeado nos períodos de outono e inverno na maioria das regiões e, ao longo do ano, em regiões de elevadas altitudes.','A comercialização é feita amarrando-se plantas inteiras em molhos, depois de serem lavadas. Pode ser consumido em saladas e sopas.');
INSERT INTO "Planta" VALUES(40,2,'Pepino','Cucumis sativus L.',' É uma planta da mesma família da abóbora e do chuchu. Pode ser trepadeira se tiver suporte. Em geral, necessita de abelhas para polinizar e formar os frutos. Há cultivares, entretanto, que produzem frutos sem a necessidade de polinização. Atualmente são encontrados cinco tipos de pepino do mercado: grupo Caipira, grupo Aodai, grupo Japonês, grupo Holandês (Beith-alpha) e grupo Agroindustrial (usado na fabricação de picles). Adapta-se melhor em solos arenosos e ricos em adubação orgânica. Pode ser plantado via semente em local definitivo ou por mudas, semeadas em bandejas. Deve-se ralear os frutinhos mal formados logo que o problema ocorrer.',' É uma cultura de clima quente, e se adapta a temperaturas amenas (entre 15° e 25°C). Frio e geada prejudicam e podem até destruir a cultura. No inverno não muito rigoroso pode ser cultivada em casas de vegetação (estufa), podendo se beneficiar dos melhores preços no mercado.','Os frutos podem ser acondicionados em caixas plásticas ou de papelão, devendo ser classificados para que o produtor obtenha melhores preços. São consumidos crus em saladas ou em conservas, na forma de picles.');
INSERT INTO "Planta" VALUES(41,1,'Pimenta','Capsicum frutescens L.; Capsicum baccatum L.; Capsicum chinense Jacq., NCapsicum praetermissum L.; Capsicum. Annuum L.',' As pimenteiras são arbustos, que produzem frutos, em sua maioria, de sabor ardido ou picante. Há, entretanto, algumas “pimentas doces”, que não ardem. São fontes de vitamina A, B e C. Há pimentas de vários formatos e cores. Preferem solos bem drenados. O plantio é feito por mudas, semeadas em bandejas, deixando 1,3 a 1,5 metro de distância entre elas. Baixas temperaturas podem provocar queda de frutinhos. ',' São exigentes em calor e sensíveis a baixas temperaturas e intolerantes a geadas. Por isso, devem ser cultivadas preferencialmente nos meses de alta temperatura. Em regiões de baixa altitude, onde o inverno é ameno, as pimentas podem ser plantadas o ano inteiro.','Podem ser vendidas in natura ou processadas na forma de pó, flocos, picles, escabeches, molhos líquidos, conservas de frutos inteiros, geléias etc. As pimentas picantes ainda são utilizadas pela indústria farmacêutica, na composição de pomadas para artrose e artrite, e também pela indústria de cosméticos, na composição de xampus anti-quedas e anticaspas. ');
INSERT INTO "Planta" VALUES(42,8,'Pimentão','Capsicum annuum L.',' O pimentão é uma das hortaliças mais ricas em vitamina C e, quando maduro, é excelente fonte de vitamina A. O plantio é feito em bandejas para posterior transplante em local definitivo. Deve ser tutorada (apoiada com estacas e arame) para não tombar. É exigente em nutrientes e se desenvolve melhor em solos com partículas médias (siltosos). É muito atacada por doenças, sendo recomendado alternar o plantio de pimentão com outras espécies (gramíneas, por exemplo), para diminuir a incidência de doença no próximo ciclo.',' É uma planta de origem tropical, produzindo melhor sob temperaturas relativamente elevadas ou amenas (entre 15° e 25°C). Não tolera frio nem geadas, razão pela qual tem crescido o seu cultivo em casas de vegetação. Onde o inverno é ameno, pode ser cultivado durante o ano todo. ','É vendido verde ou maduro, dependendo da preferência do mercado consumidor e da logística de entrega (quando colhidos maduros, a vida pós-colheita é menor). Pode ser consumido cru ou como condimento no preparo de vários pratos. Para aumentar o valor de venda ao consumidor nfi al, os pimentões podem ser acondicionados em bandejas de isopor.');
INSERT INTO "Planta" VALUES(43,21,'e popular - Quiabo','Abelmoschus esculentus (L.) Moench  ',' É um arbusto originário da África, rústico e tolerante à acidez elevada do solo. Seus frutos são ricos em Vitamina A, B1, C. Na véspera do plantio, a dormência das sementes deve ser quebrada imergindo-as em água por 24 horas. O plantio pode ser por semeadura direta ou por mudas. É pouco exigente em água. Frio intenso pode provocar queda de flores e frutos.',' Exige temperaturas altas e não tolera frio.','A comercialização deve ser feita imediatamente após a colheita, por ser um fruto altamente perecível. Para aumento da sua vida pós-colheita, deve ser armazenado e transportado sob refrigeração. Geralmente é consumido cozido, refogado ou frito, como ingrediente principal em pratos típicos da Região Nordeste (caruru) e de Minas Gerais (frango com quiabo). ');
INSERT INTO "Planta" VALUES(44,23,'Rabanete','ome popular – RabaneteNNome cientícfi o – Raphanus sativus L.',' O rabanete produz raízes de formato esférico, cor de rosa avermelhado e polpa branca. É fonte de vitamina C, minerais e fibras. Não é muito exigente em adubação. O solo deve estar sempre úmido para evitar rachaduras, mas sem excesso para não provocar doenças. Deve ser colhido antes de atingir o seu tamanho máximo (em torno de 30 dias após a semeadura), pois pode se tornar esponjoso.',' Adapta-se melhor ao cultivo nos períodos de outono e inverno, tolerando bem frio e geadas leves. ','O rabanete é consumido principalmente cru, em saladas, mas também pode ser consumido cozido ou na forma de picles. É vendido amarrando-se maços das plantas inteiras. ');
INSERT INTO "Planta" VALUES(45,12,'Repolho','me popular – RepolhoNNome cientícfi o – Brassica oleracea L. var. capitata',' O repolho possui folhas arredondadas dispostas umas sobre as outras, em forma de cabeça. É rico em fibras, sais minerais e vitaminas do complexo B, E e K. Temperaturas altas fazem com que as cabeças não fiquem bem formadas. O plantio é feito por mudas, semeadas em bandejas. É exigente em adubação e água, que deve ser fornecida constantemente para evitar rachaduras.',' Desenvolve-se bem sob temperaturas amenas (entre 15° e 25°C) e frias, resistindo bem a geadas. Entretanto, há cultivares adaptadas a temperaturas mais altas.','O repolho é consumido cru, em saladas, ou cozido em sopas, refogados, acompanhando carnes e diversos pratos orientais. Pode também ser fermentado, para preparação do chucrute, prato alemão. Para venda, as “cabeças” são acondicionadas em caixas plásticas. ');
INSERT INTO "Planta" VALUES(46,24,'Rúcula ou pinchão','e popular – Rúcula ou pinchãoNNome cientícfi o – Eruca sativa L.',' A rúcula apresenta plantas de porte baixo, suas folhas são alongadas e recortadas, de coloração verde escuro e de sabor picante. Dentre todas as hortaliças, a rúcula é a fonte mais rica em ferro. Contém ainda cálcio, fósforo, Vitaminas A e C. Propaga-se por sementes plantadas em local definitivo ou em bandejas, sendo transplantadas posteriormente. A colheita se inicia de 40 a 60 dias após a semeadura, podendo-se colher os rebrotamentos.','a ou pinchãoNNome cientícfi o – Eruca sativa L.N...Descrição – A rúcula apresenta plantas de porte baixo, suas folhas são alongadas e recortadas, de coloração verde escuro e de sabor picante. Dentre todas as hortaliças, a rúcula é a fonte mais rica em ferro. Contém ainda cálcio, fósforo, Vitaminas A e C. Propaga-se por sementes plantadas em local definitivo ou em bandejas, sendo transplantadas posteriormente. A colheita se inicia de 40 a 60 dias após a semeadura, podendo-se colher os rebrotamentos.Época e regiões para plantio - Produz melhor sob temperaturas amenas (entre 15° e 25°C). Nas regiões em que o verão é ameno, pode ser plantada durante o ano todo.','Muito apreciada na forma de saladas, sendo também utilizada no preparo de tortas, quiches, pizzas e lasanhas. Pode ser vendida em maços ou já embalada e higienizada, pronta para o consumo. Tem pequena durabilidade pós-colheita, devendo ser rapidamente comercializada e consumida.');
INSERT INTO "Planta" VALUES(47,3,'Salsa, salsinha',' popular – Salsa, salsinhaNNome cientícfi o – Petroselinum crispum (Mill.) Nym.',' É um condimento aromático cujas folhas são ricas em vitamina A. Há cultivares de folhas lisas, crespas e muito crespas. Há ainda variedades para consumo das raízes. A germinação de suas sementes é muito lenta, principalmente se a temperatura for baixa. Para acelerar a germinação, recomenda-se deixar as sementes de molho em água durante uma noite. Prefere solos bem drenados, ricos em matéria orgânica, que devem ser mantidos sempre úmidos.',' É uma planta de clima subtropical. Prefere temperaturas amenas, não muito frias, nem muito quentes (em torno de 20°C).','É vendida em maços, geralmente em conjunto com a cebolinha, conhecido como cheiro-verde. Dá aroma e sabor a diversos pratos, sendo utilizada inclusive para preparação de sucos.');
INSERT INTO "Planta" VALUES(48,25,'Taioba','e popular – TaiobaNNome cientícfi o – Xanthosoma sagittifolium (L.) Schott',' A taioba é da mesma família do inhame. Tanto as folhas quanto os tubérculos são comestíveis. Suas folhas (parte mais consumida) são ricas em vitamina A, cálcio e fósforo. Não é muito exigente em adubação, sendo uma planta rústica. Plantam-se os brotos produzidos ao redor da planta-mãe.',' É uma cultura de clima quente e exigente em chuva. Recomenda-se o plantio nos períodos de primavera e verão, entretanto pode ser plantada durante o ano todo em regiões baixas com inverno ameno, pois o frio paralisa o crescimento das folhas. ','As folhas da taioba são consumidas refogadas como a couve. Cruas causam irritação das mucosas. Podem ser ingredientes de bolinhos e recheio de pizza e tortas. Suas folhas são vendidas em maços.');
INSERT INTO "Planta" VALUES(49,6,'IGO InHAmE)Nome popular –Taro (antigo inhame)','IGO InHAmE)Nome popular –Taro (antigo inhame)NNome cientícfi o – Colocasia esculenta (L.) Schott',' Seus rizomas (caules subterrâneos) são a parte comestível, possuindo casca fibrosa e polpa branca. É fonte de carboidratos, vitaminas, ferro e fósforo. Produz melhor quando plantada em solos arenosos, mas não necessita de solo com alta fertilidade. São plantados os rizomas laterais inteiros, com o broto bem desenvolvido. Deve-se fazer a amontoa sobre as fileiras de plantas.',' Exige temperaturas elevadas e chuvas abundantes e não tolera geadas.','Pode ser consumido cozido, em sopas, refogados, saladas e sobremesas.  Também pode ser industrializado na forma de farinha para fabricação de pães e bolos. ');
INSERT INTO "Planta" VALUES(50,8,'Tomate','Lycopersicon esculentum Mill.',' É uma das hortaliças mais consumidas no mundo, sendo fonte de vitaminas A e C e de sais minerais como potássio. Há cultivares de crescimento determinado (destinadas para indústria de processamento) e de crescimento indeterminado (maioria destinada para mesa). São reunidas em cinco grupos: grupo Santa Cruz, Salada, Cereja, Italiano (ou Saladete ou San Marzano) e grupo Agroindustrial. É bastante exigente em adubação e é muito atacada por doenças, exigindo elevado conhecimento da cultura para um cultivo eficiente.',' Desenvolve-se melhor em regiões altas (serras e planaltos) de clima tropical e também em clima subtropical ou temperado, seco e com alta incidência de luz solar. Regiões muito úmidas e quentes são problemáticas para a cultura, favorecendo doenças.','Os tomates podem ser destinados a agroindústria e para consumo à mesa. São consumidos na forma de molhos prontos e caseiros, extrato (polpa concentrada), doces, sucos e cru, na salada. São geralmente comercializados a granel (depois de classificados) em caixas de plástico, bandejas plásticas ou de isopor, cobertas com filme plástico. ');
CREATE TABLE "Regiao" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Regiao" PRIMARY KEY AUTOINCREMENT,
    "Sigla" TEXT NULL,
    "Nome" TEXT NULL
);
INSERT INTO "Regiao" VALUES(4,'S','Sul');
CREATE TABLE "RegiaoImediata" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_RegiaoImediata" PRIMARY KEY AUTOINCREMENT,
    "Nome" TEXT NULL,
    "IdRegiaoInt" INTEGER NULL,
    CONSTRAINT "FK_RegiaoImediata_RegiaoIntermediaria_IdRegiaoInt" FOREIGN KEY ("IdRegiaoInt") REFERENCES "RegiaoIntermediaria" ("Id")
);
INSERT INTO "RegiaoImediata" VALUES(410007,'Foz do Iguaçu',4103);
CREATE TABLE "RegiaoIntermediaria" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_RegiaoIntermediaria" PRIMARY KEY AUTOINCREMENT,
    "Nome" TEXT NULL,
    "IdUF" INTEGER NULL,
    CONSTRAINT "FK_RegiaoIntermediaria_UF_IdUF" FOREIGN KEY ("IdUF") REFERENCES "UF" ("Id")
);
INSERT INTO "RegiaoIntermediaria" VALUES(4103,'Cascavel',41);
CREATE TABLE "UF" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_UF" PRIMARY KEY AUTOINCREMENT,
    "Sigla" TEXT NULL,
    "Nome" TEXT NULL,
    "IdRegiao" INTEGER NULL,
    CONSTRAINT "FK_UF_Regiao_IdRegiao" FOREIGN KEY ("IdRegiao") REFERENCES "Regiao" ("Id")
);
INSERT INTO "UF" VALUES(41,'PR','Paraná',4);
CREATE TABLE "User" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_User" PRIMARY KEY AUTOINCREMENT,
    "Nome" TEXT NULL,
    "IdEstado" INTEGER NULL,
    "IdCidade" INTEGER NULL,
    "IdNetUser" INTEGER NULL,
    CONSTRAINT "FK_User_Cidade_IdCidade" FOREIGN KEY ("IdCidade") REFERENCES "Cidade" ("Id"),
    CONSTRAINT "FK_User_Estado_IdEstado" FOREIGN KEY ("IdEstado") REFERENCES "Estado" ("Id")
);
INSERT INTO "User" VALUES(1,'Daniel',41,4116059,NULL);
CREATE TABLE "__EFMigrationsHistory" (
    "MigrationId" TEXT NOT NULL CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY,
    "ProductVersion" TEXT NOT NULL
);
INSERT INTO "__EFMigrationsHistory" VALUES('20230609213938_CreateMigration','7.0.5');
CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" ("RoleId");
CREATE UNIQUE INDEX "RoleNameIndex" ON "AspNetRoles" ("NormalizedName");
CREATE INDEX "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" ("UserId");
CREATE INDEX "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" ("UserId");
CREATE INDEX "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" ("RoleId");
CREATE INDEX "EmailIndex" ON "AspNetUsers" ("NormalizedEmail");
CREATE UNIQUE INDEX "UserNameIndex" ON "AspNetUsers" ("NormalizedUserName");
CREATE INDEX "IX_Cidade_IdMicrorregiao" ON "Cidade" ("IdMicrorregiao");
CREATE INDEX "IX_Cidade_IdRegiaoImediata" ON "Cidade" ("IdRegiaoImediata");
CREATE INDEX "IX_EpocaRegiaoPlanta_IdPlanta" ON "EpocaRegiaoPlanta" ("IdPlanta");
CREATE INDEX "IX_Estado_IdRegiao" ON "Estado" ("IdRegiao");
CREATE INDEX "IX_Mesorregiao_IdUF" ON "Mesorregiao" ("IdUF");
CREATE INDEX "IX_Microrregiao_IdMessorregiao" ON "Microrregiao" ("IdMessorregiao");
CREATE INDEX "IX_Planta_IdDias" ON "Planta" ("IdDias");
CREATE INDEX "IX_RegiaoImediata_IdRegiaoInt" ON "RegiaoImediata" ("IdRegiaoInt");
CREATE INDEX "IX_RegiaoIntermediaria_IdUF" ON "RegiaoIntermediaria" ("IdUF");
CREATE INDEX "IX_UF_IdRegiao" ON "UF" ("IdRegiao");
CREATE INDEX "IX_User_IdCidade" ON "User" ("IdCidade");
CREATE INDEX "IX_User_IdEstado" ON "User" ("IdEstado");
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('Regiao',4);
INSERT INTO "sqlite_sequence" VALUES('Estado',41);
INSERT INTO "sqlite_sequence" VALUES('UF',41);
INSERT INTO "sqlite_sequence" VALUES('Mesorregiao',4106);
INSERT INTO "sqlite_sequence" VALUES('RegiaoIntermediaria',4103);
INSERT INTO "sqlite_sequence" VALUES('Microrregiao',41024);
INSERT INTO "sqlite_sequence" VALUES('RegiaoImediata',410007);
INSERT INTO "sqlite_sequence" VALUES('Cidade',4116059);
INSERT INTO "sqlite_sequence" VALUES('User',1);
INSERT INTO "sqlite_sequence" VALUES('DiasPlanta',25);
INSERT INTO "sqlite_sequence" VALUES('EpocaRegiao',127);
INSERT INTO "sqlite_sequence" VALUES('Planta',50);
COMMIT;
