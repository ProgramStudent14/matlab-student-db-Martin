classdef Student
    properties
        student_id = "";   % Student ID
        first_name = "";   % First Name
        last_name = "";    % Last Name
        age = 0;           % Age
        gpa = 0.0;         % GPA
        major = "";        % Major
    end 

    methods
        function obj = Student(id, f_name, l_name, age, gpa, major)
            if nargin > 0  %  Checks that inputs are provided
                obj.student_id = id;
                obj.first_name = f_name;
                obj.last_name = l_name;
                obj.age = age;
                obj.gpa = gpa;
                obj.major = major;
            end
        end 

        function obj = initStudent(obj)
            obj.student_id = input("What's the ID of the student? ", "s");
            obj.first_name = input("What's the first name of the student? ", "s");
            obj.last_name = input("What's the last name of the student? ", "s");
            obj.age = input("What's the age of the student? ");
            obj.gpa = input("What's the GPA of the student? ");
            obj.major = input("What's the major of the student? ", "s");
        end 

        function showStudent(obj)
            fprintf("Student ID: %s\n", obj.student_id);
            fprintf("First Name: %s\n", obj.first_name);
            fprintf("Last Name: %s\n", obj.last_name);
            fprintf("Age: %d\n", obj.age);
            fprintf("GPA: %.2f\n", obj.gpa);
            fprintf("Major: %s\n", obj.major);
        end 
    end 
end
