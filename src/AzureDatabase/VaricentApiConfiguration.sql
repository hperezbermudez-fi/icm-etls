CREATE TABLE [comm].[VaricentApiConfiguration] (
    [RecordId]   INT          NOT NULL,
    [FileType]   VARCHAR (50) NOT NULL,
    [FolderName] VARCHAR (50) NOT NULL,
    [FolderId]   INT          NOT NULL,
    CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED ([RecordId] ASC)
);
