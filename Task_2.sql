--DATABASE CREATION
CREATE DATABASE kesavan_db
GO

--USE DATABASE
use kesavan_db
GO


--Project Table
CREATE TABLE project
(
	project_id INT IDENTITY(1,1) PRIMARY KEY,
	project_name VARCHAR(150) UNIQUE NOT NULL,
	starts_date DATE NOT NULL,
	end_date DATE NOT NULL,
	budget MONEY ,
	statuss VARCHAR(50) DEFAULT 'Not Started',

	--Constraints for end date field
	    CONSTRAINT CHECK_end_date_After_starts_date 
        CHECK (end_date >= starts_date),
)
GO

--Inserting values:
INSERT INTO project (project_name, starts_date, end_date, budget, statuss)
VALUES 
    ('Website Redesign', '2024-01-01', '2024-06-30', 15000.00, 'In Progress'),
    ('Mobile App Development', '2024-02-15', '2024-07-15', 25000.00, 'Not Started'),
    ('Market Research', '2024-03-01', '2024-05-31', 10000.00, 'Completed'),
    ('Annual Report Preparation', '2024-04-01', '2024-12-31', 12000.00, 'In Progress')
GO

--Display Output;
SELECT *
FROM project
GO

--checking if the default values are set or not
INSERT INTO project (project_name, starts_date, end_date, budget, statuss)
VALUES 
    ('Website design', '2025-04-08', '2026-06-30', 15040.00,'check');

SELECT *
FROM project


/*
		ALTER AND CONSTRAINTS 
*/



--alter the project table to add new column
ALTER TABLE project
ADD descriptions VARCHAR(255) NOT NULL;
GO
-- it shows it has the values so i try to truncate it 
TRUNCATE TABLE task;
GO

SELECT * FROM task
GO
--now i try to truncate it shows 

TRUNCATE TABLE project
/*
Msg 4712, Level 16, State 1, Line 66
Cannot truncate table 'project' because it is being referenced by a FOREIGN KEY constraint.

so we need to approach this in three ways
1. DELETE entire foreign key table 
2. drop the constraints and remove the parent table and add it.
3. disable the constraints and truncate it and enable it again .
*/

--use drop approach fk approach
ALTER TABLE task 
DROP CONSTRAINT FK__task__project_id__1EA48E88;


EXEC sp_help 'task'















--EXEC sp_help 'project';
/*
--task table creation
CREATE TABLE task(
	task_id INT IDENTITY(1,1) PRIMARY KEY,
	task_name VARCHAR(150) NOT NULL,
	descriptions VARCHAR(255) NOT NULL,
	starts_date DATE NOT NULL,
	due_date DATE NOT NULL,
		--Constraints for end date field
	    CONSTRAINT CHECK_due_date_After_starts_date 
          CHECK (due_date >= starts_date),
	prioritys VARCHAR(150) 
		CONSTRAINT CK_Task_Priority CHECK (prioritys IN ('Low', 'Medium', 'High')),
	statuss VARCHAR(70) DEFAULT 'Pending',
	project_id INT FOREIGN KEY REFERENCES project(project_id)
);

-- Insert sample data into the Task table

INSERT INTO task (task_name, descriptions, starts_date, due_date, prioritys, statuss, project_id)
VALUES 
    ('Initial Design', 'Design phase for the new website', '2024-01-02', '2024-02-28', 'High', 'Completed', 1),
    ('UI Development', 'Development of user interface components', '2024-03-01', '2024-05-15', 'Medium', 'In Progress', 1),
    ('Quality Assurance', 'Testing and quality assurance', '2024-05-16', '2024-06-15', 'High', 'Pending', 1),
    ('API Development', 'Developing APIs for the mobile app', '2024-02-16', '2024-04-30', 'Medium', 'Completed', 2),
    ('Beta Testing', 'Conducting beta testing for the mobile app', '2024-05-01', '2024-06-30', 'High', 'In Progress', 2),
    ('Survey Analysis', 'Analyzing market research surveys', '2024-03-02', '2024-04-15', 'Low', 'Completed', 3),
    ('Report Drafting', 'Drafting the final report based on research', '2024-04-16', '2024-05-30', 'Medium', 'Pending', 3),
    ('Financial Statements', 'Preparing financial statements for the annual report', '2024-04-02', '2024-07-15', 'High', 'In Progress', 4),
    ('Final Review', 'Final review and submission of the annual report', '2024-07-16', '2024-12-15', 'High', 'Pending', 4),
    ('Client Feedback Incorporation', 'Incorporating feedback from the client into the project', '2024-02-01', '2024-03-15', 'Medium', 'In Progress', 1),
    ('Launch Preparation', 'Preparing for the official launch of the mobile app', '2024-06-01', '2024-07-01', 'High', 'Pending', 2);

GO
*/



