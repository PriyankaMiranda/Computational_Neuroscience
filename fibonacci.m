function [val] = fibonacci(i)
    if(i == 0) || (i == 1)
        val=1;
    else
        val = i + fibonacci(i-1);
    end
end