#A user-defined function to calculate the average score of a student

function calculate_average(total, score) {
    return total / score
}


BEGIN {
    FS = ","; #Sets comma as the field separator for the csv file

    highest = -1 #Initializes highest score to a low number so the student's total score will update if they're the highest score

    lowest = 100000 #Initalizes lowest score to a high number so the student's total score will update if they're the lowest score
}

#Skips the header line of the csv file since it only provides the field names
NR == 1 {	
	next
}  

{
    name = $2 #Stores the student's name from the second field

    total = 0 #Initalizes the total to 0 so it'll reset for a new student

    #For loop to go through each score field in the 3rd column to the end of the csv file which adds up the grades to get the total score for that student
    for (i = 3; i <= NF; i++) {
        total += $i
    }

    #Calls my function to calculate the average. NF - 2 is for the first 2 fields of the csv, ID and name, so I use "- 2" to only get the scores
    avg = calculate_average(total, NF - 2)

    #A ternary operator where if the student's status is above 70, then they pass otherwise they fail.
    status = (avg >= 70) ? "Pass" : "Fail"

    #Stores the student's total score, average, and passing status in associative arrays 
    scores[name] = total
    avg_scores[name] = avg
    statuses[name] = status

    #Checks if the current student's score is the highest or lowest and updates accordingly while storing the name
    if (total > highest) {
        highest = total
        top_student = name
    }

    if (total < lowest) {
        lowest = total
        low_student = name
    }
}
#End block for when all lines are processed it'll print Student Summary: and then all of the students as well as their total score, average score, and status
END {
    print "Student List:\n"

    #For loop for all of the names or students in the array scores
    for (name in scores) {
        printf "Name: %s\n", name #%s is a placeholder for strings and will be replaced with the name of the student as well as a new line

        printf "Total Score: %d\n", scores[name] #%d is a placeholder for integers and will be replaced with the score of the student as well as a new line

        printf "Average Score: %.2f\n", avg_scores[name] #%.2f is a placeholder for float numbers or decimal numbers and only does the first 2 places after the decimal of the average score of the student as well as a new line

        printf "Status: %s\n\n", statuses[name] #%s another string placeholder and will be replaced with the status of the student with a new line which also includes another blank line to space all of the students between themselves
    }

    #Prints the top and lowest scoring students
    print "Top Scoring Student: " top_student " - " highest " points"
    print "Lowest Scoring Student: " low_student " - " lowest " points"
}

