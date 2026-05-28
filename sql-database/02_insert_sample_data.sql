SET DEFINE OFF;


INSERT INTO CREATORS (
    CreatorID, 
    FirstName, 
    LastName, 
    Email, 
    HeadShotImage, 
    ProfileImage,
    AboutMe, 
    WorkExperience, 
    CreatorRole
) VALUES (
    1,
    'Hiral',
    'Shukla',
    'hiralshukla@ufl.edu',
    '/sample-imgs/hiral/hiral1.jpeg',
    '/sample-imgs/hiral/hiral2.jpeg',
    'Hi! Nice to meet you! Some fun facts about me are: - I am a Computer Science major in CLAS - I am a Business Administration & Econ minor - I am from Tampa, FL - I watched Tabasco the Opera at UF Auditorium - I love bagels, pancakes, boba, & acai bowls - I watch Game Theory Live in my free time - I was a TA for Computer Organization at UF - I was a Research Intern for the Florida Natural History Museum - I am the new Development Department Manager at The Agency - I went on the UF in London Summer 2025 Program! - This summer I''ll be interning as a Software Developer in NYC',
    '- Worked for PRISM & TEA since Fall 2023 as a graphic designer - Worked as graphic designer for: PRISM Honors Literary Magazine, TEA Literary & Arts Magazine, and Hillsborough Esthetic Literary Magazine - Worked with Adobe Illustrator, Photoshop, and InDesign for 6 years - Experience as Event Coordinator and Editor-in-Chief - Designed over 245 magazine pages across 13 different magazines - Led workshops on Design for PRISM Fall 2024, Spring 2025, Fall 2025, and Spring 2026',
    'Graphic Design Editor'
);

INSERT INTO CREATORS (
    CreatorID, 
    FirstName,
    LastName,
    Email,
    CreatorRole
) VALUES (
    2,
    'Noie',
    'Prouty',
    'proutyn@ufl.edu',
    'Graphic Design Editor'
);

INSERT INTO CONTRIBUTORS (
    ContributorID, 
    FirstName,
    LastName,
    Email, 
    ContributorType
) VALUES (
    1,
    'Nina',
    'Prouty',
    'nprouty@ufl.edu',
    'Creative Director'
);

INSERT INTO CONTRIBUTORS (
    ContributorID, 
    FirstName,
    LastName,
    Email, 
    ContributorType
) VALUES (
    2,
    'Em',
    'Petlev',
    'e.petlev@ufl.edu',
    'Contributor'
);

INSERT INTO ISSUES(
    IssueID, 
    Title, 
    IssueNumber, 
    Theme,
    IssueDesc, 
    PublicationDate,
    CoverImagePath, 
    IssueStatus
) VALUES (
    2, 
    'PRISM: liminality',
    'Volume 27',
    'Liminality',
    'PRISM''s 27th edition of fine student work with pages composed and designed by Noie and Hiral as well as contributing designers. Come explore space, time, and the enigmas of the in-between with this latest edition!',
    DATE '2026-04-22',
    '/sample-imgs/cover_imgs/prismspr26.png',
    'Published'
);

INSERT INTO ISSUES(
    IssueID, 
    Title, 
    IssueNumber, 
    Theme,
    IssueDesc, 
    PublicationDate,
    CoverImagePath, 
    IssueStatus
) VALUES (
    1, 
    'PRISM: odyssey',
    'Volume 26',
    'Odyssey',
    'PRISM''s 26th edition of fine student work with pages composed and designed by Noie and Hiral as well as contributing designers. Come take a hero''s journey with us that you won''t forget.',
    DATE '2026-01-24',
    '/sample-imgs/cover_imgs/prismfall25.png',
    'Published'
);

INSERT INTO TAGS (TagID, TagName)
VALUES (1, 'Design');

INSERT INTO TAGS (TagID, TagName)
VALUES (2, 'Writing');

INSERT INTO TAGS (TagID, TagName)
VALUES (3, 'Photography');

INSERT INTO TAGS (TagID, TagName)
VALUES (4, 'Editorial');

INSERT INTO TAGS (TagID, TagName)
VALUES (5, 'Poetry');

INSERT INTO ISSUE_CREATOR_CREDITS (
    IssueID,
    CreatorID,
    CreditRole
)
VALUES (
    1,
    1,
    'Graphic Design Editor'
);

INSERT INTO ISSUE_CREATOR_CREDITS (
    IssueID,
    CreatorID,
    CreditRole
)
VALUES (
    1,
    2,
    'Graphic Design Editor'
);

INSERT INTO ISSUE_CREATOR_CREDITS (
    IssueID,
    CreatorID,
    CreditRole
)
VALUES (
    2,
    1,
    'Graphic Design Editor'
);

INSERT INTO ISSUE_CREATOR_CREDITS (
    IssueID,
    CreatorID,
    CreditRole
)
VALUES (
    2,
    2,
    'Graphic Design Editor'
);

INSERT INTO ISSUE_CONTRIBUTOR_CREDITS (
    IssueID,
    ContributorID,
    CreditRole,
    WorkTitle
)
VALUES (
    1,
    1,
    'Prose',
    'solipsism'
);

INSERT INTO ISSUE_CONTRIBUTOR_CREDITS (
    IssueID,
    ContributorID,
    CreditRole,
    WorkTitle
)
VALUES (
    2,
    2,
    'Design',
    'The Life and Death of a Shoe'
);

INSERT INTO PORTFOLIO_ITEMS (
    PortfolioItemID,
    CreatorID,
    Title,
    ItemDesc,
    ImagePath,
    MediaType,
    YearCreated,
    ItemRole
)
VALUES (
    1,
    1,
    'An Escape',
    'PRISM Magazine spread from FALL 2024. Design on the left page by Hiral using Illustrator & InDesign.',
    '/sample-imgs/hiral/anescape.png',
    'Design',
    2024,
    'Graphic Design Editor'
);

INSERT INTO DIGITAL_FILES (
    IssueID,
    DigitalFileName,
    PdfPath,
    FileSizeMB,
    NumPages
)
VALUES (
    2,
    'PRISM SPRING 2026.pdf',
    '/sample-pdfs/PRISM SPRING 2026.pdf',
    48.5,
    32
);

INSERT INTO ISSUE_TAGS (IssueID, TagID)
VALUES (1, 1);

INSERT INTO ISSUE_TAGS (IssueID, TagID)
VALUES (1, 2);

INSERT INTO ISSUE_TAGS (IssueID, TagID)
VALUES (1, 4);

INSERT INTO ISSUE_TAGS (IssueID, TagID)
VALUES (2, 1);

INSERT INTO ISSUE_TAGS (IssueID, TagID)
VALUES (2, 3);

INSERT INTO PORTFOLIO_ITEM_TAGS (PortfolioItemID, TagID)
VALUES (1, 1);

INSERT INTO PORTFOLIO_ITEM_TAGS (PortfolioItemID, TagID)
VALUES (1, 4);

COMMIT;