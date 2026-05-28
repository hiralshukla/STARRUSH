-- View creator profiles with dynamic portfolio counts
CREATE OR REPLACE VIEW VIEW_CREATOR_PROFILES AS
SELECT
    c.CreatorID,
    c.FirstName,
    c.LastName,
    c.Email,
    c.HeadShotImage,
    c.ProfileImage,
    c.AboutMe,
    c.WorkExperience,
    c.CreatorRole,
    COUNT(p.PortfolioItemID) AS NumPortfolioItems
FROM CREATORS c
LEFT JOIN PORTFOLIO_ITEMS p
    ON c.CreatorID = p.CreatorID
GROUP BY
    c.CreatorID,
    c.FirstName,
    c.LastName,
    c.Email,
    c.HeadShotImage,
    c.ProfileImage,
    c.AboutMe,
    c.WorkExperience,
    c.CreatorRole;

-- View issues with digital file information
CREATE OR REPLACE VIEW VIEW_ISSUE_DIGITAL_FILES AS
SELECT
    i.IssueID,
    i.Title,
    i.IssueNumber,
    i.Theme,
    i.IssueDesc,
    i.PublicationDate,
    i.CoverImagePath,
    i.IssueStatus,
    d.DigitalFileID,
    d.DigitalFileName,
    d.PdfPath,
    d.FileSizeMB,
    d.NumPages
FROM ISSUES i
LEFT JOIN DIGITAL_FILES d
    ON i.IssueID = d.IssueID;

-- View creator credits for each issue
CREATE OR REPLACE VIEW VIEW_ISSUE_CREATOR_CREDITS AS
SELECT
    i.IssueID,
    i.Title AS IssueTitle,
    i.IssueNumber,
    c.CreatorID,
    c.FirstName,
    c.LastName,
    ic.CreditRole
FROM ISSUES i
JOIN ISSUE_CREATOR_CREDITS ic
    ON i.IssueID = ic.IssueID
JOIN CREATORS c
    ON ic.CreatorID = c.CreatorID;

-- View contributor credits for each issue
CREATE OR REPLACE VIEW VIEW_ISSUE_CONTRIBUTOR_CREDITS AS
SELECT
    i.IssueID,
    i.Title AS IssueTitle,
    i.IssueNumber,
    con.ContributorID,
    con.FirstName,
    con.LastName,
    con.ContributorType,
    icc.CreditRole,
    icc.WorkTitle
FROM ISSUES i
JOIN ISSUE_CONTRIBUTOR_CREDITS icc
    ON i.IssueID = icc.IssueID
JOIN CONTRIBUTORS con
    ON icc.ContributorID = con.ContributorID;

-- View portfolio items with creator names
CREATE OR REPLACE VIEW VIEW_PORTFOLIO_ITEMS_WITH_CREATORS AS
SELECT
    p.PortfolioItemID,
    p.Title,
    p.ItemDesc,
    p.ImagePath,
    p.MediaType,
    p.YearCreated,
    p.ItemRole,
    c.CreatorID,
    c.FirstName,
    c.LastName
FROM PORTFOLIO_ITEMS p
JOIN CREATORS c
    ON p.CreatorID = c.CreatorID;

-- Test the views
SELECT * FROM VIEW_CREATOR_PROFILES;
SELECT * FROM VIEW_ISSUE_DIGITAL_FILES;
SELECT * FROM VIEW_ISSUE_CREATOR_CREDITS;
SELECT * FROM VIEW_ISSUE_CONTRIBUTOR_CREDITS;
SELECT * FROM VIEW_PORTFOLIO_ITEMS_WITH_CREATORS;