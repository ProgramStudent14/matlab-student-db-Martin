classdef StudentDatabase
    properties
        size = 10; 
        studentList = Student.empty; % Use an empty array for initialization
        number_of_students = 0;
    end 

    methods
        function obj = init(obj, size)
            obj.size = size;
            obj.studentList(obj.size) = Student(); 
            obj.number_of_students = 0; % Resets the number of students
        end 

        function obj = addStudent(obj, student)
            if obj.number_of_students < obj.size
                obj.number_of_students = obj.number_of_students + 1;
                obj.studentList(obj.number_of_students) = student; % Adds the student
            else
                fprintf('Database is full!\n');
            end
        end 

        function obj = showStudents(obj)
            for i = 1:obj.number_of_students
                fprintf('************\n');
                fprintf('User number %d\n', i);
                obj.studentList(i).showStudent();
            end 
        end 

        function saveToFile(obj, file_name)
            % Save database to .mat file
            save(file_name, 'obj'); % Save the whole object
        end 

        function obj = loadFromFile(obj, file_name)
            % Load database from .mat file
            loadedData = load(file_name);
            obj = loadedData.obj; 
        end 
    end 
end 
