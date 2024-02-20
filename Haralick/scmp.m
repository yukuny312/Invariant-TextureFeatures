function contains = scmp(string, list)

    contains = any(strcmpi(list, string)) || any(strcmpi(list, 'all'));

end