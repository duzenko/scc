BEGIN { 
    print "#!/bin/bash\n"
}

{
    delete parts
    for(i=1; i<=NF; i++) {
        parts[length(parts)] = $i
    }
    for(i=0; i<length(parts); i++) {
		s = parts[i]
		if(s=="WriteLn") s = "echo"
		else if(s=="ReadLn") s = "read"
		else if(s=="if") {
			s = "if [ -n"
			parts[length(parts)] = "] \nthen"
		}
        if(i)
            output = output " " s
        else
            output = s
    } 
    print output
}