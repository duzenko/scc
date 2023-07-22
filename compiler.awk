BEGIN { 
    print "#!/bin/bash\n"
}

function MapIdentifier(s) {
    if(s=="WriteLn") return "echo"
    if(s=="ReadLn") return "read"
    return s
}

{
    delete parts
    for(i=1; i<=NF; i++) {
        parts[length(parts)] = $i
    }
    for(i=0; i<length(parts); i++) {
        mapped = MapIdentifier(parts[i])
        if(i)
            output = output " " mapped
        else
            output = mapped
    } 
    print output
}