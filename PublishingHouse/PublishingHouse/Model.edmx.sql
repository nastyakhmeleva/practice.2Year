
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/13/2018 10:13:02
-- Generated from EDMX file: C:\Users\REINGER\Desktop\Практика Настя\practice.2Year\PublishingHouse\PublishingHouse\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PublishingHouse];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'BooksSet'
CREATE TABLE [dbo].[BooksSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [Author_Id] int  NOT NULL,
    [Genre_Id] int  NOT NULL
);
GO

-- Creating table 'AuthorSet'
CREATE TABLE [dbo].[AuthorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Surname] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [SecondName] nvarchar(max)  NULL,
    [Country_Id] int  NOT NULL
);
GO

-- Creating table 'BookExemplarSet'
CREATE TABLE [dbo].[BookExemplarSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Number] int  NOT NULL,
    [Year] int  NOT NULL,
    [Books_Id] int  NOT NULL,
    [Store_Id] int  NOT NULL,
    [Series_Id] int  NOT NULL
);
GO

-- Creating table 'GenreSet'
CREATE TABLE [dbo].[GenreSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'CitySet'
CREATE TABLE [dbo].[CitySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StoreSet'
CREATE TABLE [dbo].[StoreSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NULL,
    [City_Id] int  NOT NULL
);
GO

-- Creating table 'SeriesSet'
CREATE TABLE [dbo].[SeriesSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [CoverType] nvarchar(max)  NULL
);
GO

-- Creating table 'CountrySet'
CREATE TABLE [dbo].[CountrySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PrivelegeSet'
CREATE TABLE [dbo].[PrivelegeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Available] bit  NOT NULL
);
GO

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [PrivelegeId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'BooksSet'
ALTER TABLE [dbo].[BooksSet]
ADD CONSTRAINT [PK_BooksSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AuthorSet'
ALTER TABLE [dbo].[AuthorSet]
ADD CONSTRAINT [PK_AuthorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BookExemplarSet'
ALTER TABLE [dbo].[BookExemplarSet]
ADD CONSTRAINT [PK_BookExemplarSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GenreSet'
ALTER TABLE [dbo].[GenreSet]
ADD CONSTRAINT [PK_GenreSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CitySet'
ALTER TABLE [dbo].[CitySet]
ADD CONSTRAINT [PK_CitySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StoreSet'
ALTER TABLE [dbo].[StoreSet]
ADD CONSTRAINT [PK_StoreSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SeriesSet'
ALTER TABLE [dbo].[SeriesSet]
ADD CONSTRAINT [PK_SeriesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CountrySet'
ALTER TABLE [dbo].[CountrySet]
ADD CONSTRAINT [PK_CountrySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrivelegeSet'
ALTER TABLE [dbo].[PrivelegeSet]
ADD CONSTRAINT [PK_PrivelegeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Author_Id] in table 'BooksSet'
ALTER TABLE [dbo].[BooksSet]
ADD CONSTRAINT [FK_BooksAuthor]
    FOREIGN KEY ([Author_Id])
    REFERENCES [dbo].[AuthorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BooksAuthor'
CREATE INDEX [IX_FK_BooksAuthor]
ON [dbo].[BooksSet]
    ([Author_Id]);
GO

-- Creating foreign key on [Genre_Id] in table 'BooksSet'
ALTER TABLE [dbo].[BooksSet]
ADD CONSTRAINT [FK_BooksGenre]
    FOREIGN KEY ([Genre_Id])
    REFERENCES [dbo].[GenreSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BooksGenre'
CREATE INDEX [IX_FK_BooksGenre]
ON [dbo].[BooksSet]
    ([Genre_Id]);
GO

-- Creating foreign key on [Books_Id] in table 'BookExemplarSet'
ALTER TABLE [dbo].[BookExemplarSet]
ADD CONSTRAINT [FK_BooksBookExemplar]
    FOREIGN KEY ([Books_Id])
    REFERENCES [dbo].[BooksSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BooksBookExemplar'
CREATE INDEX [IX_FK_BooksBookExemplar]
ON [dbo].[BookExemplarSet]
    ([Books_Id]);
GO

-- Creating foreign key on [City_Id] in table 'StoreSet'
ALTER TABLE [dbo].[StoreSet]
ADD CONSTRAINT [FK_CityStore]
    FOREIGN KEY ([City_Id])
    REFERENCES [dbo].[CitySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CityStore'
CREATE INDEX [IX_FK_CityStore]
ON [dbo].[StoreSet]
    ([City_Id]);
GO

-- Creating foreign key on [Store_Id] in table 'BookExemplarSet'
ALTER TABLE [dbo].[BookExemplarSet]
ADD CONSTRAINT [FK_StoreBookExemplar]
    FOREIGN KEY ([Store_Id])
    REFERENCES [dbo].[StoreSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StoreBookExemplar'
CREATE INDEX [IX_FK_StoreBookExemplar]
ON [dbo].[BookExemplarSet]
    ([Store_Id]);
GO

-- Creating foreign key on [Series_Id] in table 'BookExemplarSet'
ALTER TABLE [dbo].[BookExemplarSet]
ADD CONSTRAINT [FK_SeriesBookExemplar]
    FOREIGN KEY ([Series_Id])
    REFERENCES [dbo].[SeriesSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SeriesBookExemplar'
CREATE INDEX [IX_FK_SeriesBookExemplar]
ON [dbo].[BookExemplarSet]
    ([Series_Id]);
GO

-- Creating foreign key on [Country_Id] in table 'AuthorSet'
ALTER TABLE [dbo].[AuthorSet]
ADD CONSTRAINT [FK_CountryAuthor]
    FOREIGN KEY ([Country_Id])
    REFERENCES [dbo].[CountrySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CountryAuthor'
CREATE INDEX [IX_FK_CountryAuthor]
ON [dbo].[AuthorSet]
    ([Country_Id]);
GO

-- Creating foreign key on [PrivelegeId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [FK_UserPrivelege]
    FOREIGN KEY ([PrivelegeId])
    REFERENCES [dbo].[PrivelegeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPrivelege'
CREATE INDEX [IX_FK_UserPrivelege]
ON [dbo].[UserSet]
    ([PrivelegeId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------