fprintf('The following are the fuctions that can be performed.\na. Matrix generation.\nb. Random number generator.\n');
prompt = 'Enter the type of function required: ';
switch(input(prompt, 's'))
    case 'a' 
        fprintf('Generating Matrix.\n1. Matrix with random numbers.\n2. Matrix with ones.\n3. Matrix with zeroes.\n4. Scalar Matrix.\n5. Custom Matrix.\n');
        prompt1 = 'Enter the type of matrix required: ';
        prompt2 = 'Enter row size: ';
        prompt3 = 'Enter column size: ';
        generate_matrix(input(prompt1,'s'),input(prompt2),input(prompt3))
    case 'b' 
        fprintf('Generating Random Number.\n');
        prompt = 'Enter your range separated with commas: ';
        choice = split(input(prompt,'s'),",");
        get_rand_no(str2double(choice(1)),str2double(choice(2)))
    otherwise
        fprintf('Invalid input' );
    return;
end

% generatae any type of vector/matrix 
function [result] = generate_matrix(type, num_rows,num_cols)
    switch(type)
        case '1' 
            result = rand(num_rows,num_cols);
            prompt='Enter range for the random numbers separated with a comma: ';
            range = split(input(prompt,'s'),",");
            [min, max] = get_min_and_max(str2double(range(1)),str2double(range(2)));
            result = (result * (max-min)) + min;
        case '2' 
            result = ones(num_rows,num_cols);
        case '3' 
            scalar_val = 0;
            result = ones(num_rows,num_cols) .* scalar_val;
        case '4'
            prompt = 'Enter the scalar value: ';
            scalar_val = input(prompt);
            result = ones(num_rows,num_cols) .* scalar_val;
        case '5'
            result = zeros(num_rows,num_cols);
            for i=1:num_rows
              for j=1:num_cols
                prompt = ['Enter custom value at the position (',int2str(i),',',int2str(j),'):'];
                x = input(prompt);
                result(i,j) = x; 
              end
            end            
        otherwise
            fprintf('Invalid input' );
        return;
    end
end

function [result] = get_rand_no(a,b)
    [min, max] = get_min_and_max(a,b);
    orig_ans = rand(1,1);
    result = (orig_ans * (max-min)) + min;
end

function [min, max] = get_min_and_max(a,b)
        max = a;
        min = b;
    if (b>a)
        max = b;
        min = a;
    end
end