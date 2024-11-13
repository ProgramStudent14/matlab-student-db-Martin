% Set up the database with a capacity for 10 students
db = db.init(10); 

% Define and populate a list of sample students with their details
sample_students = {
    {"S001", "Ben", "Smith", 20, 3.5, "Computer Engineering"},
    {"S002", "Joe", "Saltin", 21, 3.6, "Mathematics"},
    {"S003", "Charles", "Martin", 19, 3.2, "Physics"},
    {"S004", "Mario", "Lingiuni", 22, 3.8, "Chemistry"},
    {"S005", "Lucas", "Manning", 20, 3.9, "Undecided"},
    {"S006", "Chuck", "Biden", 23, 2.8, "Ancient History"},
    {"S007", "Rob", "Goodwin", 21, 3.1, "US Literature"},
    {"S008", "Bob", "Martin", 20, 3.3, "MicroEconomics"},
    {"S009", "Scott", "Gibson", 22, 3.4, "Mechanical Engineering"},
    {"S010", "Jill", "Roberts", 19, 3.7, "Business"}
};

% Add each sample student to the database
for i = 1:length(sample_students)
    student_data = sample_students{i};  % Retrieve student information
    student = Student(student_data{:});  % Create a Student object with the data
    db = db.addStudent(student);  % Insert the student into the database
end 

% Display all students currently in the database
db.showStudents();

% Save the current state of the database to a .mat file
file_name = 'student_database.mat';
db.saveToFile(file_name);

% Reload the database from the saved file
db = db.loadFromFile(file_name);

% Display all students after reloading to confirm successful loading
db.showStudents();

% Extract GPA and age data for analysis and visualization
gpas = [db.studentList.gpa];  % Gather GPA values
ages = [db.studentList.age];  % Gather age values
majors = {db.studentList.major};  % Collect major fields as a cell array of strings

% Ensure the list of majors is properly formatted as a cell array of character vectors
majors = cellstr(majors);  

% 1. Generate a histogram for GPA distribution
figure;
histogram(gpas, 'BinMethod', 'integers');
title('GPA Distribution Histogram');
xlabel('GPA');
ylabel('Number of Students');

% 2. Calculate and visualize the average GPA by major
uniqueMajors = unique(majors);  % Identify all unique majors
averageGPA = zeros(size(uniqueMajors));  % Initialize an array for average GPAs

% Compute the average GPA for each unique major
for i = 1:length(uniqueMajors)
    majorGPA = gpas(strcmp(majors, uniqueMajors{i}));  % Filter GPAs for the current major
    averageGPA(i) = mean(majorGPA);  % Compute the mean GPA for this major
end

% Display the average GPA for each major in a bar chart
figure;
bar(averageGPA);
set(gca, 'XTickLabel', uniqueMajors);
title('Average GPA by Major');
xlabel('Major');
ylabel('Average GPA');

% 3. Visualize the age distribution using a histogram
figure;
histogram(ages, 'BinMethod', 'integers');
title('Age Distribution');
xlabel('Age');
ylabel('Number of Students');
