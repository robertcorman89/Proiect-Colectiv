


CREATE TABLE [dbo].[Medic] (
    [idMedic]   INT          IDENTITY (1, 1) NOT NULL,
    [firstName] VARCHAR (50) NOT NULL,
    [lastName]  VARCHAR (50) NOT NULL,
    [userName]     VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([idMedic] ASC)
);


CREATE TABLE [dbo].[Assistant] (
    [idAssistant] INT          IDENTITY (1, 1) NOT NULL,
    [firstName]   VARCHAR (50) NOT NULL,
    [lastName]    VARCHAR (50) NOT NULL,
    [idMedic]     INT          NULL,
	[userName]     VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([idAssistant] ASC),
    FOREIGN KEY ([idMedic]) REFERENCES [dbo].[Medic] ([idMedic])
);


CREATE TABLE [dbo].[Admin] (
    [idAdmin]     INT          IDENTITY (1, 1) NOT NULL,
    [userName]       VARCHAR (50) NOT NULL,
    [idAssistant] INT          NULL,
    PRIMARY KEY CLUSTERED ([idAdmin] ASC),
    FOREIGN KEY ([idAssistant]) REFERENCES [dbo].[Assistant] ([idAssistant])
);


CREATE TABLE [dbo].[medicalRecord] (
    [idmedicalRecords] INT           NOT NULL,
    [date]             DATE          NULL,
    [vaccinations]     VARCHAR (250) NOT NULL,
    [diseases]         VARCHAR (250) NOT NULL,
    [previousDiseases] VARCHAR (250) NOT NULL,
    [meds]             VARCHAR (250) NOT NULL,
    [allergies]        VARCHAR (250) NOT NULL,
    [lastControl]      VARCHAR (250) NOT NULL,
    [info]             VARCHAR (250) NOT NULL,
    PRIMARY KEY CLUSTERED ([idmedicalRecords] ASC)
);



CREATE TABLE [dbo].[Patient] (
    [cardNumber]       VARCHAR(15)  NOT NULL,
    [firstName]        VARCHAR (50) NOT NULL,
    [lastName]         VARCHAR (50) NOT NULL,
    [birthDate]        DATE         NOT NULL,
    [email]            VARCHAR (50) NOT NULL,
    [idMedic]          INT          NULL,
    [CNP]              VARCHAR (13) NOT NULL,
    [idmedicalRecords] INT          NULL,
    PRIMARY KEY CLUSTERED ([cardNumber] ASC),
    FOREIGN KEY ([idMedic]) REFERENCES [dbo].[Medic] ([idMedic]),
    FOREIGN KEY ([idmedicalRecords]) REFERENCES [dbo].[medicalRecord] ([idmedicalRecords])
);

CREATE TABLE [dbo].[medicalPrescription] (
    [idmedicalPrescription] INT           NOT NULL,
    [Diagnostic]            VARCHAR (250) NOT NULL,
    [Medication]            VARCHAR (250) NOT NULL,
    [Free]                  BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([idmedicalPrescription] ASC)
);




CREATE TABLE [dbo].[Appointment] (
    [idMedic]               INT      NOT NULL,
    [cardNumber]            VARCHAR(15)      NOT NULL,
    [Date]                  DATE     NULL,
    [Time]                  TIME (7) NULL,
    [idmedicalPrescription] INT      NULL,
    PRIMARY KEY CLUSTERED ([idMedic] ASC, [cardNumber] ASC),
    FOREIGN KEY ([idMedic]) REFERENCES [dbo].[Medic] ([idMedic]),
    FOREIGN KEY ([cardNumber]) REFERENCES [dbo].[Patient] ([cardNumber]),
    FOREIGN KEY ([idmedicalPrescription]) REFERENCES [dbo].[medicalPrescription] ([idmedicalPrescription])
);


CREATE TABLE [dbo].[AspNetRole] (
    [Id]   NVARCHAR (128) NOT NULL,
    [Name] NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED ([Id] ASC)
);
CREATE TABLE [dbo].[AspNetUser] (
    [Id]                   NVARCHAR (128) NOT NULL,
    [Email]                NVARCHAR (256) NULL,
    [EmailConfirmed]       BIT            NOT NULL,
    [PasswordHash]         NVARCHAR (MAX) NULL,
    [SecurityStamp]        NVARCHAR (MAX) NULL,
    [PhoneNumber]          NVARCHAR (MAX) NULL,
    [PhoneNumberConfirmed] BIT            NOT NULL,
    [TwoFactorEnabled]     BIT            NOT NULL,
    [LockoutEndDateUtc]    DATETIME       NULL,
    [LockoutEnabled]       BIT            NOT NULL,
    [AccessFailedCount]    INT            NOT NULL,
    [UserName]             NVARCHAR (256) NOT NULL,
    [idRole]               NVARCHAR (128) NULL,
    [firstName]            NVARCHAR (100) NOT NULL,
    [lastName]             NVARCHAR (100) NOT NULL,
    [birthDay]             DATETIME       NOT NULL,
    [cardNumber]           NVARCHAR (20)  NOT NULL,
    [cnp]                  NVARCHAR (13)  NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC),
	FOREIGN KEY ([idRole]) REFERENCES [dbo].[AspNetRole] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex]
    ON [dbo].[AspNetRole]([Name] ASC);

CREATE TABLE [dbo].[AspNetUserClaim] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [UserId]     NVARCHAR (128) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUser] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[AspNetUserClaim]([UserId] ASC);


CREATE TABLE [dbo].[AspNetUserLogin] (
    [LoginProvider] NVARCHAR (128) NOT NULL,
    [ProviderKey]   NVARCHAR (128) NOT NULL,
    [UserId]        NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED ([LoginProvider] ASC, [ProviderKey] ASC, [UserId] ASC),
    CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUser] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[AspNetUserLogin]([UserId] ASC);



CREATE TABLE [dbo].[AspNetUserRole] (
    [UserId] NVARCHAR (128) NOT NULL,
    [RoleId] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
    CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRole] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUser] ([Id]) ON DELETE CASCADE
);







GO
CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[AspNetUserRole]([UserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RoleId]
    ON [dbo].[AspNetUserRole]([RoleId] ASC);




GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
    ON [dbo].[AspNetUser]([UserName] ASC);

