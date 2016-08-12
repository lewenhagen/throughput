javascript: (function () {
    var v = "1.3.2";

    if (window.jQuery) {
    	console.log("jQuery loaded");
    } else {
        var done = false;
        var script = document.createElement("script");
    	script.src = "//ajax.googleapis.com/ajax/libs/jquery/" + v + "/jquery.min.js";
    	script.onload = script.onreadystatechange = function(){
    		if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) {
    			done = true;
                console.log("Jquery loaded");
    		} else {
                console.log("Not loaded");
            }
    	};
    	document.getElementsByTagName("head")[0].appendChild(script);
    }
    
    var iframe = document.getElementById("ctl00_ContentAreaIframe");
    var innerDoc = iframe.contentDocument || iframe.contentWindow.document;
    
    var saveBirthDate = [];
    
    
    
    var Kmom = {
        "kmomNr": "",
        "courseCode": "",
        "students": []
    };
    
    if(typeof(innerDoc.getElementById("ctl05_TT").innerHTML.match(/\d+/g)) === Array()) {
        Kmom.kmomNr = "10";
    } else {
        Kmom.kmomNr = innerDoc.getElementById("ctl05_TT").innerHTML.match(/\d+/g).toString();
    }
    
    console.log("Kmom number = " + Kmom.kmomNr);
    
    var courseCodes = document.getElementsByClassName("treemenu-title")[0].children;
    var theCode = courseCodes[1].innerHTML;
    
    console.log(theCode);
    var code = theCode.split(" ");
    Kmom.courseCode = code[0];
    console.log("Course Code = " + Kmom.courseCode);
    
    
    
    var rows = innerDoc.getElementsByTagName("tr");
    
    var ok = ["A", "B", "C", "D", "E", "G"];
    
    for (var j = 1; j < rows.length; j++) {
        var Student = {
            "birth": "",
            "submitted": "",
            "onTime": false,
            "passed": false
        };
        
        var tds = rows[j].getElementsByTagName("td");
        
        if (tds[5].firstElementChild.innerHTML === "Bedömd") {
            Student.birth = tds[2].innerHTML;
            if (ok.indexOf(tds[6].innerHTML) > -1) {
                Student.passed = true;
            }
            if (!tds[3].firstElementChild) {
                Student.onTime = true;
                Student.submitted = tds[3].innerHTML;
            } else {
                Student.submitted = tds[3].firstElementChild.innerHTML;
            }
            
            Kmom.students.push(Student);
        }
    }
    var jsonObj = JSON.stringify(Kmom);
    console.log(Kmom);
    window.prompt("Copy to clipboard: Ctrl+C, Enter", jsonObj);
})();

