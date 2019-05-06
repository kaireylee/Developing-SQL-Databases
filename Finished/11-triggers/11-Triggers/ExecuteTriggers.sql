Use LabDB;
Go

--Step One Insert
Insert Into CourseQuestion (Course,Question,Answer) Values ('SQL','Q11','A11');
Insert Into CourseQuestion (Course,Question,Answer) Values ('SQL','Q12','A12');
Insert Into CourseQuestion (Course,Question,Answer) Values ('C#','Q21','A21');
Insert Into CourseQuestion (Course,Question,Answer) Values ('C#','Q22','A22');
Select * From CourseQuestion;

--Step Two Update
Update CourseQuestion Set Answer='Updated Answer A11' Where (Course='SQL' And Question='Q11');
Update CourseQuestion Set Answer='Updated Answer A12' Where (Course='SQL' And Question='Q12');
Update CourseQuestion Set Answer='Updated Answer A21' Where (Course='C#' And Question='Q21');
Update CourseQuestion Set Answer='Updated Answer A22' Where (Course='C#' And Question='Q22');
Select * From CourseQuestionAnswered;

--Step Three Delete Questions
Delete From CourseQuestion;
Select * From CourseQuestionAnswered;

