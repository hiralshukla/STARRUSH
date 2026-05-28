
-- View all creators
SELECT * FROM CREATORS;

-- View all contributors
SELECT * FROM CONTRIBUTORS;

-- View all issues
SELECT * FROM ISSUES;

-- View all portfolio items
SELECT * FROM PORTFOLIO_ITEMS;

-- View all digital files
SELECT * FROM DIGITAL_FILES;

-- Show issues with creator credits
SELECT 
    i.IssueID,
    i.Title,
    i.IssueNumber,
    i.IssueStatus,
    c.FirstName,
    c.LastName,
    ic.CreditRole
FROM ISSUES i
JOIN ISSUE_CREATOR_CREDITS ic
    ON i.IssueID = ic.IssueID
JOIN CREATORS c
    ON ic.CreatorID = c.CreatorID
ORDER BY i.IssueID, c.LastName;

-- Show issues with contributor credits
SELECT
    i.IssueID,
    i.Title,
    con.FirstName,
    con.LastName,
    icc.CreditRole,
    icc.WorkTitle
FROM ISSUES i
JOIN ISSUE_CONTRIBUTOR_CREDITS icc
    ON i.IssueID = icc.IssueID
JOIN CONTRIBUTORS con
    ON icc.ContributorID = con.ContributorID
ORDER BY i.IssueID, con.LastName;

-- Show portfolio items by creator
SELECT 
    c.FirstName,
    c.LastName,
    p.Title,
    p.MediaType,
    p.YearCreated,
    p.ItemRole
FROM CREATORS c
JOIN PORTFOLIO_ITEMS p
    ON c.CreatorID = p.CreatorID
ORDER BY c.LastName, p.YearCreated DESC;

-- Count portfolio items per creator
SELECT 
    c.CreatorID,
    c.FirstName,
    c.LastName,
    COUNT(p.PortfolioItemID) AS NumPortfolioItems
FROM CREATORS c
LEFT JOIN PORTFOLIO_ITEMS p
    ON c.CreatorID = p.CreatorID
GROUP BY 
    c.CreatorID,
    c.FirstName,
    c.LastName
ORDER BY c.CreatorID;

-- Show issues with digital files
SELECT
    i.IssueID,
    i.Title,
    i.IssueNumber,
    d.DigitalFileName,
    d.PdfPath,
    d.FileSizeMB,
    d.NumPages
FROM ISSUES i
JOIN DIGITAL_FILES d
    ON i.IssueID = d.IssueID;

-- Show issues missing PDFs
SELECT
    i.IssueID,
    i.Title,
    i.IssueNumber,
    i.IssueStatus
FROM ISSUES i
LEFT JOIN DIGITAL_FILES d
    ON i.IssueID = d.IssueID
WHERE d.DigitalFileID IS NULL;

-- Show issue tags
SELECT
    i.Title,
    t.TagName
FROM ISSUES i
JOIN ISSUE_TAGS it
    ON i.IssueID = it.IssueID
JOIN TAGS t
    ON it.TagID = t.TagID
ORDER BY i.Title, t.TagName;

-- Show portfolio item tags
SELECT
    p.Title,
    t.TagName
FROM PORTFOLIO_ITEMS p
JOIN PORTFOLIO_ITEM_TAGS pit
    ON p.PortfolioItemID = pit.PortfolioItemID
JOIN TAGS t
    ON pit.TagID = t.TagID
ORDER BY p.Title, t.TagName;

-- Search published issues
SELECT
    IssueID,
    Title,
    IssueNumber,
    Theme,
    PublicationDate
FROM ISSUES
WHERE IssueStatus = 'Published'
ORDER BY PublicationDate DESC;

-- Search portfolio items by media type
SELECT
    Title,
    MediaType,
    YearCreated,
    ImagePath
FROM PORTFOLIO_ITEMS
WHERE MediaType = 'Editorial Design';