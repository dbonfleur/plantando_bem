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
INSERT INTO "Estado" VALUES(41,'PR','Paran�',4);
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
INSERT INTO "Microrregiao" VALUES(41024,'Foz do Igua�u',4106);
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
INSERT INTO "Planta" VALUES(1,1,'Ab�bora','Cucurbita moschata Duch.',' � uma cultura tipicamente tropical com frutos ricos em vitamina A. Tamb�m fornece vitaminas do complexo B, c�lcio e f�sforo. Na mesma planta encontram-se flores femininas (que originam os frutos) e masculinas (que fornecem o p�len). Para boa produtividade e frutos sem deforma��es, � necess�ria a presen�a de abelhas para a poliniza��o. Os tipos mais encontrados s�o:  seca (frutos grandes),  baianinha (casca rajada) e japonesa ou caboti� (casca verde-escuro). No caso das ab�boras h�bridas (caboti�), para o pegamento dos frutos, � preciso que outra esp�cie, plantada 15 dias antes do h�brido, forne�a o p�len ou seja aplicado horm�nio sint�tico nas flores.',' � favorecida por temperaturas elevadas. Tolera temperaturas amenas (entre 15� e 25�C), mas n�o resiste a geadas. Dias curtos, com menor exposi��o do Sol, favorecem a flora��o feminina, resultando em maior produtividade. Em regi�es de inverno suave, � poss�vel plantar o ano todo, desde que haja irriga��o.','� consumida em saladas, cozidos, refogados, sopas, pur�s, p�es, bolos, pudins e doces. As sementes s�o ricas em ferro e podem ser torradas e consumidas como aperitivo. S�o tamb�m vermicidas. Tem-se observado um crescimento na venda da ab�bora j� processada (cortada e embalada) e de sementes j� torradas e salgadas.');
INSERT INTO "Planta" VALUES(2,2,'Abobrinha italiana, abobrinha verde, abobrinha','Cucurbita pepo L.',' Seus frutos s�o de f�cil digest�o, ricos em niacina, e fonte de vitaminas do complexo B. As abobrinhas s�o produzidas de forma semelhante � ab�bora, mas s�o colhidas ainda imaturas (verdes). Podem ser semeadas diretamente no local de plantio ou em bandejas para transplante. Mas cuidado: s�o sens�veis ao transplantio, j� que suas ra�zes n�o se recuperam depois de danificadas. A cultura � sens�vel ao excesso de �gua no solo. O in�cio da colheita depender� da cultivar escolhida e do ponto de matura��o exigido pelo consumidor.',' Desenvolve-se melhor sob temperaturas amenas (entre 15� e 25�C). Temperaturas elevadas podem prejudicar a poliniza��o. N�o tolera geadas. ','A abobrinha pode ser consumida refogada no �leo ou azeite, cozida, em saladas frias, como sufl�, frita � milanesa, recheada ou como ingrediente em bolos, pizza e pastel�es. Seu cozimento � r�pido e n�o � necess�rio acrescentar �gua, pois a �gua da abobrinha � suficiente para cozinh�-la. � comercializada em caixas pl�sticas e vendida ao consumidor final a granel ou em bandejas, com os frutos inteiros ou j� cortados.');
INSERT INTO "Planta" VALUES(3,3,'Acelga ','Beta vulgaris L. var. cicla',' A acelga � da mesma fam�lia da beterraba e se diferencia pelo grande desenvolvimento das folhas e do talo, que s�o as partes comest�veis. Rica em fibras e vitaminas A e C, al�m de ser fonte de sais minerais como c�lcio e ferro. A semeadura � feita em bandejas para a produ��o de mudas ou diretamente no canteiro, sendo necess�rio o raleio (elimina��o das plantas em excesso) nesse �ltimo caso. O ciclo pode prolongar-se por cerca de 100 dias, sendo que a colheita inicia-se entre 60 � 70 dias ap�s o plantio.',' Desenvolve-se melhor sob temperaturas amenas (entre 15� e 25�C), sendo plantadas geralmente nos per�odos de outono e inverno em regi�es de baixa altitude. Em regi�es mais altas, com ver�o suave, pode-se plantar durante todo o ano.','Pode ser consumida crua, em saladas, e refogada como a couve. � vendida em ma�os, e os caules podem ser consumidos fritos ou cozidos em sopas.');
INSERT INTO "Planta" VALUES(4,3,'Agri�o ','Nasturtium officinale sp.',' � uma planta semiperene, podendo ser plantada em �gua ou em terra seca. � uma hortali�a folhosa, rica em vitamina C e em sais minerais, como o ferro. Seus talos s�o ricos em iodo. � semeada em bandejas ou em sementeiras, sendo posteriormente transplantada para o local definitivo. As estacas retiradas de culturas adultas tamb�m podem ser utilizadas para o plantio. A colheita pode ser feita quando as folhas j� t�m um bom tamanho, podendo ser repetida por quatro vezes ou mais. O primeiro corte se d� por volta de 60 dias ap�s o plantio.',' Desenvolve-se melhor sob temperaturas amenas (entre 15� e 25�C), sendo plantado geralmente nos per�odos de outono e inverno. Onde o ver�o n�o � muito quente, pode ser plantado o ano inteiro.','Pode ser usado cru, em saladas, molhos, p�es, sopas e cozidos. Tamb�m � utilizado com mel na medicina popular para curar tosse e bronquite. � vendido em ma�os ou minimamente processado, j� desinfetado, em embalagens com outras hortali�as. ');
INSERT INTO "Planta" VALUES(5,4,'Alcachofra','Cynara scolymus L.',' A parte comest�vel � o bot�o floral. � fonte de vitamina C, �cido f�lico, magn�sio e pot�ssio. � uma cultura perene, plantada por brotos retirados de plantas selecionadas. As mudas devem ter uma parte subterr�nea que contenha algumas ra�zes e a parte a�rea com 5 a 7 folhas. De cada planta s�o colhidos cerca de 20 bot�es.',' A cultura exige frio para se desenvolver bem, mas � sens�vel a geada.','As flores s�o consumidas cozidas. Deve-se retirar a parte fibrosa central de cada alcachofra, isto �, os �espinhos�. Pode acompanhar carnes ou compor molhos e tortas. ');
INSERT INTO "Planta" VALUES(6,5,'Alface','Lactuca sativa L. ',' � uma hortali�a de folhas comest�veis. As folhas podem ser lisas ou crespas, com ou sem forma��o de cabe�a. Tamb�m existem alfaces com folhas roxas ou folhas bem recortadas. � uma importante fonte de sais minerais, principalmente de c�lcio e de vitaminas, especialmente a vitamina A. A alface deve ser colhida antes do in�cio do pendoamento (emiss�o do pend�o floral), momento em que as folhas come�am a apresentar um sabor amargo caracter�stico. O plantio em local definitivo � feito por mudas semeadas em bandejas ou copinhos.',' Pode ser cultivada durante o ano todo, em todas as regi�es do Brasil, a depender da cultivar escolhida, j� que existem variedades adaptadas a climas mais quentes e outras para plantio em regi�es de clima ameno.','Todas as folhas podem ser aproveitadas. As alfaces roxa e verde s�o consumidas predominantemente em saladas frescas. A alface americana � mais crocante e, al�m de seu uso em saladas, � indicada para o preparo de sandu�ches por ser mais resistente ao calor. Podem ser limpas e embaladas em agroind�stria, sendo vendidas j� prontas para consumo. ');
INSERT INTO "Planta" VALUES(7,6,'Alho','Allium sativum L.',' O alho � um condimento mundialmente utilizado na culin�ria, sendo uma cultura muito antiga. � rico em vitaminas do complexo B e cont�m expressiva quantidade de f�sforo. O bulbo cont�m bulbilhos (dentes) capazes de originar uma nova planta ap�s brota��o. A planta necessita de dias longos e frios para formar o bulbo. Visando induzir a forma��o de bulbos, foi desenvolvida a t�cnica de vernaliza��o (expor os bulbos ao frio em c�mara fria), sendo essa pr�tica �til para algumas cultivares. ',' A escolha da cultivar adequada ao clima da regi�o � essencial para o sucesso da cultura. As cultivares de ciclo curto ou precoces s�o menos exigentes de temperaturas frias e de quantidade de horas di�rias de luz. As de ciclo mediano s�o um pouco mais exigentes de frio e horas de luz, enquanto as cultivares tardias exigem, no m�nimo, 13 horas de luz por dia, podendo ser plantadas no extremo sul do Brasil ou no centro-sul, somente ap�s a vernaliza��o dos bulbos.','Pode ser usado na fabrica��o de molhos, pastas e temperos prontos pela agroind�stria. O alho tamb�m tem sido vendido na forma de chips e frito, pronto para o consumo. � utilizado para temperar grande parte dos alimentos preparados em casa: sopas, arroz, feij�o, carnes, molhos e massas.');
INSERT INTO "Planta" VALUES(8,1,'Alho-porro','Allium ampeloprasum L.',' A planta lembra o alho, por�m � maior, com folhas mais largas e alongadas, de cor verde-escura. Apresenta consider�veis teores de vitaminas A, B e C. Produz melhor em solos de textura m�dia (entre argiloso e arenoso), solto e leve. O plantio por mudas � o mais indicado, transplantando-se as mudas quando atingirem cerca de 12 cent�metros de altura. Um trato cultural recomendado � a amontoa, que � a chegada de terra junto �s plantas para provocar a produ��o de longas hastes brancas (na verdade, folhas modificadas).',' � planta t�pica de frio e deve ser plantada nos per�odos de  outono e inverno.','No Brasil, ainda � pouco usado na culin�ria, por�m seu uso tem aumentado nas agroind�strias para produ��o de sopas desidratadas. Pode ser usado em saladas, para temperar carnes e pratos finos, al�m de sopas. Deve ser manuseado com cuidado para evitar escurecimento do talo.');
INSERT INTO "Planta" VALUES(9,3,'Almeir�o ou chic�ria amarga','Cichorium intybus L.',' Suas folhas s�o alongadas, em forma de lan�a e constituem a parte comest�vel. Fornece vitaminas A, C e do complexo B, sendo boa fonte de f�sforo e ferro. Deve ser plantado diretamente no campo, pois suas ra�zes n�o suportam o transplante. As plantinhas em excesso devem ser eliminadas, obedecendo ao espa�amento de 15 a 20 cent�metros entre as plantas. � uma cultura bastante exigente em �gua, portanto, deve-se irrigar bem e com frequ�ncia.',' Produz melhor sob temperaturas amenas (entre 15� e 25�C), sendo plantado geralmente nas esta��es de outono e inverno.','Pode ser consumido cru em saladas ou refogado como a couve, podendo substitu�-la. Tamb�m pode ser usado no preparo de tortas, bolinhos e sopas ou como acompanhamento do arroz e feij�o. � vendido em ma�os de folhas.');
INSERT INTO "Planta" VALUES(10,1,'e popular - Batata','Solanum tuberosum ssp. tuberosum',' Origin�ria dos Andes, a batateira produz caules modicfi ados (tub�rculos) ricos em carboidratos, muito utilizados na alimenta��o humana. A batata tamb�m � fonte importante de f�sforo e vitaminas do grupo B. O tub�rculo com brota��es � a estrutura usada para plantio das lavouras de batata para consumo. Adapta-se melhor a solos arenosos, arejados e bem drenados, o que dicfi ulta o aparecimento de doen�as. A colheita � feita quando as ramas j� est�o secando e tombando.',' No centro-sul, pode-se plantar o ano inteiro. Entretanto, os plantios de inverno e primavera s�o melhores que os de ver�o, pois a cultura se desenvolve melhor sob temperaturas amenas (entre 15� e 25�C), sofrendo menor incid�ncia de doen�as. Temperaturas altas noturnas (acima de 20�C) por mais de 60 dias inviabiliza a produ��o de tub�rculos. ','A batata � uma hortali�a consumida em todo o mundo, das mais diversas formas. Acompanha carnes, peixes e aves, podendo ser cozida, assada ou frita. � utilizada na forma de pur�s, em massas (nhoque), salgados, tortas e sopas. Ultimamente tem-se observado crescimento na venda da batata j� processada (cortada e embalada) juntamente com outras hortali�as, como chuchu e cenoura, para o preparo de sopas e maioneses.');
INSERT INTO "Planta" VALUES(11,7,'Batata-doce','Ipomoea batatas L.',' A batata-doce � origin�ria de regi�es tropicais da Am�rica do Sul, sendo suas ra�zes tuberosas as partes de maior interesse para alimenta��o, por serem ricas em amido e a��cares. A polpa e a casca possuem cores que variam de branco ao roxo, passando pelo creme e alaranjado. � uma cultura r�stica, pouco exigente em nutrientes e �gua, por�m requer um bom preparo do solo (ara��o e gradagem). Adapta-se melhor a solos arenosos e arejados. A propaga��o pode ser feita pela pr�pria batata-doce brotada, pelos brotos destacados da batata, ramas velhas e ramas novas, sendo esta �ltima a forma que fornece melhor resultado. Enterram-se de 3 a 4 entren�s (espa�o entre dois n�s de tronco ou caule) da rama, deixando a ponteira com as folhas para fora da terra. A colheita deve preferencialmente ser feita com a terra seca, quando as ra�zes atingirem o tamanho desejado.',' A cultura da batata-doce se desenvolve bem em temperaturas mais elevadas. O frio pode reduzir a produtividade e aumentar o ciclo da cultura. N�o tolera geadas. Em regi�es de baixa altitude, com inverno suave, � poss�vel plantar durante todo o ano.','A batata-doce pode se consumida cozida, assada ou frita, acompanhando diversos pratos. At� os brotos e folhas podem ser consumidos, refogados ou em sopas. Na ind�stria, a batata-doce � mat�ria-prima para fabrica��o de �lcool, farinha (amido), p�es e doces. As ra�zes e ramas tamb�m podem ser usadas na alimenta��o animal. ');
INSERT INTO "Planta" VALUES(12,8,'Berinjela','Nome popular � BerinjelaNNome cient�fico - Solanum melongena L.',' � uma planta arbustiva, resistente e vigorosa. Produzem frutos roxo-escuros ou quase negros. � rica em vitamina A, B1, B2, B5, C, pot�ssio, f�sforo, cloro, c�lcio, s�dio, ferro, magn�sio e enxofre. O plantio � realizado via semente, em bandejas com posterior transplantio para o campo.',' � uma planta de clima quente, sendo favorecida pelo calor, principalmente para a germina��o, emerg�ncia e forma��o da muda.','Pode ser consumida cozida, em pratos frios ou quentes, e frita � milanesa em fatias finas. Tamb�m pode ser ingrediente no preparo de pat�s, molhos, recheada, omelete e muitos outros pratos. Seu suco � diur�tico, diminui o colesterol e reduz a a��o das gorduras sobre o f�gado.');
INSERT INTO "Planta" VALUES(13,3,'Bertalha, bretalha, couve-de-cerca, jo�o-gomes, espinafre-indiano (�sia), folha-Ntartaruga (�frica)','Basella alba e Basella rubra',' A bertalha � uma hortali�a trepadeira, de folhas suculentas, brilhantes e de formato ovalado ou de cora��o. � uma boa fonte de vitaminas A e C, al�m de c�lcio, ferro e f�sforo. A cultura prefere solos arenosos e ricos em mat�ria org�nica. As sementes devem permanecer 24 horas de molho em �gua antes da semeadura, para quebrar a dorm�ncia. A propaga��o � feita por sementes plantadas em sementeiras ou bandejas para posterior transplante ou por ramos plantados diretamente no canteiro. O transplante das mudas � feito 20 dias ap�s a germina��o. A planta pode ser tutorada (apoiada com estacas e arame) ou, dependendo da variedade, a lavoura pode ser conduzida de forma rasteira, com cortes sucessivos Colhem-se os ramos terminais quando atingem de 40 a 50 cent�metros.',' Desenvolve-se melhor em regi�es ensolaradas e com temperaturas mais elevadas. Chuvas abundantes e bem distribu�das favorecem a cultura. N�o tolera geadas.','A bertalha pode substituir a couve ou o espinafre. Suas folhas e ramos podem ser consumidos crus em saladas, ou cozidos em sopas, refogados e recheios de tortas, panquecas e de outros pratos. Os ramos s�o comercializados em ma�os.');
INSERT INTO "Planta" VALUES(14,3,'Beterraba','Beta vulgaris L.',' � uma hortali�a bastante consumida no Brasil, cuja parte tuberosa tem sabor doce e colora��o roxa. � fonte de sais minerais, principalmente ferro, e a��car. Deve-se quebrar a dorm�ncia das sementes colocando-as de molho por 24 horas antes da semeadura e lavando-as em seguida. Pode ser plantada via semente em local definitivo ou em bandejas e sementeiras para posterior transplante, quando tiverem 4 a 5 folhas. Para produzir sementes, a cultura deve passar por um per�odo de frio intenso. ',' Desenvolve-se melhor sob temperaturas amenas (entre 15� e 25�C) ou baixas e resiste ao frio e geadas. N�o tolera temperaturas e umidade muito elevadas.','A raiz deve ser preferencialmente consumida crua e ralada, na forma de salada ou em sucos. Tamb�m pode ser consumida cozida, em sopas, em sucos e no preparo de bolos e sufl�s. Pode ser comercializada, j� embalada, na forma minimamente processada (cubos, ralada, em rodelas). As folhas tamb�m podem ser consumidas, refogadas como couve ou em omeletes e bolinhos, sopas. ');
INSERT INTO "Planta" VALUES(15,9,'Br�colis, br�coli, br�colos ou couve-br�colos','Ou COuvE-BR�COLOSNome popular � Br�colis, br�coli, br�colos ou couve-br�colosNNome cient�fico - Brassica oleracea L. var. italica Plenck',' Planta verde escura da mesma fam�lia da couve, da couve-ofl r, do repolho e do agri�o (brassicacea). Produz inofl resc�ncias (conjunto de ofl res) comest�veis. Podem ser do tipo �cabe�a�, ou do tipo �ramoso�. � fonte de vitamina C, A, c�lcio, ferro, f�sforo e bfi ras. � uma cultura exigente em aduba��o de micronutrientes, especialmente boro e molibd�nio. A colheita deve ser feita quando os bot�es ofl rais est�o bem desenvolvidos, ainda com colora��o verde-escuro, mas antes da abertura das ofl res. ',' J� existem cultivares adaptadas a clima mais quente. A escolha da cultivar ideal, em rela��o ao clima da regi�o e altitude, � fundamental. Para fazer a melhor escolha, o produtor deve consultar o cat�logo de cultivares da esp�cie.','O br�colis pode ser consumido cru, quando muito novinho, ou cozido em saladas, sopas, sufl�s, refogado no arroz ou outros pratos. � uma hortali�a pouco dur�vel e deve ser consumida rapidamente ap�s a colheita, exigindo uma boa coordena��o entre quem produz e distribui as hortali�as.');
INSERT INTO "Planta" VALUES(16,10,'e popular - Cebola','e popular - CebolaNNome cient�fico - Allium cepa L.',' � planta origin�ria da �sia, sendo que a parte utiliz�vel � um bulbo originado de folhas carnosas. � rica em vitaminas do complexo B, principalmente B1 e B2, e vitamina C. Pode ser semeada em local definitivo e em bandejas ou sementeiras para posterior transplante das mudas. O plantio tamb�m pode ser feito por bulbinhos, colhidos com 1 a 3 cent�metros de di�metro. Existe no mercado cultivares adaptadas a per�odos de dias mais curtos e mais longos, de ciclo curto, mediano e longo.',' De modo geral, n�o forma bulbos em dias com dura��o inferior a 10 horas de luz. Os bulbos crescem e amadurecem mais rapidamente sob temperaturas altas. Mas a alta temperatura n�o tem efeito, se as horas de luz di�rias exigidas n�o forem suficientes. Plantas expostas a um per�odo prolongado de frio s�o induzidas a florescer, o que � desej�vel somente a produtores de sementes.','� usada principalmente para real�ar o sabor dos alimentos. Pode ser consumida em saladas, no preparo de sopas, carnes, pat�s, pizzas, biscoitos, frita � milanesa ou assada. Tamb�m pode ser comercializada na forma de conservas e pastas.23');
INSERT INTO "Planta" VALUES(17,11,'Cebolinha','Allium schoenoprasum L.; Allium fistulosum L.',' As plantas de cebolinha se parecem com as de cebola, por�m possuem um n�mero maior de folhas que formam uma touceira. As folhas s�o uma boa fonte de c�lcio, vitamina C e vitamina A. � propagada por sementes ou pelo plantio de parte da touceira. Devido � capacidade de rebrota, podem ser feitas v�rias colheitas.',' Produz melhor sob temperaturas amenas a frias (de 25�C para baixo), sendo plantadas geralmente nas esta��es de outono e inverno.','� utilizada para dar aroma e sabor a pratos variados, como sopas, carnes, peixes e assados em geral. Pode ser congelada para aproveitamento posterior. Geralmente � comercializada em ma�os juntamente com a salsa ou o coentro, o chamado cheiro-verde.');
INSERT INTO "Planta" VALUES(18,12,'Cenoura','Daucus carota L.',' A cenoura � uma planta cuja parte comest�vel � a raiz tuberosa de cor alaranjada. Tem alto teor de betacaroteno, subst�ncia necess�ria � produ��o de vitamina A pelo nosso organismo. Tamb�m fornece c�lcio, s�dio e pot�ssio. O solo deve ser bem fofo, sem qualquer obst�culo ao crescimento das ra�zes, para que n�o ocorram deforma��es. O amarelecimento e o secamento das folhas mais velhas e o arqueamento das folhas mais novas s�o indicativos do ponto de colheita.',' A faixa ideal para uma germina��o r�pida e uniforme das sementes � de 20� a 30�C. Para cultivares de ver�o, baixas temperaturas no campo induzem as plantas a florescerem, o que s� � desej�vel para produtores de sementes . Deve-se atentar � adequa��o da cultivar com o clima na �poca de plantio. ','Al�m do consumo in natura em saladas (crua ou cozida) e na forma de bolo, p�o, pur�, sufl�, creme, doce ou suco, tamb�m � utilizada como mat�ria-prima para ind�strias processadoras de alimentos. Assim, s�o comercializadas na forma minimamente processada (minicenouras, cubos, ralada, em rodelas) ou processada na forma de seleta de legumes, alimentos infantis e sopas instant�neas. ');
INSERT INTO "Planta" VALUES(19,3,'Chic�ria, escarola ou end�via','Cichorium endivia L.',' Parecida com a alface, a chic�ria possui dois tipos de cultivares: a lisa (chamada escarola) e a crespa (chamada end�via). � rica em bfi ras, vitaminas e minerais, em especial o pot�ssio.',' Produz melhor sob temperaturas n�o muito altas (amenas), entre 15� a 25�C, sendo semeada normalmente nos per�odos de outono e inverno. Em regi�es altas de clima ameno, pode ser plantada o ano todo.','Pode ser consumida crua em saladas e refogada, como a couve. Substitui a couve em sopas, omeletes e at� em sucos. N�o deve ser cozida em excesso, pois perde suas propriedades nutricionais devido ao calor.');
INSERT INTO "Planta" VALUES(20,8,'Chuchu','Sechium edule Sw.',' � uma planta de h�bito trepador e seus frutos s�o ricos em fibras, vitaminas A, B1 e C e sais minerais como o pot�ssio. Na mesma planta encontram-se flores femininas (que originam os frutos) e masculinas (que fornecem o p�len). O solo deve ser bem drenado, e o plantio � feito colocando na cova o fruto brotado, maduro e sem doen�as. N�o se deve enterrar ou cobrir de terra inteiramente o chuchu. A cultura � muito exigente em �gua. No inverno, as ramas e folhas secas devem ser retiradas.',' Produz bem sob temperaturas amenas (entre 15� e 25�C), por�m n�o tolera frio excessivo. Calor e chuvas em excesso provocam queda das flores e ataque por doen�as causadas por fungos.','� consumido cozido em sopas e refogados, sufl�s, tortas e em saladas frias. Atualmente tem-se observado o crescimento do com�rcio de chuchu cortado e embalado para o preparo de sopas.');
INSERT INTO "Planta" VALUES(21,13,'Coentro ','C oriandrum sativum L.',' � uma hortali�a condimentar da mesma fam�lia da cenoura, da salsa e da mandioquinha-salsa. O coentro � rico em vitaminas A, B1, B2 e C. Normalmente � plantado em local definitivo, via semente. As plantinhas devem ser desbastadas, ficando distanciadas de 8 a 10 cent�metros uma da outra. � pouco exigente em rela��o ao solo e muito tolerante � acidez.',' � uma cultura de clima quente e n�o tolera baixas temperaturas.','D� aroma e sabor a variados pratos. Pode ser ingrediente de sopas, saladas, carnes e peixes e cozidos em geral. Deve ser colocado ao final do preparo, para n�o ficar murcho. O coentro � geralmente comercializado em conjunto com a cebolinha, composi��o chamada cheiro-verde. 28');
INSERT INTO "Planta" VALUES(22,14,'Couve manteiga ou couve de folhas','Brassica oleracea L. var. acephala D.C.',' Apresenta caule ereto e emite novas folhas continuamente ao redor do caule. � muito rica em nutrientes, especialmente c�lcio, ferro e vitaminas A, C, K e B5. Propaga-se por semente ou por plantio do broto lateral. Essa � a forma de propaga��o mais comum. A cultura � bastante exigente em boro e molibd�nio.',' A couve � uma cultura t�pica dos per�odos de outono e inverno, apresentando certa toler�ncia ao calor. Pode ser plantada durante o ano todo, mas as �pocas mais indicadas por regi�o est�o descritas abaixo.','As folhas da couve podem ser comercializadas em ma�os e na forma minimamente processada, ou seja, j� picadas e embaladas. A couve pode ser consumida crua, em sucos e saladas, refogada ou como ingrediente de sopas, farofas e cozidos. Deve ser comercializada e consumida em pouco tempo, pois sua vida �til � curta, quando n�o congelada.');
INSERT INTO "Planta" VALUES(23,3,'Couve-chinesa ou repolho chin�s, chamada erroneamente de acelga.','Brassica pekinensis (Lou.). ',' A couve-chinesa possui folhas de cor verde-claro com a parte central branca. Fonte de �cido f�lico (importante para a forma��o do sangue), al�m de vitamina A, vitaminas do grupo B e C, al�m de c�lcio e pot�ssio. S�o semeadas em bandejas e depois transplantadas para o canteiro definitivo, ou diretamente no canteiro, sendo necess�rio selecionar as melhores plantas.',' A maioria das cultivares tem melhor produ��o sob temperaturas amenas (entre 15� e 25�C), mas h� cultivares mais tolerantes ao calor.','As folhas podem ser consumidas cruas ou cozidas. � muito usada na culin�ria oriental na prepara��o de macarr�o e carnes. Pode ser usada em sopas, tortas, misturadas no arroz e na salada (folhas cruas). ');
INSERT INTO "Planta" VALUES(24,15,'Couve-flor','Brassica oleracea var. botritys',' � uma hortali�a rica em c�lcio e f�sforo e fonte de folato e vitamina C. A parte comest�vel � a infloresc�ncia (conjunto de floretes) ainda imatura, antes da abertura das flores. As mudas devem ser produzidas em substrato enriquecido com c�lcio e f�sforo e pobre em nitrog�nio. Assim como o br�colis, � muito exigente em aduba��o com boro e molibd�nio. Deve-se irrigar bem a lavoura de couve-flor, mas sem excesso, para n�o favorecer o aparecimento de doen�as. Algumas folhas devem ser mantidas para a prote��o da cabe�a durante o transporte que, preferencialmente, deve ser feito sob refrigera��o.',' � fundamental a escolha da cultivar correta de acordo com a �poca de plantio, pois h� cultivares adaptadas a temperaturas mais quentes e a temperaturas mais amenas, entre 15� e 25�C.','� consumida cozida em saladas, tortas, sopas e molhos, al�m de pratos fritos ou assados. Deve-se cozinh�-la antes de fritar ou assar. A couve-ofl r comercializada na forma minimamente processada vem apresentando crescimento consider�vel em diversos supermercados. A cabe�a � cortada em pequenos ofl retes, que s�o acomodados em bandejas envoltas por lfi mes pl�sticos.');
INSERT INTO "Planta" VALUES(25,3,'Ervilha','Pisum sativum L.',' A ervilha � uma planta semelhante a feij�o-vagem. Produz gr�os tanto para a agroind�stria (cultivares para debulhar, que geram gr�os secos e verdes) quanto para consumo em vagem comest�vel. As ervilhas s�o hortali�as muito nutritivas e fornecem boa quantidade de vitaminas A, C e B, minerais e fibras. A semeadura � feita diretamente no local definitivo, pois n�o tolera o transplante. Para a produ��o de vagens comest�veis, a colheita deve se iniciar de 60 a 100 dias ap�s o plantio, com os gr�os ainda em desenvolvimento, dependendo da cultivar.',' Exige temperaturas amenas a frias (de 25�C para baixo), adaptando-se �s condi��es dos per�odos de outono e inverno das regi�es Sul, Sudeste e Centro-Oeste. Para n�o prejudicar a qualidade dos gr�os secos, n�o devem ocorrer chuvas no in�cio da colheita. ','A ervilha � muito usada no preparo de pratos orientais (arroz colorido) e no recheio de massas, panquecas e cachorro-quente. � muito apreciada em saladas frias. Tanto as vagens comest�veis quanto os gr�os (verdes e secos) s�o consumidos cozidos.');
INSERT INTO "Planta" VALUES(26,5,'Espinafre','Spinacea oleracea L',' H� duas hortali�as conhecidas como espinafre. O mais encontrado no Brasil � o espinafre da Nova zel�ndia, planta que produz grandes folhas carnosas de cor verde-escuro. � rico em vitamina A, do complexo B e sais minerais, principalmente ferro. Recomenda-se a semeadura em bandejas para posterior transplante. Tamb�m � poss�vel enraizar os seus ramos cortados pela base. Suas folhas devem ser colhidas antes que a planta emita o pend�o e forme flores. Podem ser feitos cortes sucessivos, os quais estimulam a produ��o de novas folhas.',' Pode ser cultivado numa ampla faixa de temperatura, mas produz melhor sob temperaturas amenas (entre 15� e 25�C), com resist�ncia ao calor. N�o tolera frio excessivo. ','Pode ser consumido cru em saladas ou refogado, como a couve, em sopas, cremes, molhos, tortas, omeletes e at� em sucos. � comercializado em ma�os.');
INSERT INTO "Planta" VALUES(27,3,'Feij�o-vagem ou vagem','Phaseolus vulgaris L.',' O feij�o-vagem � rico em prote�na, importante para a forma��o dos m�sculos. Possui cultivares de tr�s tipos: grupo macarr�o (vagem cil�ndricas), grupo manteiga (vagens achatadas) e as do grupo rasteiro (vagem cil�ndrica e planta de crescimento determinado). Deve ser semeado diretamente no local definitivo de plantio. Temperaturas extremas (calor ou frio excessivo) podem provocar queda de flores ou vagens deformadas pela defici�ncia na poliniza��o. O ponto de colheita ideal � quando as vagens atingem o m�ximo de desenvolvimento, antes de se tornarem fibrosas.',' N�o tolera baixas temperaturas e geadas, desenvolvendo-se melhor sob temperaturas amenas (entre 15� e 25�C) a altas. Em regi�es com inverno ameno, � poss�vel o plantio durante o ano todo.','Vagens s�o consumidas cozidas, em pouca �gua ou no vapor, para n�o perderem muitos nutrientes. S�o utilizadas em saladas, cozidos, tortas, sopas e farofas. Podem ser comercializadas a granel, em por��es j� pesadas, acondicionadas em bandejas ou cortadas, higienizadas e embaladas.');
INSERT INTO "Planta" VALUES(28,16,'Gengibre','Zingiber officinale Roscoe',' O gengibre � uma planta que pode chegar a 1,20 metro de altura. Os rizomas, que s�o caules localizados embaixo da terra, s�o utilizados tanto para o consumo humano quanto para o plantio. S�o ricos em vitamina A, B, B2, B5, C, pot�ssio, s�dio. A planta cresce entre 90 e 120 cent�metros e suas folhas s�o em forma de lan�a. Prefere solos arenosos, bem drenados e ricos em mat�ria org�nica. Deve-se fazer a amontoa, ou seja, cobrir com terra a �rea onde est�o desenvolvendo os rizomas, para que eles n�o fiquem expostos ao sol. ',' Os rizomas se desenvolvem melhor em climas tropicais e subtropicais. A planta � sens�vel � geada, e temperaturas abaixo de 13�C podem paralisar seu crescimento.','Com o gengibre, podem ser preparados condimentos, refrigerantes, licores, cervejas e conservas. Com o �leo, preparam-se cosm�ticos. � utilizado como condimento de pratos chineses e japoneses, picles e para o preparo do quent�o (bebida alco�lica com gengibre levada ao fogo).');
INSERT INTO "Planta" VALUES(29,6,'Inhame (antigo car�).','Dioscorea alata L. ; Dioscorea rotundata Poir; Dioscorea cayenensis',' � uma planta trepadeira, mas se adapta bem � cultura rasteira. Suas folhas t�m formato de ponta de lan�a e s�o estreitas. � alimento rico em carboidratos e tamb�m se destaca como fonte de vitaminas do complexo B. Os tub�rculos sementes s�o plantados sobre leiras. A colheita � feita quando as folhas ficam amareladas e os ramos secos. � ainda conhecido como car� no centro-sul do Brasil.',' Desenvolve-se bem sob altas temperaturas e chuvas abundantes. N�o tolera frio nem geadas.','O inhame � consumido geralmente cozido. Pode ser usado das mesmas formas que a batata � em sopas, caldos, pur�s e refogados. Tamb�m pode ser ingrediente de p�es, cremes, biscoitos, panquecas e tortas. Depois de cozido pode ser assado ou frito. Pode ser vendido inteiro ou j� processado (cortado e embalado).');
INSERT INTO "Planta" VALUES(30,9,'Jil�','Solanum gilo Raddi',' O jil� � um fruto colhido e consumido ainda imaturo (verde) e possui um sabor amargo. � da mesma fam�lia do tomate, batata, pimenta e piment�o. � rico em vitamina A, B, c�lcio, f�sforo, ferro. Os tipos de jil� mais encontrados no mercado s�o: os de formato comprido e de colora��o verde-claro e os de formato esf�rico e de cor verde-escuro. O plantio � feito por mudas, produzidas em bandejas ou copinhos. N�o tolera excesso de �gua no solo, que deve ser bem drenado. N�o � muito exigente em aduba��o e tolera a acidez. Pode ser necess�rio colocar estacas nas plantas para que n�o tombem.',' � uma planta t�pica de clima tropical, sendo plantado nos per�odos de primavera e ver�o. Onde o inverno n�o � rigoroso, pode ser plantado o ano todo.','O jil� � consumido ainda verde e cozido, na forma de refogados, saladas frias, farofas e recheios de tortas. Pode ser vendido em caixas ou embalado em bandejas de isopor, o que aumenta seu valor de venda.');
INSERT INTO "Planta" VALUES(31,17,'Mandioquinha-salsa, baroa, batata-baroa, mandioquinha, batata-salsa, batata Nfi�za e cenoura-amarela','Arracacia xanthorrhiza Banc.',' Suas ra�zes s�o ricas em vitaminas do complexo B e carboidratos, al�m de minerais. � uma cultura de valor comercial alto em rela��o a outras hortali�as de ra�zes. O plantio � feito de brotos (filhotes) tirados de uma planta sadia. � feito em leiras e em solos bem drenados. A colheita � feita entre 10 e 12 meses ap�s o plantio. ',' � uma cultura de clima ameno e de elevadas altitudes. Na regi�es Sudeste e Centro-Oeste, somente � poss�vel o cultivo acima de 800 metros de altitude, e em Santa Catarina e Rio Grande do Sul, acima de 500 metros.','Por ser de f�cil digest�o, � recomendada para alimenta��o infantil, de pessoas doentes e idosas. Pode ser vendida em caixas pl�sticas, depois de classificada por tamanho, ou embalada a v�cuo, em por��es menores, para melhor conserva��o. � muito utilizada para processamento em agroind�stria, na fabrica��o de sopas prontas. ');
INSERT INTO "Planta" VALUES(32,3,'Maxixe','Cucumis anguria L.',' Os frutos s�o fonte de minerais, principalmente zinco, e t�m poucas calorias. O plantio � feito colocando-se tr�s sementes por cova. N�o � muito exigente em aduba��o e tolera a acidez do solo. Adapta-se melhor a solos arenosos. ',' � uma hortali�a de clima tropical, suporta temperaturas elevadas e chuvas abundantes. Em regi�es altas s� pode ser semeado nos per�odos de primavera e ver�o. Na Regi�o Norte, o excesso de chuvas pode provocar doen�as. ','Se colhido ainda verde, ele pode ser preparado cru, como salada, ou cozido como � mais comum ser consumido na forma de sopas ou refogados. � normalmente vendido para o consumidor final a granel, ou em bandejas de isopor, como forma de aumentar o valor do produto. Deve-se classificar o maxixe por tamanho e cor, para vender o produto por um pre�o melhor. ');
INSERT INTO "Planta" VALUES(33,18,'Melancia','Citrullus lanatus (Thunb.) Matsum. & Nakai',' � rica em vitamina A e vitamina C. Possui flores femininas (que originar�o o fruto) e masculinas (que fornecem o p�len) na mesma planta. � essencial a presen�a de abelhas para que o fruto fique bem formado. Dias quentes e secos originam frutos mais doces. H� cultivares de formato alongado, globular (a mais comum), sem sementes e de tamanho mini. A melancia deve ser colhida quando a casca em contato com o solo mudar da cor verde esbranqui�ado para amarelo.',' Exige temperaturas elevadas e n�o tolera frio nem geadas. Em regi�es de baixa altitude e com irriga��o como as observadas no Centro-Oeste, a melancia tamb�m pode ser plantada nos per�odos de outono e inverno, utilizando-se irriga��o para formar frutos de alta qualidade.','A melancia deve ser manuseada com cuidado para evitar danos mec�nicos (pancadas), empilhando no m�ximo cinco camadas de frutos. � consumida in natura e na forma de sucos. Da casca podem ser feitos deliciosos doces e compotas.');
INSERT INTO "Planta" VALUES(34,19,'Mel�o','Cucumis melo L. var. inodorus Naud.',' A planta � muito parecida com a da melancia. As cultivares de mel�o est�o distribu�das em dois grupos: inodorus (de casca firme e polpa usualmente branca), e arom�ticos (de casca mais fr�gil e com aroma e sabor mais fortes). � uma cultura exigente em aduba��o. Pode ser plantada por mudas feitas em bandejas ou copinhos. � necess�rio girar os frutos, expondo toda a superf�cie � luz do sol para obter uma cor mais uniforme. ',' � uma planta de clima quente e todas as fases de desenvolvimento da planta s�o prejudicadas por baixas temperaturas (temperatura m�nima ideal � em torno de 20�C). N�o tolera frio nem geadas. Dias e noites quentes e baixa umidade relativa do ar s�o as condi��es ideais para essa cultura.','O mel�o � geralmente consumido in natura e na forma de sucos. Deve-se ter bastante cuidado no transporte, colocando-os em caixas de papel�o. Tem sido uma excelente op��o para produtores do semi-�rido nordestino.');
INSERT INTO "Planta" VALUES(35,20,'Milho-verde.','Zea mays L.',' � o milho colhido em est�gio ainda imaturo (verde). As espigas s�o verde-claras e os gr�os amarelados. Produz em v�rios tipos de solo, por�m � exigente em aduba��o com zinco e magn�sio, devendo ser bem adubado. Essa cultura � uma �tima op��o para rota��o de culturas com as demais hortali�as. Existem cultivares para colheita de milho-doce e para colheita de milho-verde O milho-doce possui gr�os ricos em a��car, enquanto os gr�os de milho-verde s�o ricos em amido. ',' Desenvolve-se bem em regi�es de clima quente e ameno, sendo prejudicada pelo frio e geada. Onde n�o h� inverno rigoroso, pode ser plantado o ano todo.','O milho-doce e o milho-verde podem ser consumidos cozidos ou assados, como ingredientes no recheio em pizzas e tortas, pastel�es, cachorro-quente, saladas, entre outros pratos. No Brasil, o milho-doce � predominantemente utilizado na forma de conserva, sendo enviado para a agroind�stria para ser enlatado. Por n�o ser rico em amido, o milho-doce n�o � recomendado para o preparo de pamonha e curau. J� o milho-verde � muito utilizado para o preparo de pratos t�picos, como: pamonha, curau e cremes de milho. A vida p�s-colheita dos dois tipos de milho � bastante curta, devendo ser comercializado rapidamente.');
INSERT INTO "Planta" VALUES(36,7,'Moranga','Cucurbita maxima Duch.',' Os frutos da moranga s�o ricos em vitamina A e carboidratos. � uma cultura que se adapta a v�rios tipos de solo, sendo a condu��o da lavoura semelhante � de ab�bora. Assim como as ab�boras, pode ser plantada em local definitivo (2 a 3 sementes por cova), ou por transplante de mudas semeadas em bandejas ou copinhos. Deve-se tomar o cuidado para n�o danificar as ra�zes no momento do transplante. Os frutos possuem polpa e casca alaranjadas e seus gomos s�o destacados. ',' S�o mais tolerantes que as ab�boras em rela��o a temperaturas mais baixas e menos tolerante ao excesso de chuvas. � uma planta de clima quente, mas tolera temperaturas amenas (entre 15� a 25�C). S�o geralmente plantadas durante a primavera-ver�o.','As formas de preparo s�o semelhantes �s da ab�bora. Doces e pur�s s�o muito apreciados. Alguns pratos regionais s�o preparados com a moranga inteira, como camar�o na moranga ou carne seca na moranga. ');
INSERT INTO "Planta" VALUES(37,21,'Morango','Fragaria X ananassa Duch.',' O morangueiro � uma planta rasteira. Forma pequenas touceiras que v�o se alastrando pela emiss�o de estolhos (brotos). Esses brotos enra�zam e formam novas plantas ao redor. Seu plantio em local definitivo � feito por mudas produzidas dos estolhos retirados da planta-m�e. A parte comest�vel � um pseudofruto, ou seja, um falso fruto, vermelho e rico em vitaminas A e C e sais minerais. O plantio � feito em canteiros e em solos bem drenados, para evitar o encharcamento. ',' � origin�rio de clima frio, mas n�o tolera geadas. H� cultivares adaptadas a temperaturas amenas (entre 15� e 25�C). Dias curtos de outono-inverno favorecem a fruticfi a��o. Temperaturas elevadas favorecem o crescimento vegetativo e deixam os frutos muito azedos.','Os morangos podem ser comercializados em caixas pl�sticas direto ao consumidor final ou podem ser destinados � agroind�stria para a produ��o de sucos, gel�ias, doces. Pode ser ingrediente de v�rios produtos, como iogurtes, biscoitos e tortas. ');
INSERT INTO "Planta" VALUES(38,22,'Mostarda ou mostarda de folhas','Brassica juncea (L.) Coss.',' A mostarda � da mesma fam�lia da couve e br�colis. H� cultivares para a produ��o de folhas (consumo em saladas) e outras cultivares e esp�cies para a produ��o de gr�os (fabrica��o de molhos e temperos). Para folhas, as cultivares mais plantadas s�o a Lisa da Fl�rida e Lisa de Iraj�. O sabor picante � caracter�stico dessa hortali�a. � fonte de vitaminas C e A, de c�lcio e possui teores moderados de ferro, s�dio, pot�ssio e magn�sio. O plantio pode ser feito por mudas semeadas em bandejas ou diretamente no local definitivo, retirando as plantas em excesso.',' Prefere temperaturas mais amenas (entre 15� e 25�C).','Suas folhas s�o vendidas em ma�os e podem ser consumidas cruas ou refogadas. Tem uma vida p�s-colheita bastante curta e deve ser rapidamente comercializada ap�s colhida.45');
INSERT INTO "Planta" VALUES(39,13,'Nabo ','Brassica rapa var. rapa (L.) Thell.',' Da mesma fam�lia do repolho, da couve e do rabanete. � uma planta que produz raiz e folhas comest�veis, sendo a sua raiz mais consumida que as folhas. � fonte de fibras e sais minerais, principalmente c�lcio. � semeado diretamente em local definitivo. Deve-se retirar o excesso de plantas, deixando as melhores a uma dist�ncia de 10 cent�metros uma da outra. N�o � muito exigente em aduba��o, e o solo argiloso favorece a cultura. ',' Prefere temperaturas amenas (entre 15� e 25�C) a frias, suportando geadas leves. Pode ser semeado nos per�odos de outono e inverno na maioria das regi�es e, ao longo do ano, em regi�es de elevadas altitudes.','A comercializa��o � feita amarrando-se plantas inteiras em molhos, depois de serem lavadas. Pode ser consumido em saladas e sopas.');
INSERT INTO "Planta" VALUES(40,2,'Pepino','Cucumis sativus L.',' � uma planta da mesma fam�lia da ab�bora e do chuchu. Pode ser trepadeira se tiver suporte. Em geral, necessita de abelhas para polinizar e formar os frutos. H� cultivares, entretanto, que produzem frutos sem a necessidade de poliniza��o. Atualmente s�o encontrados cinco tipos de pepino do mercado: grupo Caipira, grupo Aodai, grupo Japon�s, grupo Holand�s (Beith-alpha) e grupo Agroindustrial (usado na fabrica��o de picles). Adapta-se melhor em solos arenosos e ricos em aduba��o org�nica. Pode ser plantado via semente em local definitivo ou por mudas, semeadas em bandejas. Deve-se ralear os frutinhos mal formados logo que o problema ocorrer.',' � uma cultura de clima quente, e se adapta a temperaturas amenas (entre 15� e 25�C). Frio e geada prejudicam e podem at� destruir a cultura. No inverno n�o muito rigoroso pode ser cultivada em casas de vegeta��o (estufa), podendo se beneficiar dos melhores pre�os no mercado.','Os frutos podem ser acondicionados em caixas pl�sticas ou de papel�o, devendo ser classificados para que o produtor obtenha melhores pre�os. S�o consumidos crus em saladas ou em conservas, na forma de picles.');
INSERT INTO "Planta" VALUES(41,1,'Pimenta','Capsicum frutescens L.; Capsicum baccatum L.; Capsicum chinense Jacq., NCapsicum praetermissum L.; Capsicum. Annuum L.',' As pimenteiras s�o arbustos, que produzem frutos, em sua maioria, de sabor ardido ou picante. H�, entretanto, algumas �pimentas doces�, que n�o ardem. S�o fontes de vitamina A, B e C. H� pimentas de v�rios formatos e cores. Preferem solos bem drenados. O plantio � feito por mudas, semeadas em bandejas, deixando 1,3 a 1,5 metro de dist�ncia entre elas. Baixas temperaturas podem provocar queda de frutinhos. ',' S�o exigentes em calor e sens�veis a baixas temperaturas e intolerantes a geadas. Por isso, devem ser cultivadas preferencialmente nos meses de alta temperatura. Em regi�es de baixa altitude, onde o inverno � ameno, as pimentas podem ser plantadas o ano inteiro.','Podem ser vendidas in natura ou processadas na forma de p�, flocos, picles, escabeches, molhos l�quidos, conservas de frutos inteiros, gel�ias etc. As pimentas picantes ainda s�o utilizadas pela ind�stria farmac�utica, na composi��o de pomadas para artrose e artrite, e tamb�m pela ind�stria de cosm�ticos, na composi��o de xampus anti-quedas e anticaspas. ');
INSERT INTO "Planta" VALUES(42,8,'Piment�o','Capsicum annuum L.',' O piment�o � uma das hortali�as mais ricas em vitamina C e, quando maduro, � excelente fonte de vitamina A. O plantio � feito em bandejas para posterior transplante em local definitivo. Deve ser tutorada (apoiada com estacas e arame) para n�o tombar. � exigente em nutrientes e se desenvolve melhor em solos com part�culas m�dias (siltosos). � muito atacada por doen�as, sendo recomendado alternar o plantio de piment�o com outras esp�cies (gram�neas, por exemplo), para diminuir a incid�ncia de doen�a no pr�ximo ciclo.',' � uma planta de origem tropical, produzindo melhor sob temperaturas relativamente elevadas ou amenas (entre 15� e 25�C). N�o tolera frio nem geadas, raz�o pela qual tem crescido o seu cultivo em casas de vegeta��o. Onde o inverno � ameno, pode ser cultivado durante o ano todo. ','� vendido verde ou maduro, dependendo da prefer�ncia do mercado consumidor e da log�stica de entrega (quando colhidos maduros, a vida p�s-colheita � menor). Pode ser consumido cru ou como condimento no preparo de v�rios pratos. Para aumentar o valor de venda ao consumidor nfi al, os piment�es podem ser acondicionados em bandejas de isopor.');
INSERT INTO "Planta" VALUES(43,21,'e popular - Quiabo','Abelmoschus esculentus (L.) Moench� ',' � um arbusto origin�rio da �frica, r�stico e tolerante � acidez elevada do solo. Seus frutos s�o ricos em Vitamina A, B1, C. Na v�spera do plantio, a dorm�ncia das sementes deve ser quebrada imergindo-as em �gua por 24 horas. O plantio pode ser por semeadura direta ou por mudas. � pouco exigente em �gua. Frio intenso pode provocar queda de flores e frutos.',' Exige temperaturas altas e n�o tolera frio.','A comercializa��o deve ser feita imediatamente ap�s a colheita, por ser um fruto altamente perec�vel. Para aumento da sua vida p�s-colheita, deve ser armazenado e transportado sob refrigera��o. Geralmente � consumido cozido, refogado ou frito, como ingrediente principal em pratos t�picos da Regi�o Nordeste (caruru) e de Minas Gerais (frango com quiabo). ');
INSERT INTO "Planta" VALUES(44,23,'Rabanete','ome popular � RabaneteNNome cient�cfi o � Raphanus sativus L.',' O rabanete produz ra�zes de formato esf�rico, cor de rosa avermelhado e polpa branca. � fonte de vitamina C, minerais e fibras. N�o � muito exigente em aduba��o. O solo deve estar sempre �mido para evitar rachaduras, mas sem excesso para n�o provocar doen�as. Deve ser colhido antes de atingir o seu tamanho m�ximo (em torno de 30 dias ap�s a semeadura), pois pode se tornar esponjoso.',' Adapta-se melhor ao cultivo nos per�odos de outono e inverno, tolerando bem frio e geadas leves. ','O rabanete � consumido principalmente cru, em saladas, mas tamb�m pode ser consumido cozido ou na forma de picles. � vendido amarrando-se ma�os das plantas inteiras. ');
INSERT INTO "Planta" VALUES(45,12,'Repolho','me popular � RepolhoNNome cient�cfi o � Brassica oleracea L. var. capitata',' O repolho possui folhas arredondadas dispostas umas sobre as outras, em forma de cabe�a. � rico em fibras, sais minerais e vitaminas do complexo B, E e K. Temperaturas altas fazem com que as cabe�as n�o fiquem bem formadas. O plantio � feito por mudas, semeadas em bandejas. � exigente em aduba��o e �gua, que deve ser fornecida constantemente para evitar rachaduras.',' Desenvolve-se bem sob temperaturas amenas (entre 15� e 25�C) e frias, resistindo bem a geadas. Entretanto, h� cultivares adaptadas a temperaturas mais altas.','O repolho � consumido cru, em saladas, ou cozido em sopas, refogados, acompanhando carnes e diversos pratos orientais. Pode tamb�m ser fermentado, para prepara��o do chucrute, prato alem�o. Para venda, as �cabe�as� s�o acondicionadas em caixas pl�sticas. ');
INSERT INTO "Planta" VALUES(46,24,'R�cula ou pinch�o','e popular � R�cula ou pinch�oNNome cient�cfi o � Eruca sativa L.',' A r�cula apresenta plantas de porte baixo, suas folhas s�o alongadas e recortadas, de colora��o verde escuro e de sabor picante. Dentre todas as hortali�as, a r�cula � a fonte mais rica em ferro. Cont�m ainda c�lcio, f�sforo, Vitaminas A e C. Propaga-se por sementes plantadas em local definitivo ou em bandejas, sendo transplantadas posteriormente. A colheita se inicia de 40 a 60 dias ap�s a semeadura, podendo-se colher os rebrotamentos.','a ou pinch�oNNome cient�cfi o � Eruca sativa L.N...Descri��o � A r�cula apresenta plantas de porte baixo, suas folhas s�o alongadas e recortadas, de colora��o verde escuro e de sabor picante. Dentre todas as hortali�as, a r�cula � a fonte mais rica em ferro. Cont�m ainda c�lcio, f�sforo, Vitaminas A e C. Propaga-se por sementes plantadas em local definitivo ou em bandejas, sendo transplantadas posteriormente. A colheita se inicia de 40 a 60 dias ap�s a semeadura, podendo-se colher os rebrotamentos.�poca e regi�es para plantio - Produz melhor sob temperaturas amenas (entre 15� e 25�C). Nas regi�es em que o ver�o � ameno, pode ser plantada durante o ano todo.','Muito apreciada na forma de saladas, sendo tamb�m utilizada no preparo de tortas, quiches, pizzas e lasanhas. Pode ser vendida em ma�os ou j� embalada e higienizada, pronta para o consumo. Tem pequena durabilidade p�s-colheita, devendo ser rapidamente comercializada e consumida.');
INSERT INTO "Planta" VALUES(47,3,'Salsa, salsinha',' popular � Salsa, salsinhaNNome cient�cfi o � Petroselinum crispum (Mill.) Nym.',' � um condimento arom�tico cujas folhas s�o ricas em vitamina A. H� cultivares de folhas lisas, crespas e muito crespas. H� ainda variedades para consumo das ra�zes. A germina��o de suas sementes � muito lenta, principalmente se a temperatura for baixa. Para acelerar a germina��o, recomenda-se deixar as sementes de molho em �gua durante uma noite. Prefere solos bem drenados, ricos em mat�ria org�nica, que devem ser mantidos sempre �midos.',' � uma planta de clima subtropical. Prefere temperaturas amenas, n�o muito frias, nem muito quentes (em torno de 20�C).','� vendida em ma�os, geralmente em conjunto com a cebolinha, conhecido como cheiro-verde. D� aroma e sabor a diversos pratos, sendo utilizada inclusive para prepara��o de sucos.');
INSERT INTO "Planta" VALUES(48,25,'Taioba','e popular � TaiobaNNome cient�cfi o � Xanthosoma sagittifolium (L.) Schott',' A taioba � da mesma fam�lia do inhame. Tanto as folhas quanto os tub�rculos s�o comest�veis. Suas folhas (parte mais consumida) s�o ricas em vitamina A, c�lcio e f�sforo. N�o � muito exigente em aduba��o, sendo uma planta r�stica. Plantam-se os brotos produzidos ao redor da planta-m�e.',' � uma cultura de clima quente e exigente em chuva. Recomenda-se o plantio nos per�odos de primavera e ver�o, entretanto pode ser plantada durante o ano todo em regi�es baixas com inverno ameno, pois o frio paralisa o crescimento das folhas. ','As folhas da taioba s�o consumidas refogadas como a couve. Cruas causam irrita��o das mucosas. Podem ser ingredientes de bolinhos e recheio de pizza e tortas. Suas folhas s�o vendidas em ma�os.');
INSERT INTO "Planta" VALUES(49,6,'IGO InHAmE)Nome popular �Taro (antigo inhame)','IGO InHAmE)Nome popular �Taro (antigo inhame)NNome cient�cfi o � Colocasia esculenta (L.) Schott',' Seus rizomas (caules subterr�neos) s�o a parte comest�vel, possuindo casca fibrosa e polpa branca. � fonte de carboidratos, vitaminas, ferro e f�sforo. Produz melhor quando plantada em solos arenosos, mas n�o necessita de solo com alta fertilidade. S�o plantados os rizomas laterais inteiros, com o broto bem desenvolvido. Deve-se fazer a amontoa sobre as fileiras de plantas.',' Exige temperaturas elevadas e chuvas abundantes e n�o tolera geadas.','Pode ser consumido cozido, em sopas, refogados, saladas e sobremesas.  Tamb�m pode ser industrializado na forma de farinha para fabrica��o de p�es e bolos. ');
INSERT INTO "Planta" VALUES(50,8,'Tomate','Lycopersicon esculentum Mill.',' � uma das hortali�as mais consumidas no mundo, sendo fonte de vitaminas A e C e de sais minerais como pot�ssio. H� cultivares de crescimento determinado (destinadas para ind�stria de processamento) e de crescimento indeterminado (maioria destinada para mesa). S�o reunidas em cinco grupos: grupo Santa Cruz, Salada, Cereja, Italiano (ou Saladete ou San Marzano) e grupo Agroindustrial. � bastante exigente em aduba��o e � muito atacada por doen�as, exigindo elevado conhecimento da cultura para um cultivo eficiente.',' Desenvolve-se melhor em regi�es altas (serras e planaltos) de clima tropical e tamb�m em clima subtropical ou temperado, seco e com alta incid�ncia de luz solar. Regi�es muito �midas e quentes s�o problem�ticas para a cultura, favorecendo doen�as.','Os tomates podem ser destinados a agroind�stria e para consumo � mesa. S�o consumidos na forma de molhos prontos e caseiros, extrato (polpa concentrada), doces, sucos e cru, na salada. S�o geralmente comercializados a granel (depois de classificados) em caixas de pl�stico, bandejas pl�sticas ou de isopor, cobertas com filme pl�stico. ');
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
INSERT INTO "RegiaoImediata" VALUES(410007,'Foz do Igua�u',4103);
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
INSERT INTO "UF" VALUES(41,'PR','Paran�',4);
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
